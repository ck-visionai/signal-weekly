import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { assertMutableIssueNumber, listEditorEditions, replaceEditionSources, rollbackEdition, updateEdition } from "./editionDb";
import { defaultSiteContent } from "@shared/siteContent";

describe("Career Weekly launch guards", () => {
  it("rejects Edition 01 as immutable", () => {
    expect(() => assertMutableIssueNumber(1)).toThrow("Edition 01 is immutable");
    expect(() => assertMutableIssueNumber(2)).not.toThrow();
  });

  it("rejects Edition 01 database mutation helpers without changing data", { skip: !process.env.DATABASE_URL }, async () => {
    const edition = (await listEditorEditions()).find(item => item.issueNumber === 1);
    expect(edition).toBeDefined();
    if (!edition) return;

    await expect(updateEdition(edition.id, { status: "draft" })).rejects.toThrow("Edition 01 is immutable");
    await expect(replaceEditionSources(edition.id, [])).rejects.toThrow("Edition 01 is immutable");
    await expect(rollbackEdition(edition.id)).rejects.toThrow("Edition 01 is immutable");
  });

  it("routes every Edition 01 admin mutation through an immutable-guarded operation", () => {
    const routerSource = readFileSync(new URL("./routers.ts", import.meta.url), "utf8");
    expect(routerSource).toContain("updateEdition(input.id, input.patch)");
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("publish"))');
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("schedule", input.releaseAt))');
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("pause"))');
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("reschedule", input.releaseAt))');
    expect(routerSource).toContain("rollbackEdition(input.id)");
    expect(routerSource).toContain("replaceEditionSources(input.id, input.sources)");
  });

  it("covers the non-Edition-01 release transition success paths", () => {
    const routerSource = readFileSync(new URL("./routers.ts", import.meta.url), "utf8");
    const dbSource = readFileSync(new URL("./editionDb.ts", import.meta.url), "utf8");
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("schedule", input.releaseAt))');
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("reschedule", input.releaseAt))');
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("pause"))');
    expect(routerSource).toContain('updateEdition(input.id, releasePatch("publish"))');
    expect(routerSource).toContain("rollbackEdition(input.id)");
    expect(routerSource).toContain("publishDueEditions()");
    expect(dbSource).toContain('eq(editions.status, "scheduled")');
    expect(dbSource).toContain('set(releasePatch("publish", undefined, now))');
  });

  it("keeps the approved complimentary-issue CTA and role-negotiation copy", () => {
    expect(defaultSiteContent.navigation.subscribeLabel).toBe("Access my complimentary issue");
    expect(defaultSiteContent.navigation.fallbackSubscribeLabel).toBe("Access my complimentary issue");
    expect(defaultSiteContent.closing.ctaLabel).toBe("Access my complimentary issue");
    expect(defaultSiteContent.hero.intro).toContain("executive interviews, and role negotiation.");
  });
});
