#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls
#import "report-theme.typ": report-theme

#let cobalt = rgb("#1646D8")
#let navy = rgb("#152744")
#let ink = rgb("#171A1F")
#let muted = rgb("#626B75")
#let paper = rgb("#FBFAF5")
#let soft-blue = rgb("#EDF3FF")
#let line-grey = rgb("#D7DBDF")

#show: make-glossary
#show: report-theme.with(title: "The Career Decision Memo", author: "Signal Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "evidence-0", short: [Evidence], long: [Evidence], description: [Observable information from a reliable source that would remain true regardless of your preferred outcome.]),
  (key: "criteria-1", short: [Criteria], long: [Criteria], description: [The small set of decision tests you commit to apply consistently across options.]),
  (key: "threshold-2", short: [Threshold], long: [Threshold], description: [The minimum acceptable level for a criterion that must be met for an option to remain viable.]),
  (key: "uncertainty-3", short: [Uncertainty], long: [Uncertainty], description: [A specific, decision-relevant unknown that can be reduced through a targeted next question.]),
  (key: "trade-off-4", short: [Trade-off], long: [Trade-off], description: [A cost you accept to gain a benefit, made explicit so it can be weighed against criteria.]),
  (key: "default-5", short: [Default], long: [Default], description: [The action that will occur if you make no decision by your review date, used to prevent drift.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 12 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
  #v(0.45em)
  #line(length: 100%, stroke: 0.9pt + cobalt)
]
#let kicker(body) = text(size: 8pt, weight: "bold", fill: cobalt, tracking: 0.07em)[#body]
#let deck(body) = text(size: 12pt, fill: muted)[#body]
#let small(body) = text(size: 8pt, fill: muted)[#body]
#let pill(body) = block(fill: soft-blue, inset: (x: 8pt, y: 4pt), radius: 3pt)[#text(size: 7.5pt, weight: "bold", fill: cobalt)[#body]]
#let callout(title, body) = block(fill: soft-blue, inset: 13pt, radius: 5pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[#title] #v(0.45em) #body]

// PAGE 1 — COVER
#set page(numbering: none, header: none)
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 12 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[SIGNAL WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[The Career Decision Memo]
#v(0.6em)
#text(size: 14pt, fill: muted)[Make the trade-offs visible before momentum makes the decision for you.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Equip you to draft a clear, one-page decision memo that surfaces what is known, what is unknown, what matters most, and what you will test next—so you can steer the choice instead of letting momentum do it for you.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Write a disciplined decision note that separates evidence, uncertainty, criteria and the next question.
#v(1.6em)
#line(length: 100%, stroke: 0.5pt + line-grey)
#v(0.4em)
#small([This is a Sample Briefing prepared for educational reading, not a historic newsletter issue. It does not guarantee an interview, offer, negotiation result or career outcome.])

#pagebreak()
#set page(numbering: "1", header: none)
// PAGE 2 — THE DECISION
#header("02", "THE DECISION")
#v(1em)
#kicker([THE CAREER DECISION])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Edition 12 — The Career Decision Memo]
#v(0.55em)
#deck([Most career moves gather speed before you have language for the trade-offs. A recruiter replies, a colleague nudges, a deadline looms, and suddenly the calendar is making decisions you have not examined. This edition slows that process down. You will write a disciplined memo that separates evidence from inference, distinguishes criteria from preferences, and converts uncertainty into targeted questions. The goal is not a perfect answer. The goal is a documented choice you can revisit, explain, and pressure test. You will consolidate signals from conversations, job descriptions, your own energy patterns, and constraints that are easy to ignore. You will name the gaps that block conviction and pick one next action with a short feedback loop. The structure is intentionally simple: context, criteria, options, evidence, uncertainty, trade-offs, and a next question. This produces clarity you can share with a mentor,…])
#v(0.9em)
#callout([ORIENTATION], [Treat your memo as a working paper, not a manifesto. It records your current best view and invites disconfirming evidence. Clear boundaries in the document keep persuasion separate from inquiry. That separation prevents over-committing to an option just because you have spent time describing it. A good memo captures criteria as the scorecard, not the story. The story can be compelling, but the scorecard is how decisions hold up under pressure. Finally, aim for decisions that are reversible in small steps. When a choice is expensive to unwind, your memo should elevate the bar for evidence and the standard for timing.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[TWO-MINUTE ORIENTATION]
#v(0.3em)
Choose one real career moment where this topic matters. Write down the decision, the constraint and the person who would need to understand your reasoning. Keep that situation in view as you move through the working pages.

#pagebreak()
// PAGE 3 — READ THE PROBLEM
#header("03", "READ THE PROBLEM")
#v(1em)
#kicker([STEP 1 · FIND THE DECISION SIGNAL])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Read for evidence, not for labels.]
#v(0.55em)
#deck([Start by dumping raw material without editing: notes from conversations, role descriptions, calendar snapshots, compensation ranges, family constraints, your curiosity level, and your non-starters. Do not organize yet. Once everything is visible, circle statements that are observable and underline items that are feelings or inferences. Move circled items to an evidence list and underlined items to assumptions to be tested. If you are missing counterevidence, add a placeholder to seek it. The aim is to remove hidden commitments that bias your reading of new information.])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Name the decision and the decision type]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Write one sentence that states the decision and whether it is a now, soon, or later decision. This anchors urgency and scope. If it is a reversible choice, you can move quickly with lighter evidence. If it is hard to reverse, you slow down…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Split facts, interpretations, and assumptions]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[List what you know from direct observation, what you believe based on interpretation, and what you are assuming without data. Mark each clearly. This reveals where confidence is earned versus imported and highlights what would change your…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Define criteria and their thresholds]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Turn vague preferences into explicit tests. For each criterion, set the minimum you will accept and the ideal you would like. Thresholds let you compare options without bending the rules each time a new detail appears.]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [Start by dumping raw material without editing: notes from conversations, role descriptions, calendar snapshots, compensation ranges, family constraints, your curiosity level, and your non-starters. Do not organize yet. Once everything is visible, circle statements that are observable and underline items that are feelings or inferences. Move circled items to an evidence list and underlined items to assumptions to be tested. If you are missing counterevidence, add a placeholder to seek it. The aim is to remove…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([With raw notes visible, you will build a compact inventory. The inventory is the backbone of the memo: the criteria you will use, the options you are considering, and the present-state facts that should influence timing. Keep it short and unambiguous.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Commit to 4–6 decision criteria]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Select a small set that reflect outcomes and conditions that matter to you, not just surface features. Examples include scope of responsibility, learning curve, manager fit, lifestyle constraints, risk exposure, and…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Describe 2–3 credible options]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Write a short description of each live option. Include a neutral description of what the option is, its main upside, its main risk, and the decision deadline if one exists. Avoid arguing for or against an option in this…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Capture context and constraints]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[List time-sensitive realities such as contract end dates, personal obligations, location limits, and financial guardrails. Include any organization-specific cycles that influence timing. This prevents criteria from…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Draft a one-page memo with the sections: decision, context, criteria with thresholds, options, evidence, uncertainties, trade-offs, and next question with a date to review.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[Your role is to be the steward of the decision quality, not the champion of an outcome.]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Evidence is what would still be true if your preferred option disappeared tomorrow.]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Translate feelings into testable claims. When you write “this feels risky,” add “because X could happen” and name the indicator that would signal the risk sooner.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite any persuasive sentences into neutral descriptions, then move arguments to the trade-offs section.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) A fragile memo confuses activity with evidence and blends wishful thinking with facts. It includes undefined criteria, moving thresholds, and vague next steps. It leans on third-hand narratives and generic market talk without naming sources or dates. It treats uncertainty as a reason to wait indefinitely or, paradoxically, as a reason to rush. It hides constraints or frames them as temporary when they have proven persistent. Above all, it cannot be challenged because it has no place to insert counterevidence.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) A defensible memo separates claims from support, names dates and sources, and defines how each criterion will be measured. It welcomes disconfirming inputs by listing what would change the decision. It shows your work: options, thresholds, trade-offs, and the cost of waiting. It ends with a small, time-boxed next question that tightens uncertainty. It can be read by a neutral party who could reconstruct your reasoning and respectfully disagree on the merits.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before sharing your memo, run a credibility audit. Check that every statement in the evidence section is anchored in a source you can point to, with dates if relevant. Scan for verbs that smuggle judgments, such as “clearly,” and replace them with specifics. Verify that thresholds are stable across options; if they shift, either justify the change or standardize them. Confirm that each uncertainty has a matching next step that can reduce it. Lastly, ask whether the cost of waiting is defined. If it is not, your timing logic is unfinished.])

#pagebreak()
// PAGE 7 — WORKSHEET
#header("07", "YOUR WORKING PAGE")
#v(1em)
#kicker([WORKING PAGE · 12 MINUTES])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Make one next decision concrete.]
#v(0.55em)
#deck([Complete the prompts in order. Write only what you can explain with confidence; the value comes from seeing your reasoning and evidence in one place.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Decision and type]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write the decision in one sentence and label it reversible or hard to reverse. State whether the decision is now, soon, or later, and explain why in two lines using timing facts, not feelings.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Criteria with thresholds]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List 4–6 criteria. For each, define a minimum acceptable threshold and an ideal target. Add one sentence on how you will observe or test the criterion within two weeks without overcommitting.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Evidence and uncertainties]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Create two columns. In the first, list 6–10 pieces of evidence with source and date. In the second, list 3–5 uncertainties. For each uncertainty, write one next question and the smallest action that could produce a…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Adaptation note]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Pick a different decision with lower stakes, such as joining a committee or declining a speaking request. Build a mini memo using the same structure. Keep it to half a page. Applying the process to a smaller choice…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]

#pagebreak()
// PAGE 8 — WORKED EXAMPLES
#header("08", "WORK THE METHOD")
#v(1em)
#kicker([ILLUSTRATIVE EXAMPLES])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Two ways to make the work visible.]
#v(0.45em)
#small([These examples are illustrative. Adapt the logic to your own history; do not copy details, measures or claims that are not yours.])
#v(0.65em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE A]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I should probably accept the external role because it seems like a step up. The title is better, the pay looks higher, and the recruiter is enthusiastic. My current role feels stagnant and the organization is slow. If I wait, the offer might expire and I do not want to miss a rare chance.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Decision: move to the external role or stay for an internal scope change. Type: partially reversible; first 90 days are the window to pivot. Criteria and thresholds: scope of responsibility (minimum: lead a meaningful initiative; ideal: own a cross-functional area), manager fit (minimum: aligned expectations; ideal: ongoing coaching), learning curve (minimum: clear first-90-day plan; ideal: exposure to new domain), lifestyle (minimum: sustainable hours during peak cycles; ideal: predictable travel), compensation (minimum: within stated guardrails;…])
#v(0.25em)
#small([The rewrite shifts from momentum and fear of missing out to explicit thresholds and testable next steps. It balances upside with identified risks and widens the comparison to include an internal redesign, not just exit or stay by default.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I am thinking about launching a small advisory practice on the side. People say I would be great at it and I enjoy helping others. I can probably fit it around my current job and see how it goes. If it gains traction, I could consider it full time later.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Decision: pilot a limited advisory offering alongside current employment or defer. Type: reversible if scoped tightly. Criteria and thresholds: conflict and compliance (minimum: written permission and alignment with policies; ideal: clear boundaries in writing), client definition (minimum: two conversations with target clients; ideal: a paid pilot), time budget (minimum: five hours weekly for six weeks; ideal: ten hours without crowding core role), demand signal (minimum: one concrete request; ideal: two paid engagements), financial guardrails (minimum:…])
#v(0.25em)
#small([The rewrite clarifies scope, adds guardrails, and converts a vague intention into a small experiment with a defined time window. It also surfaces policy constraints early, avoiding avoidable risk.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Pick a different decision with lower stakes, such as joining a committee or declining a speaking request. Build a mini memo using the same structure. Keep it to half a page. Applying the process to a smaller choice trains the habit of separating criteria, evidence, and uncertainty without the pressure of a major move.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Pressure test with a neutral reader]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Share the memo with someone who has no stake in the outcome. Ask them to find assumptions, moving thresholds, or missing counterevidence. Accept edits on the structure before debating conclusions.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Run the reversal test]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Write one paragraph arguing for the option you currently favor least using only your stated criteria and thresholds. If you cannot make a credible case, your criteria may be biased toward a preferred story.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Set a review date and default]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Choose a date to revisit the memo after your next question is answered. Define the default action if you do nothing by that date. Defaults reduce drift and force a choice based on real signals.]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Practice saying your memo out loud in two minutes. Start with the decision and type, name the criteria briefly, state the leading option and why, then the key uncertainty and your next question. Rehearsing helps you hear where you slide from evidence into persuasion. If you cannot say it plainly, the memo needs another pass.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Given my criteria and thresholds, what evidence or blind spot would most change your view of my leading option?]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 76pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]

#pagebreak()
// PAGE 10 — NEXT STEPS AND GLOSSARY
#header("10", "NEXT STEPS")
#v(1em)
#kicker([MAKE THE NEXT MOVE CONCRETE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A six-day application reset.]
#v(0.6em)
#grid(columns: (30pt, 1fr), row-gutter: 8pt,
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Write the one-sentence decision and label the decision type and timing. Draft your initial list of criteria with thresholds.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Extract raw notes and split them into evidence, interpretations, and assumptions. Move each item into the right bucket.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Describe 2–3 options neutrally and add context and constraints. Remove persuasive language and tighten to essentials.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Fill the uncertainties list and pair each with a next question and the smallest action that could reduce it.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Run the credibility audit and the reversal test. Ask a neutral reader for feedback focused on structure.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Execute the next question. Calendar a review date and write the default action if no new evidence emerges.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will separate facts from inferences, name thresholds before comparing options, and convert uncertainty into a next question I can answer within a short time window. I will revisit the memo on the review date and adjust based on new signals.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx")[DePaul Career Center — Job Offers & Salary Negotiation]. This link is provided for general career-preparation context. Signal Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
