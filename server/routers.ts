import { z } from "zod";
import { parse as parseCookie } from "cookie";
import { COOKIE_NAME } from "@shared/const";
import { getSessionCookieOptions } from "./_core/cookies";
import { createHeartbeatJob, updateHeartbeatJob } from "./_core/heartbeat";
import { systemRouter } from "./_core/systemRouter";
import { adminProcedure, publicProcedure, router } from "./_core/trpc";
import {
  createEdition,
  getEditionById,
  getPublishedEditionById,
  listEditorEditions,
  listEditionSources,
  listPublicEditions,
  publishDueEditions,
  replaceEditionSources,
  updateEdition,
  getReleaseControl,
  updateReleaseControl,
  rollbackEdition,
} from "./editionDb";

const editionStatus = z.enum(["draft", "scheduled", "published", "archived"]);
const sourceInput = z.object({
  title: z.string().min(1).max(240),
  url: z.string().url(),
  publisher: z.string().max(180).optional().nullable(),
  note: z.string().max(2000).optional().nullable(),
});
const editionFields = {
  issueNumber: z.number().int().min(1).max(100),
  slug: z.string().min(1).max(160),
  title: z.string().min(1).max(220),
  subtitle: z.string().min(1).max(5000),
  summary: z.string().min(1).max(5000),
  status: editionStatus.optional(),
  releaseAt: z.coerce.date().optional().nullable(),
  publishedAt: z.coerce.date().optional().nullable(),
    previewUrl: z.string().url().optional().nullable(),
    completeUrl: z.string().url().optional().nullable(),
    previewKey: z.string().max(1000).optional().nullable(),
    completeKey: z.string().max(1000).optional().nullable(),
    previewContent: z.string().max(200000).optional().nullable(),
    completeContent: z.string().max(500000).optional().nullable(),
  previewPages: z.number().int().min(1).max(100).optional().nullable(),
  completePages: z.number().int().min(1).max(100).optional().nullable(),
  masthead: z.string().min(1).max(120).optional(),
};

export const appRouter = router({
  system: systemRouter,
  auth: router({
    me: publicProcedure.query(opts => opts.ctx.user),
    logout: publicProcedure.mutation(({ ctx }) => {
      const cookieOptions = getSessionCookieOptions(ctx.req);
      ctx.res.clearCookie(COOKIE_NAME, { ...cookieOptions, maxAge: -1 });
      return { success: true } as const;
    }),
  }),
  editions: router({
    public: publicProcedure.input(z.object({ limit: z.number().int().min(1).max(12).default(12), offset: z.number().int().min(0).default(0) }).optional()).query(({ input }) =>
      listPublicEditions(input?.limit ?? 12, input?.offset ?? 0)
    ),
    archive: publicProcedure.query(() => listPublicEditions(100, 0)),
    get: publicProcedure.input(z.object({ id: z.number().int().positive() })).query(({ input }) => getPublishedEditionById(input.id)),
    editorList: adminProcedure.query(() => listEditorEditions()),
    editorSources: adminProcedure.input(z.object({ editionId: z.number().int().positive() })).query(({ input }) => listEditionSources(input.editionId)),
    create: adminProcedure.input(z.object(editionFields).extend({ sources: z.array(sourceInput).default([]) })).mutation(async ({ input }) => {
      const { sources, ...edition } = input;
      const created = await createEdition({ ...edition, masthead: edition.masthead ?? "CAREER WEEKLY · A SIGNRL PUBLICATION" });
      if (!created) throw new Error("Edition was not created");
      await replaceEditionSources(created.id, sources);
      return { ...created, sources: await listEditionSources(created.id) };
    }),
    update: adminProcedure.input(z.object({ id: z.number().int().positive(), patch: z.object(editionFields).partial(), sources: z.array(sourceInput).optional() })).mutation(async ({ input }) => {
      const updated = await updateEdition(input.id, input.patch);
      if (!updated) throw new Error("Edition was not found");
      if (input.sources) await replaceEditionSources(input.id, input.sources);
      return { ...updated, sources: await listEditionSources(input.id) };
    }),
    publishNow: adminProcedure.input(z.object({ id: z.number().int().positive() })).mutation(async ({ input }) => {
      if ((await listEditionSources(input.id)).length === 0) throw new Error("Add at least one citation source before publishing");
      return updateEdition(input.id, { status: "published", publishedAt: new Date() });
    }),
    schedule: adminProcedure.input(z.object({ id: z.number().int().positive(), releaseAt: z.coerce.date() })).mutation(async ({ input }) => {
      if ((await listEditionSources(input.id)).length === 0) throw new Error("Add at least one citation source before scheduling");
      return updateEdition(input.id, { status: "scheduled", releaseAt: input.releaseAt, publishedAt: null });
    }),
    pause: adminProcedure.input(z.object({ id: z.number().int().positive() })).mutation(({ input }) =>
      updateEdition(input.id, { status: "draft" })
    ),
    reschedule: adminProcedure.input(z.object({ id: z.number().int().positive(), releaseAt: z.coerce.date() })).mutation(async ({ input }) => {
      if ((await listEditionSources(input.id)).length === 0) throw new Error("Add at least one citation source before scheduling");
      return updateEdition(input.id, { status: "scheduled", releaseAt: input.releaseAt });
    }),
    rollback: adminProcedure.input(z.object({ id: z.number().int().positive() })).mutation(async ({ input }) => {
      return rollbackEdition(input.id);
    }),
    releaseDue: adminProcedure.mutation(() => publishDueEditions()),
    releaseControl: adminProcedure.query(() => getReleaseControl()),
    setupFridaySchedule: adminProcedure.mutation(async ({ ctx }) => {
      const control = await getReleaseControl();
      if (control.scheduleCronTaskUid) return control;
      const sessionToken = parseCookie(ctx.req.headers.cookie ?? "")[COOKIE_NAME] ?? "";
      const job = await createHeartbeatJob({
        name: control.name,
        cron: control.cronExpression,
        path: "/api/scheduled/release-friday-edition",
        description: "Automatically publish due Career Weekly editions every Friday at 08:00 UTC.",
      }, sessionToken);
      return updateReleaseControl(control.id, { scheduleCronTaskUid: job.taskUid, enabled: 1 });
    }),
    setScheduleEnabled: adminProcedure.input(z.object({ enabled: z.boolean() })).mutation(async ({ ctx, input }) => {
      const control = await getReleaseControl();
      if (!control.scheduleCronTaskUid) throw new Error("Friday schedule has not been created yet");
      const sessionToken = parseCookie(ctx.req.headers.cookie ?? "")[COOKIE_NAME] ?? "";
      await updateHeartbeatJob(control.scheduleCronTaskUid, { enable: input.enabled }, sessionToken);
      return updateReleaseControl(control.id, { enabled: input.enabled ? 1 : 0 });
    }),
  }),
});

export type AppRouter = typeof appRouter;
