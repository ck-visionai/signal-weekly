import { desc, eq } from "drizzle-orm";
import { landingPageContent, landingPageContentRevisions } from "../drizzle/schema";
import {
  defaultSiteContent,
  SITE_CONTENT_KEY,
  siteContentSchema,
  type SiteContent as StructuredSiteContent,
} from "../shared/siteContent";
import { getDb } from "./db";

function parseContent(value: string | null | undefined): StructuredSiteContent {
  if (!value) return defaultSiteContent;
  try {
    return siteContentSchema.parse(JSON.parse(value));
  } catch {
    return defaultSiteContent;
  }
}

function serializeContent(content: StructuredSiteContent) {
  return JSON.stringify(siteContentSchema.parse(content));
}

async function getOrCreateRecord() {
  const db = await getDb();
  if (!db) return undefined;
  const existing = await db
    .select()
    .from(landingPageContent)
    .where(eq(landingPageContent.contentKey, SITE_CONTENT_KEY))
    .limit(1);
  if (existing[0]) return existing[0];
  const serialized = serializeContent(defaultSiteContent);
  await db.insert(landingPageContent).values({
    contentKey: SITE_CONTENT_KEY,
    draftContent: serialized,
    publishedContent: serialized,
    revision: 1,
    updatedBy: "system",
  });
  const created = await db
    .select()
    .from(landingPageContent)
    .where(eq(landingPageContent.contentKey, SITE_CONTENT_KEY))
    .limit(1);
  return created[0];
}

export async function getPublishedSiteContent() {
  const record = await getOrCreateRecord();
  return record ? parseContent(record.publishedContent) : defaultSiteContent;
}

export async function getDraftSiteContent() {
  const record = await getOrCreateRecord();
  return record
    ? { ...record, content: parseContent(record.draftContent) }
    : { id: 0, contentKey: SITE_CONTENT_KEY, revision: 0, content: defaultSiteContent };
}

export async function saveDraftSiteContent(content: StructuredSiteContent, savedBy: string | null) {
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  const record = await getOrCreateRecord();
  if (!record) throw new Error("Landing-page content record was not created");
  const parsed = siteContentSchema.parse(content);
  const nextRevision = record.revision + 1;
  const serialized = serializeContent(parsed);
  await db
    .update(landingPageContent)
    .set({ draftContent: serialized, revision: nextRevision, updatedBy: savedBy })
    .where(eq(landingPageContent.id, record.id));
  await db.insert(landingPageContentRevisions).values({
    contentId: record.id,
    revision: nextRevision,
    content: serialized,
    savedBy,
  });
  return getDraftSiteContent();
}

export async function publishSiteContent(publishedBy: string | null) {
  const db = await getDb();
  if (!db) throw new Error("Database is not available");
  const record = await getOrCreateRecord();
  if (!record) throw new Error("Landing-page content record was not created");
  const parsedDraft = parseContent(record.draftContent);
  const serialized = serializeContent(parsedDraft);
  await db
    .update(landingPageContent)
    .set({ publishedContent: serialized, updatedBy: publishedBy })
    .where(eq(landingPageContent.id, record.id));
  return { ...record, content: parsedDraft, publishedBy };
}

export async function listSiteContentRevisions() {
  const db = await getDb();
  if (!db) return [];
  const record = await getOrCreateRecord();
  if (!record) return [];
  return db
    .select({
      id: landingPageContentRevisions.id,
      revision: landingPageContentRevisions.revision,
      savedBy: landingPageContentRevisions.savedBy,
      createdAt: landingPageContentRevisions.createdAt,
    })
    .from(landingPageContentRevisions)
    .where(eq(landingPageContentRevisions.contentId, record.id))
    .orderBy(desc(landingPageContentRevisions.revision));
}

export async function exportSiteContent() {
  const content = await getPublishedSiteContent();
  return {
    schemaVersion: "career-weekly.site-content.v1",
    contentKey: SITE_CONTENT_KEY,
    exportedAt: new Date().toISOString(),
    content,
  };
}

export type { StructuredSiteContent };
