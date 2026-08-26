export type SampleIssue = {
  number: string;
  title: string;
  subtitle: string;
  previewUrl: string;
  completeUrl: string;
  freeComplete: boolean;
  deliveryLabel: string;
};

const storage = "/manus-storage";

export const sampleIssues: SampleIssue[] = [
  { number: "01", title: "The Career Evidence Working Page", subtitle: "Turn broad claims into credible evidence.", previewUrl: `${storage}/career-weekly-sample-01-evidence-preview_d78c9171.pdf`, completeUrl: `${storage}/career-weekly-sample-01-evidence-complete_1e159cd8.pdf`, freeComplete: true, deliveryLabel: "Complete edition available now" },
  { number: "02", title: "The ATS Translation Layer", subtitle: "Use role language without borrowing experience.", previewUrl: `${storage}/career-weekly-sample-02-ats-preview_25049511.pdf`, completeUrl: `${storage}/career-weekly-sample-02-ats-complete_f4a85490.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "03", title: "Your Three-Story Interview Bank", subtitle: "Prepare flexible, truthful interview evidence.", previewUrl: `${storage}/career-weekly-sample-03-stories-preview_5b422c5e.pdf`, completeUrl: `${storage}/career-weekly-sample-03-stories-complete_84612ea2.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "04", title: "The Question Behind the Question", subtitle: "Find the capability beneath the difficult prompt.", previewUrl: `${storage}/career-weekly-sample-04-questions-preview_d65159b8.pdf`, completeUrl: `${storage}/career-weekly-sample-04-questions-complete_81cb4900.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "05", title: "Research, Reflect, Rehearse", subtitle: "Connect preparation to your own relevant proof.", previewUrl: `${storage}/career-weekly-sample-05-research-preview_79585836.pdf`, completeUrl: `${storage}/career-weekly-sample-05-research-complete_98a6b5a2.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "06", title: "The Executive Screen", subtitle: "Make the first ten minutes count.", previewUrl: `${storage}/career-weekly-sample-06-screen-preview_19a7a358.pdf`, completeUrl: `${storage}/career-weekly-sample-06-screen-complete_edfc0850.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "07", title: "When They Ask About a Failure", subtitle: "Discuss setbacks with ownership and learning.", previewUrl: `${storage}/career-weekly-sample-07-failure-preview_125fbef1.pdf`, completeUrl: `${storage}/career-weekly-sample-07-failure-complete_7ce08547.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "08", title: "Questions That Help You Evaluate the Role", subtitle: "Use questions to understand scope and decision rights.", previewUrl: `${storage}/career-weekly-sample-08-evaluate-preview_fee8c4cd.pdf`, completeUrl: `${storage}/career-weekly-sample-08-evaluate-complete_58bb7b68.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "09", title: "The Whole-Role Negotiation Map", subtitle: "Evaluate the offer beyond headline salary.", previewUrl: `${storage}/career-weekly-sample-09-negotiation-preview_13b43ab3.pdf`, completeUrl: `${storage}/career-weekly-sample-09-negotiation-complete_e59c4e8c.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "10", title: "Ask for Time Before You Answer", subtitle: "Make room for a considered decision.", previewUrl: `${storage}/career-weekly-sample-10-time-preview_f455e4c2.pdf`, completeUrl: `${storage}/career-weekly-sample-10-time-complete_d9c5431b.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "11", title: "When Salary Cannot Move", subtitle: "Clarify what matters when constraints are real.", previewUrl: `${storage}/career-weekly-sample-11-salary-preview_6255c8e3.pdf`, completeUrl: `${storage}/career-weekly-sample-11-salary-complete_b22f7ace.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
  { number: "12", title: "The Career Decision Memo", subtitle: "Make the trade-offs visible before you decide.", previewUrl: `${storage}/career-weekly-sample-12-memo-preview_54bf426f.pdf`, completeUrl: `${storage}/career-weekly-sample-12-memo-complete_739a34ba.pdf`, freeComplete: false, deliveryLabel: "Full edition arrives weekly by email" },
];
