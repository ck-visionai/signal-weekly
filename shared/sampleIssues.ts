export type SampleIssue = {
  number: string;
  title: string;
  subtitle: string;
  previewUrl: string;
  completeUrl: string;
  freeComplete: boolean;
  deliveryLabel: string;
};

const library = "/career-weekly-library";

export const sampleIssues: SampleIssue[] = [
  { number: "01", title: "The Career Evidence Working Page", subtitle: "Turn broad claims into credible evidence.", previewUrl: `${library}/career-weekly-sample-01-evidence-preview.pdf`, completeUrl: `${library}/career-weekly-sample-01-evidence-complete.pdf`, freeComplete: true, deliveryLabel: "Complete edition available now" },
  { number: "02", title: "The ATS Translation Layer", subtitle: "Use role language without borrowing experience.", previewUrl: `${library}/career-weekly-sample-02-ats-preview.pdf`, completeUrl: `${library}/career-weekly-sample-02-ats-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "03", title: "Your Three-Story Interview Bank", subtitle: "Prepare flexible, truthful interview evidence.", previewUrl: `${library}/career-weekly-sample-03-stories-preview.pdf`, completeUrl: `${library}/career-weekly-sample-03-stories-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "04", title: "The Question Behind the Question", subtitle: "Find the capability beneath the difficult prompt.", previewUrl: `${library}/career-weekly-sample-04-questions-preview.pdf`, completeUrl: `${library}/career-weekly-sample-04-questions-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "05", title: "Research, Reflect, Rehearse", subtitle: "Connect preparation to your own relevant proof.", previewUrl: `${library}/career-weekly-sample-05-research-preview.pdf`, completeUrl: `${library}/career-weekly-sample-05-research-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "06", title: "The Executive Screen", subtitle: "Make the first ten minutes count.", previewUrl: `${library}/career-weekly-sample-06-screen-preview.pdf`, completeUrl: `${library}/career-weekly-sample-06-screen-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "07", title: "When They Ask About a Failure", subtitle: "Discuss setbacks with ownership and learning.", previewUrl: `${library}/career-weekly-sample-07-failure-preview.pdf`, completeUrl: `${library}/career-weekly-sample-07-failure-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "08", title: "Questions That Help You Evaluate the Role", subtitle: "Use questions to understand scope and decision rights.", previewUrl: `${library}/career-weekly-sample-08-evaluate-preview.pdf`, completeUrl: `${library}/career-weekly-sample-08-evaluate-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "09", title: "The Whole-Role Negotiation Map", subtitle: "Evaluate the offer beyond headline salary.", previewUrl: `${library}/career-weekly-sample-09-negotiation-preview.pdf`, completeUrl: `${library}/career-weekly-sample-09-negotiation-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "10", title: "Ask for Time Before You Answer", subtitle: "Make room for a considered decision.", previewUrl: `${library}/career-weekly-sample-10-time-preview.pdf`, completeUrl: `${library}/career-weekly-sample-10-time-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "11", title: "When Salary Cannot Move", subtitle: "Clarify what matters when constraints are real.", previewUrl: `${library}/career-weekly-sample-11-salary-preview.pdf`, completeUrl: `${library}/career-weekly-sample-11-salary-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "12", title: "The Career Decision Memo", subtitle: "Make the trade-offs visible before you decide.", previewUrl: `${library}/career-weekly-sample-12-memo-preview.pdf`, completeUrl: `${library}/career-weekly-sample-12-memo-complete.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
];
