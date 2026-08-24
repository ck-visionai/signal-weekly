import { COOKIE_NAME } from "@shared/const";
import { TRPCError } from "@trpc/server";
import { z } from "zod";
import { getSiteContent, saveSiteContent } from "./db";
import { getSessionCookieOptions } from "./_core/cookies";
import { systemRouter } from "./_core/systemRouter";
import { adminProcedure, publicProcedure, router } from "./_core/trpc";
import { storagePut } from "./storage";
import { siteContentSchema } from "../shared/siteContent";

const permittedUploadTypes = ["application/pdf", "image/jpeg", "image/png", "image/webp"] as const;
const maxUploadBytes = 10 * 1024 * 1024;

function cleanFileName(fileName: string) {
  return fileName.replace(/[^a-zA-Z0-9._-]/g, "-").replace(/-+/g, "-").slice(0, 120) || "signal-weekly-file";
}

export const appRouter = router({
    // if you need to use socket.io, read and register route in server/_core/index.ts, all api should start with '/api/' so that the gateway can route correctly
  system: systemRouter,
  auth: router({
    me: publicProcedure.query(opts => opts.ctx.user),
    logout: publicProcedure.mutation(({ ctx }) => {
      const cookieOptions = getSessionCookieOptions(ctx.req);
      ctx.res.clearCookie(COOKIE_NAME, { ...cookieOptions, maxAge: -1 });
      return {
        success: true,
      } as const;
    }),
  }),
  content: router({
    public: publicProcedure.query(() => getSiteContent()),
    editor: adminProcedure.query(() => getSiteContent()),
    save: adminProcedure.input(siteContentSchema).mutation(async ({ ctx, input }) => {
      return saveSiteContent(input, ctx.user.id);
    }),
    uploadAsset: adminProcedure
      .input(z.object({
        fileName: z.string().trim().min(1).max(160),
        contentType: z.enum(permittedUploadTypes),
        base64: z.string().min(1),
      }))
      .mutation(async ({ ctx, input }) => {
        const bytes = Buffer.from(input.base64, "base64");
        if (!bytes.length || bytes.length > maxUploadBytes) {
          throw new TRPCError({ code: "BAD_REQUEST", message: "Choose a PDF or image smaller than 10 MB." });
        }
        const fileName = cleanFileName(input.fileName);
        return storagePut(`signal-weekly/${ctx.user.id}/${fileName}`, bytes, input.contentType);
      }),
  }),
});

export type AppRouter = typeof appRouter;
