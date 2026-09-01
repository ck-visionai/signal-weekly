/**
 * Job requirement builder — turns a pasted job description into a
 * NormalizedJobDescription (Signrl Day 1 module 3).
 *
 * Deterministic rules only: no AI, no embeddings. Section headers decide
 * importance; bullet lines become requirements; each requirement keeps its
 * verbatim source phrase for evidence display.
 */

import type {
  NormalizedJobDescription,
  NormalizedRequirement,
  RequirementCategory,
  RequirementImportance,
} from "./jobNormalizationTypes";

const SECTION_PATTERNS: Array<{
  importance: RequirementImportance;
  bucket: "required" | "preferred" | "responsibilities";
  patterns: RegExp[];
}> = [
  {
    importance: "preferred",
    bucket: "preferred",
    patterns: [
      /^nice\s*to\s*have\b/i,
      /^preferred\b/i,
      /^bonus\b/i,
      /^plus(?:es)?\b/i,
      /^good\s*to\s*have\b/i,
      /^desirable\b/i,
    ],
  },
  {
    importance: "required",
    bucket: "responsibilities",
    patterns: [
      /^responsibilit(?:ies|y)\b/i,
      /^what\s*you.?ll\s*do\b/i,
      /^duties\b/i,
      /^the\s*role\b/i,
      /^about\s*the\s*role\b/i,
    ],
  },
  {
    importance: "required",
    bucket: "required",
    patterns: [
      /^requirements\b/i,
      /^qualifications\b/i,
      /^must\s*have\b/i,
      /^what\s*we.?re\s*looking\s*for\b/i,
      /^skills\b/i,
      /^you\s*(?:will\s*)?need\b/i,
      /^essential\b/i,
      /^about\s*you\b/i,
    ],
  },
];

const BULLET_RE = /^\s*(?:[-*\u2022\u2023\u25E6\u2043\u2219]|\d+[.)])\s+/;

function classifyHeader(line: string): {
  importance: RequirementImportance;
  bucket: "required" | "preferred" | "responsibilities";
} | null {
  const cleaned = line.replace(/[:\u2013\u2014]\s*$/, "").trim();
  for (const section of SECTION_PATTERNS) {
    if (section.patterns.some((re) => re.test(cleaned))) {
      return { importance: section.importance, bucket: section.bucket };
    }
  }
  return null;
}

function guessCategory(text: string): RequirementCategory {
  const lower = text.toLowerCase();
  if (/\b(certifi|certified|certification)\b/.test(lower)) return "certification";
  if (/\b(degree|bachelor|master|phd|mba|diploma)\b/.test(lower)) return "degree";
  if (/\b(years?|year)\b.*\b(experience|exp)\b|\bexperience\b/.test(lower)) return "experience";
  if (/\b(docker|kubernetes|react|node|python|java|sql|aws|azure|gcp|typescript|javascript)\b/.test(lower)) return "technology";
  if (/\b(manage|lead|own|drive|coordinate|mentor|collaborat)\b/.test(lower)) return "responsibility";
  return "skill";
}

function isNoise(line: string): boolean {
  const cleaned = line.trim();
  if (cleaned.length < 3) return true;
  // Equal-opportunity / legal boilerplate is not a matchable requirement.
  if (/\b(equal opportunity|e-?verify|accommodation|we celebrate|drug[- ]free)\b/i.test(cleaned)) {
    return true;
  }
  return false;
}

function stripTrailingPunctuation(text: string): string {
  return text.replace(/[.;,\s]+$/, "").trim();
}

function splitCompoundSentences(text: string): string[] {
  // A bullet like "5+ years of experience; strong SQL skills" carries two
  // matchable requirements — split on sentence boundaries when both halves
  // are substantial.
  const parts = text
    .split(/\s*[;\u2022]\s*|\.\s+(?=[A-Z(])/)
    .map(stripTrailingPunctuation)
    .filter((part) => part.length >= 3);
  return parts.length > 0 ? parts : [text.trim()];
}

export function buildJobRequirements(raw: string): NormalizedJobDescription {
  const lines = raw.split(/\r?\n/);

  let bucket: "required" | "preferred" | "responsibilities" = "required";
  let importance: RequirementImportance = "required";

  const required: NormalizedRequirement[] = [];
  const preferred: NormalizedRequirement[] = [];
  const responsibilities: NormalizedRequirement[] = [];

  for (const line of lines) {
    const trimmed = line.trim();

    if (!BULLET_RE.test(line)) {
      const header = classifyHeader(trimmed);
      if (header) {
        bucket = header.bucket;
        importance = header.importance;
      }
      continue;
    }

    if (isNoise(trimmed)) continue;

    const body = trimmed.replace(BULLET_RE, "").trim();
    if (body.length === 0) continue;

    const target =
      bucket === "required" ? required : bucket === "preferred" ? preferred : responsibilities;

    for (const phrase of splitCompoundSentences(body)) {
      if (isNoise(phrase)) continue;
      target.push({
        canonical: phrase,
        sourcePhrase: body,
        category: guessCategory(phrase),
        importance: bucket === "responsibilities" ? "required" : importance,
        confidence: 0.8,
      });
    }
  }

  const all = [...required, ...preferred, ...responsibilities];
  const seen = new Set<string>();
  const allRequirements = all.filter((item) => {
    const key = item.canonical.toLowerCase();
    if (seen.has(key)) return false;
    seen.add(key);
    return true;
  });

  return {
    title: null,
    seniority: null,
    location: null,
    employmentType: null,
    requiredRequirements: required,
    preferredRequirements: preferred,
    responsibilities,
    allRequirements,
  };
}
