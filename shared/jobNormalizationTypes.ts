/**
 * Job normalization types — rebuilt in-repo (shortlitz ignored per owner).
 *
 * Contract required by docs/matchCandidateToJob.V2.ts.
 * Shapes follow the Signrl Day 1 spec (docs/Signrl ATS Intelligence_ Day 1 Matching Engine and AI-Agent Protocol.md):
 * - requirements carry canonical text, category, importance, confidence
 * - allRequirements = required + preferred + responsibilities (canonical source)
 */

export type RequirementImportance = "required" | "preferred" | "unknown";

export type RequirementCategory =
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

export interface NormalizedRequirement {
  /** Canonical, cleaned phrase used for matching. */
  canonical: string;
  /** Original verbatim phrase from the job description. */
  sourcePhrase: string;
  category: RequirementCategory;
  importance: RequirementImportance;
  /** 0–1 extraction confidence from the requirement builder. */
  confidence: number;
}

export interface NormalizedJobDescription {
  title?: string | null;
  seniority?: string | null;
  location?: string | null;
  employmentType?: string | null;

  requiredRequirements: NormalizedRequirement[];
  preferredRequirements: NormalizedRequirement[];
  responsibilities: NormalizedRequirement[];

  /**
   * Canonical source for matching: required + preferred + responsibilities,
   * deduplicated by normalized canonical text.
   */
  allRequirements: NormalizedRequirement[];
}
