import { describe, expect, it } from "vitest";
import { releasePatch } from "./releaseTransitions";

describe("mutable edition release transitions", () => {
  const releaseAt = new Date("2026-09-04T08:00:00.000Z");
  const publishedAt = new Date("2026-09-04T08:00:00.000Z");

  it("creates a scheduled patch with a release time", () => {
    expect(releasePatch("schedule", releaseAt)).toEqual({ status: "scheduled", releaseAt, publishedAt: null });
  });

  it("reschedules without clearing an existing published timestamp", () => {
    expect(releasePatch("reschedule", releaseAt)).toEqual({ status: "scheduled", releaseAt });
  });

  it("pauses an edition back to draft", () => {
    expect(releasePatch("pause")).toEqual({ status: "draft" });
  });

  it("publishes with the supplied deterministic timestamp", () => {
    expect(releasePatch("publish", undefined, publishedAt)).toEqual({ status: "published", publishedAt });
  });

  it("rolls back and clears publication state", () => {
    expect(releasePatch("rollback")).toEqual({ status: "draft", publishedAt: null });
  });
});
