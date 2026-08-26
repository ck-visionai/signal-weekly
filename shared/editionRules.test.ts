import { describe, expect, it } from "vitest";
import { getArchivedEditions, getRollingVisibleEditions } from "./editionRules";

describe("public edition visibility", () => {
  const editions = Array.from({ length: 15 }, (_, index) => ({
    id: index + 1,
    issueNumber: index + 1,
    status: "published",
  })).reverse();

  it("pins Edition 01 and fills the remaining window with the newest released editions", () => {
    const visible = getRollingVisibleEditions(editions);
    expect(visible).toHaveLength(12);
    expect(visible[0]?.issueNumber).toBe(1);
    expect(visible.slice(1).map(edition => edition.issueNumber)).toEqual([15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5]);
  });

  it("keeps future and archived editions out of the public window and archive", () => {
    const mixed = [...editions, { id: 99, issueNumber: 99, status: "draft" }];
    expect(getRollingVisibleEditions(mixed).every(edition => edition.status === "published")).toBe(true);
    expect(getArchivedEditions(mixed).map(edition => edition.issueNumber)).toEqual([4, 3, 2]);
  });
});
