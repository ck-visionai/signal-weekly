import { describe, expect, it } from "vitest";
import { createContentBackup, contentBackupFilename } from "./contentBackup";
import { defaultSiteContent } from "./siteContent";

describe("content backup export", () => {
  const createdAt = new Date("2026-08-24T06:00:00.000Z");

  it("includes readable summary information and the full editable content record", () => {
    const backup = createContentBackup(defaultSiteContent, createdAt);

    expect(backup).toContain("# Career Signal Weekly Content Backup");
    expect(backup).toContain("The Executive ATS Résumé Audit");
    expect(backup).toContain(defaultSiteContent.links.atsUrl);
    expect(backup).toContain('"brandName": "Career Signal Weekly"');
    expect(backup).toContain("does not contain Beehiiv subscribers");
  });

  it("creates a dated Markdown filename", () => {
    expect(contentBackupFilename(createdAt)).toBe("career-signal-weekly-content-backup-2026-08-24.md");
  });
});
