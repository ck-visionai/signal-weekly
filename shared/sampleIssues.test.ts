import { describe, expect, it } from "vitest";
import { sampleIssues } from "./sampleIssues";

describe("sample briefing library", () => {
  it("contains twelve transparently numbered preview editions", () => {
    expect(sampleIssues).toHaveLength(12);
    expect(sampleIssues.map((issue) => issue.number)).toEqual(["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]);
    expect(sampleIssues.every((issue) => issue.previewUrl.endsWith(".pdf") && issue.completeUrl.endsWith(".pdf"))).toBe(true);
  });

  it("offers exactly one full sample publicly while preserving the staged library", () => {
    expect(sampleIssues.filter((issue) => issue.freeComplete)).toHaveLength(1);
    expect(sampleIssues.find((issue) => issue.freeComplete)?.number).toBe("01");
  });

  it("labels the remaining editions as progressive email deliveries rather than immediate downloads", () => {
    expect(sampleIssues.find((issue) => issue.number === "02")?.deliveryLabel).toBe("Full edition arrives weekly by email");
    expect(sampleIssues.filter((issue) => !issue.freeComplete).every((issue) => issue.deliveryLabel.includes("arrives") && issue.deliveryLabel.includes("email"))).toBe(true);
  });
});
