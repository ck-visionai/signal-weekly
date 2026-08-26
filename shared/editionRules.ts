export type PublicEditionLike = { id: number; issueNumber: number; status: string };

export function getRollingVisibleEditions<T extends PublicEditionLike>(editions: T[], windowSize = 12) {
  const released = editions.filter(edition => edition.status === "published").sort((a, b) => b.issueNumber - a.issueNumber);
  const pinned = released.find(edition => edition.issueNumber === 1);
  const additionalLimit = Math.max(windowSize - (pinned ? 1 : 0), 0);
  const additional = released.filter(edition => edition.issueNumber !== 1).slice(0, additionalLimit);
  return pinned ? [pinned, ...additional] : released.slice(0, windowSize);
}

export function getArchivedEditions<T extends PublicEditionLike>(editions: T[], windowSize = 12) {
  const visibleIds = new Set(getRollingVisibleEditions(editions, windowSize).map(edition => edition.id));
  return editions.filter(edition => edition.status === "published" && !visibleIds.has(edition.id)).sort((a, b) => b.issueNumber - a.issueNumber);
}
