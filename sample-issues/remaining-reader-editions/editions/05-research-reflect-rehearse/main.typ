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
#show: report-theme.with(title: "Research, Reflect, Rehearse", author: "Career Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "organisation-signal-0", short: [Organisation signal], long: [Organisation signal], description: [A visible choice, pattern, or repeated phrase from public sources that suggests what the organisation values or plans to do.]),
  (key: "implication-1", short: [Implication], long: [Implication], description: [Your reasoned interpretation of what a signal means for the role’s work, trade-offs, and success conditions.]),
  (key: "evidence-story-2", short: [Evidence story], long: [Evidence story], description: [A brief, defensible account of a real situation you handled, including context, decision, collaboration, and learning.]),
  (key: "validation-question-3", short: [Validation question], long: [Validation question], description: [A targeted question designed to confirm or adjust your interpretation of a signal during conversation.]),
  (key: "talk-track-4", short: [Talk track], long: [Talk track], description: [A short, repeatable way of explaining how a signal connects to your evidence and to a question you will ask next.]),
  (key: "credibility-audit-5", short: [Credibility audit], long: [Credibility audit], description: [A quick review where you test whether your claims can withstand probing, are proportionate, and can be reasonably confirmed.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 05 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 05 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[Research, Reflect, Rehearse]
#v(0.6em)
#text(size: 14pt, fill: muted)[Connect organisation research, your own evidence and natural spoken preparation.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Build a concise preparation note that links what the organisation signals, the evidence you can prove, and the questions you will ask, so you enter conversations clear, credible, and ready to learn.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Create a preparation note that joins organisation signals, your relevant evidence and questions worth asking.
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
#text(size: 22pt, weight: "bold")[Edition 05 — Research, Reflect, Rehearse]
#v(0.55em)
#deck([When you approach a career decision or a pivotal conversation, the gap between what you think you know and what the organisation actually needs can be wide. This edition gives you a practical way to narrow that gap. You will connect specific organisation signals to your proven evidence and shape questions that invite useful, two-way dialogue. You will leave with a preparation note you can use before a screen, during an interview loop, or ahead of a stakeholder meeting about a new role or mandate. The method is simple: read intentionally, reflect with rigor, and rehearse in your natural voice. You will capture concrete signals from public information, translate those signals into working hypotheses, select evidence from your own track record that matches those hypotheses, and craft questions that test your understanding. You will then practice how you speak to these points so you sound like yourself while staying…])
#v(0.9em)
#callout([ORIENTATION], [Think of this as building a bridge between their world and yours. On one side are organisation signals: visible moves, choices, patterns, and language that point to what matters internally. On the other side is your evidence: real decisions you made, outcomes you influenced, constraints you navigated, and lessons you can explain. The bridge is your preparation note, designed to convert research into specific talking points and informed questions. This is not about guessing what the organisation wants to hear. It is about forming testable interpretations and showing how you reason. Your goal is to be accurate enough to be useful and flexible enough to adjust when you learn more. The more specific you can be about the signal, the source, and the implication, the easier it becomes to select proof you can defend and to…])
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
#deck([Use a simple, reusable capture format for each signal: signal, source, implication, validation question. For example: signal — visible shift toward platform unification; source — repeated references to consolidating tools across teams; implication — need for prioritization, change management, and migration risk handling; validation question — who owns the dependency map and how are trade-offs decided today? Write no more than three sentences per item. Keep citations to public items you can name if asked. Limit yourself to five to seven signals. Fewer is fine; more can dilute focus. Each signal should be specific enough to suggest the kind of proof you will bring and the questions you will ask.])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Scan for strategy and direction signals]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Start with sources that reflect intentional choices: leadership letters, product announcements, hiring themes across open roles, and public remarks that repeat over time. As you skim, capture exact phrases that recur, stated priorities,…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Read the job language as evidence of pain and proof requirements]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[A job description is often a mix of aspirations, non-negotiables, and legacy text. Separate the language into three columns in your notes: must-haves stated plainly, recurring verbs that imply the kind of work expected, and contextual…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Study external constraints and stakeholder landscape]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Look beyond the organisation’s own messages. Consider customer expectations, competitive moves, regulatory context, supplier dependencies, and macro conditions that could influence priorities. Capture only what you can point to with a…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [Use a simple, reusable capture format for each signal: signal, source, implication, validation question. For example: signal — visible shift toward platform unification; source — repeated references to consolidating tools across teams; implication — need for prioritization, change management, and migration risk handling; validation question — who owns the dependency map and how are trade-offs decided today? Write no more than three sentences per item. Keep citations to public items you can name if asked. Limit…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Now connect their signals to your evidence. Evidence is not a title or a list of responsibilities. Evidence is a moment where your decision, contribution, or craft created learning or improved a situation. Choose examples you can describe plainly, including context, constraints, and what you would do differently. Select concise, verifiable stories that mirror the verbs you saw in the job language and the implications you drew from organisation signals. Make sure each story can be told in under two minutes with names and numbers removed or generalized if needed to respect confidentiality.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Choose three to five proof stories that align to signals]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[For each selected signal, identify at least one story you can defend. Prioritize stories that demonstrate how you thought, how you collaborated, and how you handled resistance or uncertainty. Include the starting point,…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Extract portable skills and patterns from each story]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Name the skills that travel well across contexts, such as prioritization frameworks, stakeholder mapping, incident response routines, or experiment design. Note patterns others would recognize: repeated use of…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Prepare proof you can actually verify]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Inventory what could be confirmed by a previous colleague or by artefacts you can describe at a high level without sharing proprietary material. Examples include meeting cadences, decision logs, high-level rollout…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Create a one-page preparation note that maps organisation signals to your defensible evidence and to the questions you will ask to refine your understanding during conversations.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[Role signal to response: I’m noticing X, which suggests the role may require Y. I can show how I handled Y through Z example.]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Evidence in one breath: In a prior situation with similar constraints, I chose A because B, aligned with C, and measured D to know if we were on track.]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Match their verbs to your proof. If they say align, show a time you reconciled interests. If they say scale, show a time you stabilized variability. If they say de-risk, show a time you identified and managed failure modes ahead of time.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite each resume bullet you might reference as a spoken, two-sentence story: one sentence on context and decision, one sentence on the effect and what you learned. Strip away adjectives. Keep nouns and actions you can explain under questions.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile claims are statements that depend on unprovable leaps, over-claim credit, or collapse under a single follow-up. Examples include vague superlatives, unbounded scope, and unnamed collaborators. If you cannot name the decision you made, the constraint you faced, or the counterfactual you considered, the claim is likely fragile.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible claims are specific, proportionate, and confirmable by a reasonable colleague. They state the setting, your role, the action, and the reasoning. They credit others and leave room for nuance. They can withstand detailed questions without hedging or improvisation.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you finalize your preparation note, run a credibility audit. For each story, ask: who could reasonably confirm my role and approach, even if they would phrase outcomes differently? Which artefacts or routines could I describe at a high level without revealing confidential details? Where am I overstating causality or neglecting context? Replace any fragile claim with a precise description of what you actually did and learned. If you are unsure, downgrade the language rather than stretching. Precision builds trust faster than projection.])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Signals map]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List five to seven organisation signals with source and implication. For each, write one sentence on what it likely means for the role and one validation question you will ask to confirm or adjust your view.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Evidence ledger]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[For each signal, select one story from your experience. Write the two-sentence version: context and decision; effect and learning. Note who could confirm your role if asked and which artefact or routine you can describe.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Question bank]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Draft six thoughtful questions that test key assumptions. Aim for questions that reveal priorities, constraints, stakeholder ownership, success criteria, and trade-offs. Avoid questions you can answer through public…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Talk track rehearsal]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write your 90-second opening that connects a top signal to your relevant evidence and one or two questions. Record a voice memo of you delivering it. Note where you rush, hedge, or use filler, and revise for clarity and…]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I led a big project that improved operations a lot and made stakeholders happy.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) In a period of frequent incidents, I coordinated a cross-team effort to identify the top three failure modes, agreed on simple guardrails with the teams most affected, and set a weekly review to track stability. The result was a calmer release cadence and clearer ownership; I can walk through the decisions we made and where I would tighten the feedback loops next time.])
#v(0.25em)
#small([The before version is vague and untestable. The after version shows context, action, collaboration, and learning without claiming sole credit. It gives the listener concrete hooks for follow-up questions and reflects a repeatable pattern of work.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I transformed the customer experience and boosted adoption through my leadership.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) When sign-ups were high but early usage dropped off, I prioritized onboarding clarity by mapping the first five user actions and removing unnecessary steps with design and support. We shipped small changes weekly, watched drop-off points, and adjusted. I can explain the trade-offs we made and how we knew we were heading in the right direction.])
#v(0.25em)
#small([The before version makes sweeping claims and centers the speaker without specifics. The after version describes a targeted problem, a measurable approach, and collaborative execution while staying conservative about impact language.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Keep the preparation note structure constant and swap in new signals, adjusted implications, and re-mapped evidence for each organisation. You are not rewriting yourself each time; you are re-aiming your proof and questions to fit current realities. If a new context renders one of your stories less relevant, park it and elevate a closer match. If a signal repeats across organisations, refine your talk track so it feels fresh and precise rather than generic.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Check the chain from signal to question]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[For each signal, confirm that the implication is clear and that your validation question would actually change your approach if answered. Remove questions that only ask for confirmation of what you already assume.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Test for defensibility under probing]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Read each evidence snippet and list the first three follow-ups a skeptical stakeholder might ask. If you cannot answer crisply without adding adjectives, rewrite the snippet until it names a decision, a constraint, and a collaboration pattern.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Rehearse in your natural register]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Deliver your 90-second opening aloud three times, once as if speaking to a detail-oriented leader, once to a peer, and once to a non-specialist. Note which words feel stilted or scripted. Adjust phrasing until you would be comfortable saying it in a hallway…]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Good rehearsal is not memorization. It is internalizing your logic so you can adapt. Practice your openings and transitions: how you move from their signal to your evidence; how you pivot from your story to a question; how you respond when a detail is challenged. Use a timer for brief segments so you learn the rhythm of 30 seconds, 60 seconds, and 90 seconds. Record voice memos to catch filler words, overly dense phrasing, or unhelpful hedging. Aim for clean, unhurried sentences and specific nouns over broad labels. Build a few bridge phrases you can reuse: because you mentioned X, I’ll illustrate with Y; here’s how I approached a similar trade-off; if the priority shifts toward Z, here’s how I would adjust. Rehearse…])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Thanks for the conversation. From what I can see, there’s a clear emphasis on improving reliability while consolidating tools across teams. That suggests the role needs someone comfortable with prioritization, change…]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Collect sources and scan for signals. Set a 90-minute block to review public materials and open roles. Capture five to seven signals using the signal, source, implication,…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Translate job language into proof requirements. Highlight recurring verbs and implied constraints. Draft your first-pass implications and refine your validation questions.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Build your evidence ledger. Select three to five stories. Write the two-sentence version for each and identify who could confirm your role. Replace any fragile claims with…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Draft your question bank. Write six questions that would reveal priorities, success measures, stakeholder ownership, and near-term risks. Remove anything answerable through…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Write and record your 90-second opening. Deliver it three times to different imagined audiences. Note where you need simpler words, better transitions, or clearer endings.…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Run a credibility audit and finalize your one-page note. Trim to the essentials. Print or save it where you can glance at it before calls and refine it after each new…])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will enter important conversations with a one-page preparation note that links specific organisation signals, my defensible evidence, and the questions I will ask to learn and adapt.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://careercenter.umich.edu/content/interviewing-resources")[University of Michigan Career Center — Interviewing Resources]. This link is provided for general career-preparation context. Career Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
