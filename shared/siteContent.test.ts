import { describe, expect, it } from "vitest";
import { defaultSiteContent, SITE_CONTENT_KEY, siteContentSchema } from "./siteContent";

describe("structured landing-page content", () => {
  it("keeps the approved defaults valid and CMS-addressable", () => {
    expect(siteContentSchema.parse(defaultSiteContent)).toEqual(defaultSiteContent);
    expect(SITE_CONTENT_KEY).toBe("signal-weekly-site");
    expect(defaultSiteContent.seo.title).toContain("Career Weekly");
  });

  it("rejects unsafe CTA URLs instead of storing arbitrary values", () => {
    const invalid = structuredClone(defaultSiteContent);
    invalid.hero.leadUrl = "javascript:alert(1)";
    expect(() => siteContentSchema.parse(invalid)).toThrow();
  });

  it("keeps CMS migration sections stable", () => {
    expect(Object.keys(defaultSiteContent)).toEqual([
      "seo",
      "identity",
      "hero",
      "quiet",
      "navigation",
      "inside",
      "pillars",
      "archive",
      "practice",
      "closing",
      "resources",
      "links",
      "footer",
    ]);
  });
});
