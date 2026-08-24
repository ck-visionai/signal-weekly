import type { SiteContent } from "./siteContent";

export function createContentBackup(content: SiteContent, createdAt = new Date()) {
  const timestamp = createdAt.toISOString();
  const heading = "# Career Signal Weekly Content Backup";
  const summary = [
    `Created: ${timestamp}`,
    "",
    "> This backup contains the editable Career Signal Weekly website content, public resources and redirect links.",
    "> It does not contain Beehiiv subscribers, email messages, passwords, or domain-account information.",
    "",
    "## Quick reference",
    `- Publication: ${content.identity.brandName}`,
    `- Contact: ${content.identity.contactEmail}`,
    `- Featured resource: ${content.resources.featured.title}`,
    `- ATS download: ${content.links.atsUrl}`,
    `- Live-training link: ${content.links.liveTrainingUrl || "Not yet set"}`,
    "",
    "## Full editable content",
    "The JSON below is a complete copy of the editor-managed website content. Keep it safely. It can be used as a reference if content ever needs to be restored manually.",
    "",
    "```json",
    JSON.stringify(content, null, 2),
    "```",
    "",
    "## Recovery note",
    "To restore content, sign in to the Career Signal Weekly Editor and copy the relevant values back into the matching fields. Do not upload this file publicly because it may contain unpublished draft wording or private destination links.",
  ];

  return `${heading}\n\n${summary.join("\n")}\n`;
}

export function contentBackupFilename(createdAt = new Date()) {
  return `career-signal-weekly-content-backup-${createdAt.toISOString().slice(0, 10)}.md`;
}
