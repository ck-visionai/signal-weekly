import { describe, expect, it } from "vitest";
import { defaultSiteContent, siteContentSchema } from "./siteContent";

describe("Signal Weekly editor content schema", () => {
  it("accepts the complete published Signal Weekly content model", () => {
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
});
