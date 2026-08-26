import { describe, expect, it } from "vitest";
import { defaultSiteContent, siteContentSchema } from "./siteContent";

describe("Career Weekly editor content schema", () => {
  it("accepts the complete published Career Weekly content model", () => {
    expect(siteContentSchema.parse(defaultSiteContent)).toEqual(defaultSiteContent);
  });

  it("allows only public http(s) links or site-relative paths for published downloads", () => {
    const unsafeContent = structuredClone(defaultSiteContent);
    unsafeContent.resources.featured.downloadUrl = "javascript:alert('unsafe')";

    expect(() => siteContentSchema.parse(unsafeContent)).toThrow("Enter a full http(s) URL");
  });

  it("permits a blank live-training destination until a real session exists", () => {
    const draftContent = structuredClone(defaultSiteContent);
    draftContent.links.liveTrainingUrl = "";

    expect(siteContentSchema.parse(draftContent).links.liveTrainingUrl).toBe("");
  });

  it("keeps a concrete working-page offer and transparent sample labels in the published defaults", () => {
    expect(defaultSiteContent.hero.signupOfferLabel).toBe("GET MY FREE GUIDE");
    expect(defaultSiteContent.navigation.subscribeLabel).toBe("Get my free guide");
    expect(defaultSiteContent.hero.intro).toContain("complete free working page");
    expect(defaultSiteContent.closing.description).toContain("one weekly Friday brief");
    expect(defaultSiteContent.hero.issueNumber).toContain("SAMPLE BRIEFING");
    expect(defaultSiteContent.archive.eyebrow).toBe("FROM THE CAREER INTELLIGENCE LIBRARY");
    expect(defaultSiteContent.closing.heading).toBe("Start here.");
    expect(defaultSiteContent.closing.emphasis).toBe("Build from there.");
  });

  it("keeps the hero reward distinct from the neutral Sample Library working-page title while giving each guidance card its own educational direction", () => {
    expect(defaultSiteContent.hero.issueTitle).toBe("Evidence Before Adjectives");
    expect(defaultSiteContent.archive.leadTitle).toBe("The Career Evidence Working Page");
    expect(defaultSiteContent.pillars.map((pillar) => pillar.ctaLabel)).toEqual([
      "Explore the résumé briefing",
      "Explore interview practice",
      "Explore offer strategy",
    ]);
    expect(defaultSiteContent.pillars.map((pillar) => pillar.ctaUrl)).toEqual([
      "/resources#sample-issues",
      "/resources#sample-issues",
      "/resources#sample-issues",
    ]);
  });
});
