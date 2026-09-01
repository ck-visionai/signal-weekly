import type { NormalizedJobDescription } from "@/lib/normalization/jobNormalizationTypes";

export interface CandidateMatchRequirement {
  canonical: string;
  category:
    | "skill"
    | "technology"
    | "title"
    | "certification"
    | "degree"
    | "industry"
    | "experience"
    | "responsibility"
    | "location"
    | "employment"
    | "other";
  source: "resume";
}

export interface CandidateMatchProfile {
  requirements: CandidateMatchRequirement[];
  canonicalTitle?: string | null;
  yearsExperience?: number | null;
}

export type MatchStatus =
  | "matched"
  | "partial"
  | "missing";

export interface RequirementMatch {
  requirement: string;
  category: string;
  importance: "required" | "preferred" | "unknown";
  confidence: number;
  status: MatchStatus;
  evidence: string[];
}

export interface CandidateJobMatch {
  score: number;

  requiredScore: number;
  preferredScore: number;

  matchedRequirements: RequirementMatch[];
  missingRequirements: RequirementMatch[];
  partialRequirements: RequirementMatch[];

  matchingKeywords: string[];
  missingKeywords: string[];

  totalRequired: number;
  matchedRequired: number;

  totalPreferred: number;
  matchedPreferred: number;
}

function normalize(value: string): string {
  return value
    .toLowerCase()
    .normalize("NFKC")
    .replace(/[^\p{L}\p{N}+#./-]+/gu, " ")
    .replace(/\s+/g, " ")
    .trim();
}

function tokenSet(value: string): Set<string> {
  return new Set(
    normalize(value)
      .split(" ")
      .filter(Boolean),
  );
}

function similarity(
  candidate: string,
  requirement: string,
): number {
  const candidateNormalized = normalize(candidate);
  const requirementNormalized = normalize(requirement);

  if (!candidateNormalized || !requirementNormalized) {
    return 0;
  }

  if (candidateNormalized === requirementNormalized) {
    return 1;
  }

  const candidateTokens = tokenSet(candidateNormalized);
  const requirementTokens = tokenSet(requirementNormalized);

  if (
    candidateTokens.size === 0 ||
    requirementTokens.size === 0
  ) {
    return 0;
  }

  /*
   * Exact token containment is safer than raw string includes().
   *
   * This prevents false positives such as:
   * "java" matching "javascript"
   * merely because one string contains the other.
   */
  const candidateArray = [...candidateTokens];
  const requirementArray = [...requirementTokens];

  const candidateContainsRequirement =
    requirementArray.every((token) =>
      candidateTokens.has(token),
    );

  if (candidateContainsRequirement) {
    return 0.95;
  }

  const requirementContainsCandidate =
    candidateArray.length > 0 &&
    candidateArray.every((token) =>
      requirementTokens.has(token),
    );

  if (requirementContainsCandidate) {
    return 0.9;
  }

  let overlap = 0;

  for (const token of requirementTokens) {
    if (candidateTokens.has(token)) {
      overlap += 1;
    }
  }

  return overlap / requirementTokens.size;
}

function bestCandidateSimilarity(
  requirement: string,
  candidateRequirements: CandidateMatchRequirement[],
): {
  score: number;
  evidence: string[];
} {
  let bestScore = 0;
  let evidence: string[] = [];

  for (const candidate of candidateRequirements) {
    const score = similarity(
      candidate.canonical,
      requirement,
    );

    if (score > bestScore) {
      bestScore = score;
      evidence = [candidate.canonical];
    }
  }

  return {
    score: bestScore,
    evidence,
  };
}

function classifyStatus(
  score: number,
): MatchStatus {
  if (score >= 0.85) {
    return "matched";
  }

  if (score >= 0.5) {
    return "partial";
  }

  return "missing";
}

function round(value: number): number {
  return Math.round(value * 100) / 100;
}

function calculatePoints(
  matches: RequirementMatch[],
): number {
  if (matches.length === 0) {
    return 0;
  }

  const points = matches.reduce(
    (total, match) => {
      if (match.status === "matched") {
        return total + 1;
      }

      if (match.status === "partial") {
        return total + 0.5;
      }

      return total;
    },
    0,
  );

  return points / matches.length;
}

export function matchCandidateToJob(
  candidate: CandidateMatchProfile,
  job: NormalizedJobDescription,
): CandidateJobMatch {
  /*
   * allRequirements is the canonical source for job matching.
   *
   * The normalizer already builds this from:
   * - required requirements
   * - preferred requirements
   * - responsibilities
   */
  const requirements = job.allRequirements.filter(
    (requirement) =>
      requirement.canonical.trim().length > 0,
  );

  const matches: RequirementMatch[] = [];

  for (const requirement of requirements) {
    const result = bestCandidateSimilarity(
      requirement.canonical,
      candidate.requirements,
    );

    matches.push({
      requirement: requirement.canonical,
      category: requirement.category,
      importance: requirement.importance,
      confidence: requirement.confidence,
      status: classifyStatus(result.score),
      evidence: result.evidence,
    });
  }

  const required = matches.filter(
    (match) => match.importance === "required",
  );

  const preferred = matches.filter(
    (match) => match.importance === "preferred",
  );

  const matchedRequired = required.filter(
    (match) => match.status === "matched",
  );

  const matchedPreferred = preferred.filter(
    (match) => match.status === "matched",
  );

  const requiredPoints = calculatePoints(required);
  const preferredPoints = calculatePoints(preferred);

  /*
   * Weighting rules:
   *
   * 1. Required + preferred:
   *    required = 80%
   *    preferred = 20%
   *
   * 2. Required only:
   *    required = 100%
   *
   * 3. Preferred only:
   *    preferred = 100%
   *
   * 4. Neither:
   *    score = 100
   *
   * This prevents a job with only preferred requirements
   * from incorrectly receiving 80 points when nothing matches.
   */
  let score: number;

  if (required.length > 0 && preferred.length > 0) {
    score =
      (requiredPoints * 0.8 +
        preferredPoints * 0.2) *
      100;
  } else if (required.length > 0) {
    score = requiredPoints * 100;
  } else if (preferred.length > 0) {
    score = preferredPoints * 100;
  } else {
    score = 100;
  }

  const matchedRequirements = matches.filter(
    (match) => match.status === "matched",
  );

  const partialRequirements = matches.filter(
    (match) => match.status === "partial",
  );

  const missingRequirements = matches.filter(
    (match) => match.status === "missing",
  );

  const matchingKeywords = [
    ...new Set(
      matchedRequirements.map(
        (match) => match.requirement,
      ),
    ),
  ];

  const missingKeywords = [
    ...new Set(
      missingRequirements
        .filter(
          (match) =>
            match.importance === "required" ||
            match.importance === "preferred",
        )
        .map(
          (match) => match.requirement,
        ),
    ),
  ];

  const requiredScore =
    required.length === 0
      ? 100
      : round(requiredPoints * 100);

  const preferredScore =
    preferred.length === 0
      ? 100
      : round(preferredPoints * 100);

  return {
    score: round(score),

    requiredScore,
    preferredScore,

    matchedRequirements,
    missingRequirements,
    partialRequirements,

    matchingKeywords,
    missingKeywords,

    totalRequired: required.length,
    matchedRequired: matchedRequired.length,

    totalPreferred: preferred.length,
    matchedPreferred: matchedPreferred.length,
  };
}