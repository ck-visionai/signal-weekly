import { int, mysqlEnum, mysqlTable, text, timestamp, varchar } from "drizzle-orm/mysql-core";
import { relations } from "drizzle-orm";

/**
 * Core user table backing auth flow.
 * Extend this file with additional tables as your product grows.
 * Columns use camelCase to match both database fields and generated types.
 */
export const users = mysqlTable("users", {
  /**
   * Surrogate primary key. Auto-incremented numeric value managed by the database.
   * Use this for relations between tables.
   */
  id: int("id").autoincrement().primaryKey(),
  /** Manus OAuth identifier (openId) returned from the OAuth callback. Unique per user. */
  openId: varchar("openId", { length: 64 }).notNull().unique(),
  name: text("name"),
  email: varchar("email", { length: 320 }),
  loginMethod: varchar("loginMethod", { length: 64 }),
  role: mysqlEnum("role", ["user", "admin"]).default("user").notNull(),
  createdAt: timestamp("createdAt").defaultNow().notNull(),
  updatedAt: timestamp("updatedAt").defaultNow().onUpdateNow().notNull(),
  lastSignedIn: timestamp("lastSignedIn").defaultNow().notNull(),
});

export type User = typeof users.$inferSelect;
export type InsertUser = typeof users.$inferInsert;

export const landingPageContent = mysqlTable("landingPageContent", {
  id: int("id").autoincrement().primaryKey(),
  contentKey: varchar("contentKey", { length: 120 }).notNull().unique(),
  draftContent: text("draftContent").notNull(),
  publishedContent: text("publishedContent").notNull(),
  revision: int("revision").notNull().default(1),
  updatedBy: varchar("updatedBy", { length: 64 }),
  createdAt: timestamp("createdAt").defaultNow().notNull(),
  updatedAt: timestamp("updatedAt").defaultNow().onUpdateNow().notNull(),
});

export type LandingPageContent = typeof landingPageContent.$inferSelect;
export type InsertLandingPageContent = typeof landingPageContent.$inferInsert;

export const landingPageContentRevisions = mysqlTable("landingPageContentRevisions", {
  id: int("id").autoincrement().primaryKey(),
  contentId: int("contentId").notNull(),
  revision: int("revision").notNull(),
  content: text("content").notNull(),
  savedBy: varchar("savedBy", { length: 64 }),
  createdAt: timestamp("createdAt").defaultNow().notNull(),
});

export type LandingPageContentRevision = typeof landingPageContentRevisions.$inferSelect;
export type InsertLandingPageContentRevision = typeof landingPageContentRevisions.$inferInsert;

export const editions = mysqlTable("editions", {
  id: int("id").autoincrement().primaryKey(),
  issueNumber: int("issueNumber").notNull().unique(),
  slug: varchar("slug", { length: 160 }).notNull().unique(),
  title: varchar("title", { length: 220 }).notNull(),
  subtitle: text("subtitle").notNull(),
  status: mysqlEnum("status", ["draft", "scheduled", "published", "archived"]).default("draft").notNull(),
  releaseAt: timestamp("releaseAt"),
  publishedAt: timestamp("publishedAt"),
  previewUrl: text("previewUrl"),
  completeUrl: text("completeUrl"),
  previewKey: text("previewKey"),
  completeKey: text("completeKey"),
  previewContent: text("previewContent"),
  completeContent: text("completeContent"),
  previewPages: int("previewPages"),
  completePages: int("completePages"),
  masthead: varchar("masthead", { length: 120 }).default("CAREER WEEKLY · A SIGNRL PUBLICATION").notNull(),
  summary: text("summary").notNull(),
  scheduleCronTaskUid: varchar("scheduleCronTaskUid", { length: 65 }),
  createdAt: timestamp("createdAt").defaultNow().notNull(),
  updatedAt: timestamp("updatedAt").defaultNow().onUpdateNow().notNull(),
});

export const editionSources = mysqlTable("editionSources", {
  id: int("id").autoincrement().primaryKey(),
  editionId: int("editionId").notNull(),
  title: varchar("title", { length: 240 }).notNull(),
  url: text("url").notNull(),
  publisher: varchar("publisher", { length: 180 }),
  accessedAt: timestamp("accessedAt").defaultNow().notNull(),
  note: text("note"),
});

export const editionsRelations = relations(editions, ({ many }) => ({
  sources: many(editionSources),
}));

export const releaseControls = mysqlTable("releaseControls", {
  id: int("id").autoincrement().primaryKey(),
  name: varchar("name", { length: 120 }).notNull().unique(),
  cronExpression: varchar("cronExpression", { length: 40 }).notNull().default("0 0 8 * * 5"),
  enabled: int("enabled").notNull().default(1),
  scheduleCronTaskUid: varchar("scheduleCronTaskUid", { length: 65 }),
  createdAt: timestamp("createdAt").defaultNow().notNull(),
  updatedAt: timestamp("updatedAt").defaultNow().onUpdateNow().notNull(),
});

export const editionSourcesRelations = relations(editionSources, ({ one }) => ({
  edition: one(editions, {
    fields: [editionSources.editionId],
    references: [editions.id],
  }),
}));

export type Edition = typeof editions.$inferSelect;
export type InsertEdition = typeof editions.$inferInsert;
export type EditionSource = typeof editionSources.$inferSelect;
export type InsertEditionSource = typeof editionSources.$inferInsert;
export type ReleaseControl = typeof releaseControls.$inferSelect;