import type { InsertEdition } from "../drizzle/schema";

export type ReleaseAction = "schedule" | "reschedule" | "pause" | "publish" | "rollback";

export function releasePatch(action: ReleaseAction, releaseAt?: Date, now = new Date()): Partial<InsertEdition> {
  switch (action) {
    case "schedule":
      return { status: "scheduled", releaseAt, publishedAt: null };
    case "reschedule":
      return { status: "scheduled", releaseAt };
    case "pause":
      return { status: "draft" };
    case "publish":
      return { status: "published", publishedAt: now };
    case "rollback":
      return { status: "draft", publishedAt: null };
  }
}
