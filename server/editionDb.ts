import { and, desc, eq, lte } from "drizzle-orm";
import { editionSources, editions, releaseControls, type InsertEdition, type InsertEditionSource } from "../drizzle/schema";
import { getDb } from "./db";
import { releasePatch } from "./releaseTransitions";

type PublicEditionCandidate = {
  id: number;
  previewKey?: string | null;
  completeKey?: string | null;
  previewUrl?: string | null;
  completeUrl?: string | null;
};

function withProtectedDelivery<T extends PublicEditionCandidate>(edition: T): T {
  return {
    ...edition,
    previewUrl: edition.previewKey ? `/api/editions/${edition.id}/preview` : edition.previewUrl,
    completeUrl: edition.completeKey ? `/api/editions/${edition.id}/complete` : edition.completeUrl,
  };
}

export async function listPublicEditions(limit = 12, offset = 0) {
  const db = await getDb();
  if (!db) return [];
  const recent = await db.select().from(editions)
    .where(eq(editions.status, "published"))
    .orderBy(desc(editions.issueNumber))
    .limit(limit)
    .offset(offset);
  if (limit !== 12 || offset !== 0) return recent.map(withProtectedDelivery);
  const pinned = await db.select().from(editions).where(and(eq(editions.status, "published"), eq(editions.issueNumber, 1))).limit(1);
  if (!pinned[0] || recent.some(edition => edition.id === pinned[0].id)) return recent.map(withProtectedDelivery);
  return [pinned[0], ...recent.slice(0, 11)].map(withProtectedDelivery);
}

export async function getEditionById(id: number) {
  const db = await getDb();
  if (!db) return undefined;
  const result = await db.select().from(editions).where(eq(editions.id, id)).limit(1);
  return result[0];
}

export async function getPublishedEditionById(id: number) {
  const db = await getDb();
  if (!db) return undefined;
  const result = await db.select().from(editions).where(and(eq(editions.id, id), eq(editions.status, "published"))).limit(1);
  return result[0] ? withProtectedDelivery(result[0]) : undefined;
}

export async function listEditorEditions() {
  const db = await getDb();
  if (!db) return [];
  return db.select().from(editions).orderBy(desc(editions.issueNumber));
}

export async function listEditionSources(editionId: number) {
  const db = await getDb();
  if (!db) return [];
  return db.select().from(editionSources).where(eq(editionSources.editionId, editionId)).orderBy(desc(editionSources.accessedAt));
}

export function assertMutableIssueNumber(issueNumber: number) {
  if (issueNumber === 1) throw new Error("Edition 01 is immutable");
}

export async function createEdition(input: InsertEdition) {
  assertMutableIssueNumber(input.issueNumber);
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  const result = await db.insert(editions).values(input);
  return getEditionById(Number(result[0].insertId));
}

export async function assertEditionMutable(id: number) {
  const edition = await getEditionById(id);
  if (!edition) throw new Error("Edition was not found");
  assertMutableIssueNumber(edition.issueNumber);
  return edition;
}

export async function updateEdition(id: number, input: Partial<InsertEdition>) {
  await assertEditionMutable(id);
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  await db.update(editions).set(input).where(eq(editions.id, id));
  return getEditionById(id);
}

export async function replaceEditionSources(editionId: number, sources: Array<Omit<InsertEditionSource, "editionId">>) {
  await assertEditionMutable(editionId);
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  await db.delete(editionSources).where(eq(editionSources.editionId, editionId));
  if (sources.length > 0) {
    await db.insert(editionSources).values(sources.map(source => ({ ...source, editionId })));
  }
  return listEditionSources(editionId);
}

export async function getReleaseControl() {
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  const existing = await db.select().from(releaseControls).where(eq(releaseControls.name, "friday-edition-release")).limit(1);
  if (existing[0]) return existing[0];
  await db.insert(releaseControls).values({ name: "friday-edition-release", cronExpression: "0 0 8 * * 5", enabled: 1 });
  const created = await db.select().from(releaseControls).where(eq(releaseControls.name, "friday-edition-release")).limit(1);
  if (!created[0]) throw new Error("Release control was not created");
  return created[0];
}

export async function updateReleaseControl(id: number, input: Partial<typeof releaseControls.$inferInsert>) {
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  await db.update(releaseControls).set(input).where(eq(releaseControls.id, id));
  const updated = await db.select().from(releaseControls).where(eq(releaseControls.id, id)).limit(1);
  return updated[0];
}

export async function getReleaseControlByTaskUid(taskUid: string) {
  const db = await getDb();
  if (!db) return undefined;
  const result = await db.select().from(releaseControls).where(eq(releaseControls.scheduleCronTaskUid, taskUid)).limit(1);
  return result[0];
}

export async function getEditionByScheduleTaskUid(taskUid: string) {
  const db = await getDb();
  if (!db) return undefined;
  const result = await db.select().from(editions).where(eq(editions.scheduleCronTaskUid, taskUid)).limit(1);
  return result[0];
}

export async function rollbackEdition(id: number) {
  await assertEditionMutable(id);
  return updateEdition(id, releasePatch("rollback"));
}

export async function publishDueEditions(now = new Date()) {
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  const due = await db.select().from(editions).where(and(eq(editions.status, "scheduled"), lte(editions.releaseAt, now)));
  const publishable: typeof due = [];
  for (const edition of due) {
    if ((await listEditionSources(edition.id)).length > 0) publishable.push(edition);
  }
  for (const edition of publishable) {
    await db.update(editions).set(releasePatch("publish", undefined, now)).where(and(eq(editions.id, edition.id), eq(editions.status, "scheduled")));
  }
  return publishable;
}

export async function listDueEditions(now = new Date()) {
  const db = await getDb();
  if (!db) return [];
  return db.select().from(editions).where(and(eq(editions.status, "scheduled"), lte(editions.releaseAt, now)));
}
