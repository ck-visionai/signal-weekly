import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";

const content = readFileSync(new URL("./siteContent.ts", import.meta.url), "utf8");
const onboarding = readFileSync(new URL("../docs/SUBSCRIBER_ONBOARDING_PLAN.md", import.meta.url), "utf8");

describe("guided Career Intelligence Library launch model", () => {
  it("explains curated catch-up without promising unrestricted archive downloads", () => {
    expect(content).toContain("A guided library for the career decisions");
    expect(content).toContain("most relevant past briefings by email");
    expect(onboarding).toContain("two subscriber touchpoints per week");
    expect(onboarding).toContain("Do not enable unrestricted");
  });
});
