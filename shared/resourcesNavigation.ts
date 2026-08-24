export const SAMPLE_ISSUES_HASH = "#sample-issues";
export const SAMPLE_ISSUES_ID = "sample-issues";

export function getResourcesAnchorTarget(hash: string) {
  return hash === SAMPLE_ISSUES_HASH ? SAMPLE_ISSUES_ID : null;
}
