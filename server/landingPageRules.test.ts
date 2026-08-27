import { describe, expect, it } from "vitest";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";

const routerSource = readFileSync(resolve(process.cwd(), "server/routers.ts"), "utf8");
const contractSource = readFileSync(resolve(process.cwd(), "docs/LANDING_PAGE_CONTENT_CONTRACT.md"), "utf8");
const entrypointSource = readFileSync(resolve(process.cwd(), "server/_core/index.ts"), "utf8");

describe("landing-page editor boundaries", () => {
  it("keeps public delivery separate from protected editing", () => {
    expect(routerSource).toContain("siteContent: publicProcedure.query");
    expect(routerSource).toContain("editor: adminProcedure.query");
    expect(routerSource).toContain("saveDraft: adminProcedure.input(siteContentSchema)");
    expect(routerSource).toContain("publish: adminProcedure.mutation");
    expect(routerSource).toContain("restoreRevision: adminProcedure.input");
  });

  it("exposes the stable migration contract", () => {
    expect(entrypointSource).toContain('app.get("/api/content/landing-page", deliverPublishedLandingPageContent)');
    expect(entrypointSource).toContain('schemaVersion: "career-weekly.site-content.v1"');
    expect(routerSource).toContain("export: adminProcedure.query(() => exportSiteContent())");
    expect(contractSource).toContain("career-weekly.site-content.v1");
    expect(contractSource).toContain("weekly publishing backend");
    expect(contractSource).toContain("media` array");
    expect(contractSource).toContain("restoration remains draft-only");
  });
});
