import { describe, expect, it } from "vitest";
import { getResourcesAnchorTarget, SAMPLE_ISSUES_ID } from "./resourcesNavigation";

describe("Resources anchor navigation", () => {
  it("identifies the Sample Briefing Library hash used in the welcome email", () => {
    expect(getResourcesAnchorTarget("#sample-issues")).toBe(SAMPLE_ISSUES_ID);
  });

  it("does not scroll for unrelated or absent hashes", () => {
    expect(getResourcesAnchorTarget("")).toBeNull();
    expect(getResourcesAnchorTarget("#ats-audit")).toBeNull();
  });
});
