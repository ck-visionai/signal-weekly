import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";
import { getResourcesAnchorTarget, SAMPLE_ISSUES_ID } from "./resourcesNavigation";

describe("Resources anchor navigation", () => {
  it("identifies the Sample Briefing Library hash used in the welcome email", () => {
    expect(getResourcesAnchorTarget("#sample-issues")).toBe(SAMPLE_ISSUES_ID);
  });

  it("uses the approved weekly library-growth message", () => {
    const resourcesSource = readFileSync(new URL("../client/src/pages/Resources.tsx", import.meta.url), "utf8");
    expect(resourcesSource).toContain("The library grows every week");
    expect(resourcesSource).toContain("designed to empower your next career decision.");
  });

  it("does not scroll for unrelated or absent hashes", () => {
    expect(getResourcesAnchorTarget("")).toBeNull();
    expect(getResourcesAnchorTarget("#ats-audit")).toBeNull();
  });
});
