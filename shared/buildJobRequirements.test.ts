// Job requirement builder tests — Signrl Day 1 module 3 (deterministic)
import { describe, expect, it } from "vitest";

import { buildJobRequirements } from "./buildJobRequirements";

const JD = `
Position: Field Technician

Requirements:
- Bachelor's degree in engineering
- 5 years of experience with rotating equipment
- AWS certification preferred by hiring team

Nice to have:
- Docker exposure
- Kubernetes exposure

Responsibilities:
- Manage the maintenance planning process
- Coordinate with operations teams

We are an equal opportunity employer.
`;

describe("buildJobRequirements", () => {
  it("routes bullets under Requirements to required", () => {
    const result = buildJobRequirements(JD);

    expect(result.requiredRequirements.length).toBeGreaterThanOrEqual(3);
    expect(
      result.requiredRequirements.some((r) => r.canonical.includes("Bachelor")),
    ).toBe(true);
    expect(
      result.requiredRequirements.every((r) => r.importance === "required"),
    ).toBe(true);
  });

  it("routes bullets under Nice to have to preferred", () => {
    const result = buildJobRequirements(JD);

    expect(result.preferredRequirements.map((r) => r.canonical)).toEqual([
      "Docker exposure",
      "Kubernetes exposure",
    ]);
    expect(
      result.preferredRequirements.every((r) => r.importance === "preferred"),
    ).toBe(true);
  });

  it("routes bullets under Responsibilities to the responsibilities bucket", () => {
    const result = buildJobRequirements(JD);

    expect(result.responsibilities.length).toBe(2);
    expect(result.responsibilities[0].category).toBe("responsibility");
  });

  it("allRequirements combines and deduplicates every bucket", () => {
    const result = buildJobRequirements(JD);

    expect(result.allRequirements.length).toBe(
      result.requiredRequirements.length +
        result.preferredRequirements.length +
        result.responsibilities.length,
    );
  });

  it("keeps the verbatim source phrase for evidence display", () => {
    const result = buildJobRequirements(JD);
    const degree = result.requiredRequirements.find((r) =>
      r.canonical.includes("Bachelor"),
    );

    expect(degree?.sourcePhrase).toContain("Bachelor");
    expect(degree?.sourcePhrase.startsWith("- ")).toBe(false);
  });

  it("splits compound sentences into separate matchable requirements", () => {
    const result = buildJobRequirements(
      "Requirements:\n- 5 years of experience; strong SQL skills",
    );

    expect(result.requiredRequirements.map((r) => r.canonical)).toEqual([
      "5 years of experience",
      "strong SQL skills",
    ]);
  });

  it("filters equal-opportunity boilerplate", () => {
    const result = buildJobRequirements(JD);

    expect(
      result.allRequirements.some((r) => /equal opportunity/i.test(r.canonical)),
    ).toBe(false);
  });

  it("guesses sensible categories", () => {
    const result = buildJobRequirements(JD);
    const byText = new Map(result.allRequirements.map((r) => [r.canonical, r]));

    expect(byText.get("Bachelor's degree in engineering")?.category).toBe("degree");
    expect(byText.get("AWS certification preferred by hiring team")?.category).toBe(
      "certification",
    );
  });

  it("defaults to required bucket before any header appears", () => {
    const result = buildJobRequirements("- Kubernetes operation experience");

    expect(result.requiredRequirements).toHaveLength(1);
    expect(result.requiredRequirements[0].importance).toBe("required");
  });

  it("is deterministic for identical input", () => {
    expect(buildJobRequirements(JD)).toEqual(buildJobRequirements(JD));
  });

  it("handles empty input without throwing", () => {
    const result = buildJobRequirements("");

    expect(result.allRequirements).toHaveLength(0);
    expect(result.requiredRequirements).toHaveLength(0);
  });
});
