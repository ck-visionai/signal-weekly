// Day 1 test pack — deterministic matcher (Signrl spec section 7)
import { describe, expect, it } from "vitest";

import {
  matchCandidateToJob,
  type CandidateMatchProfile,
  type CandidateMatchRequirement,
} from "./matchCandidateToJob";
import type { NormalizedJobDescription, NormalizedRequirement } from "./jobNormalizationTypes";

function req(
  canonical: string,
  category: NormalizedRequirement["category"] = "skill",
  importance: NormalizedRequirement["importance"] = "required",
): NormalizedRequirement {
  return {
    canonical,
    sourcePhrase: canonical,
    category,
    importance,
    confidence: 0.95,
  };
}

function job(overrides: Partial<NormalizedJobDescription> = {}): NormalizedJobDescription {
  return {
    title: "Field Technician",
    requiredRequirements: [],
    preferredRequirements: [],
    responsibilities: [],
    allRequirements: [],
    ...overrides,
  };
}

function candidate(list: string[]): CandidateMatchProfile {
  const requirements: CandidateMatchRequirement[] = list.map((canonical) => ({
    canonical,
    category: "skill",
    source: "resume",
  }));
  return { requirements, canonicalTitle: null, yearsExperience: null };
}

describe("matchCandidateToJob", () => {
  it("scores a perfect required-only match at 100", () => {
    const j = job({
      requiredRequirements: [req("Kubernetes"), req("React")],
      allRequirements: [req("Kubernetes"), req("React")],
    });
    const result = matchCandidateToJob(candidate(["kubernetes", "react"]), j);

    expect(result.score).toBe(100);
    expect(result.totalRequired).toBe(2);
    expect(result.matchedRequired).toBe(2);
    expect(result.missingRequirements).toHaveLength(0);
  });

  it("does not let 'java' match 'javascript' (token boundaries)", () => {
    const j = job({
      requiredRequirements: [req("Java")],
      allRequirements: [req("Java")],
    });
    const result = matchCandidateToJob(candidate(["javascript"]), j);

    expect(result.matchedRequired).toBe(0);
    expect(result.score).toBe(0);
  });

  it("normalizes case and punctuation", () => {
    const j = job({
      requiredRequirements: [req("Amazon Web Services (AWS)")],
      allRequirements: [req("Amazon Web Services (AWS)")],
    });
    const result = matchCandidateToJob(candidate(["amazon web services aws"]), j);

    expect(result.matchedRequired).toBe(1);
  });

  it("partial matches count as 0.5", () => {
    // 4-token requirement; candidate shares 2 tokens but also has an
    // unrelated token, so neither set contains the other: overlap = 2/4 = 0.5
    const j = job({
      requiredRequirements: [req("react typescript node graphql")],
      allRequirements: [req("react typescript node graphql")],
    });
    const result = matchCandidateToJob(candidate(["react typescript vue"]), j);

    expect(result.partialRequirements).toHaveLength(1);
    expect(result.score).toBe(50);
  });

  it("weights required 80 / preferred 20 when both exist", () => {
    const j = job({
      requiredRequirements: [req("Kubernetes")],
      preferredRequirements: [req("Docker", "skill", "preferred")],
      allRequirements: [req("Kubernetes"), req("Docker", "skill", "preferred")],
    });
    const result = matchCandidateToJob(candidate(["kubernetes"]), j);

    expect(result.requiredScore).toBe(100);
    expect(result.preferredScore).toBe(0);
    expect(result.score).toBe(80);
  });

  it("scores 100 when the job has no requirements at all", () => {
    const result = matchCandidateToJob(candidate([]), job());

    expect(result.score).toBe(100);
  });

  it("returns 0 for a candidate with no evidence", () => {
    const j = job({
      requiredRequirements: [req("Kubernetes")],
      allRequirements: [req("Kubernetes")],
    });
    const result = matchCandidateToJob(candidate([]), j);

    expect(result.score).toBe(0);
    expect(result.missingKeywords).toEqual(["Kubernetes"]);
  });

  it("is deterministic for identical inputs", () => {
    const j = job({
      requiredRequirements: [req("Kubernetes"), req("React"), req("Docker")],
      allRequirements: [req("Kubernetes"), req("React"), req("Docker")],
    });
    const c = candidate(["kubernetes", "react"]);
    const a = matchCandidateToJob(c, j);
    const b = matchCandidateToJob(c, j);

    expect(a).toEqual(b);
  });
});
