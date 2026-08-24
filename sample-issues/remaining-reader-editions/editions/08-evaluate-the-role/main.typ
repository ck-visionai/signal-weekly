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
#show: report-theme.with(title: "Questions That Help You Evaluate the Role", author: "Signal Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "mandate-0", short: [Mandate], long: [Mandate], description: [The reason the role exists and the specific outcomes it is expected to deliver in a defined time frame.]),
  (key: "success-measures-1", short: [Success measures], long: [Success measures], description: [The indicators and review cadences used to judge whether the role is on track, including who inspects progress and when.]),
  (key: "decision-rights-2", short: [Decision rights], long: [Decision rights], description: [Who has the authority to make, influence, or veto key decisions related to scope, priorities, budget, hiring, and standards.]),
  (key: "operating-environment-3", short: [Operating environment], long: [Operating environment], description: [The resources, constraints, rhythms, norms, and dependencies that shape how work gets done day to day.]),
  (key: "scope-4", short: [Scope], long: [Scope], description: [The boundaries of responsibility for the role, including what is owned, co-owned, influenced, or explicitly out of remit.]),
  (key: "escalation-path-5", short: [Escalation path], long: [Escalation path], description: [The predefined route for raising issues or conflicts, including who is involved, when to escalate, and how resolutions are decided.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 08 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 08 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[SIGNAL WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[Questions That Help You Evaluate the Role]
#v(0.6em)
#text(size: 14pt, fill: muted)[Use interview questions to understand scope, success measures and decision rights.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Equip yourself with a focused, professional question set that reveals the role’s true mandate, how success will be judged, who holds which decisions, and what operating conditions you would inherit.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Build a question set that helps you assess the mandate, manager, decision rights and operating environment.
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
#text(size: 22pt, weight: "bold")[Decision: Is this role set up for you to do meaningful work you can stand behind?]
#v(0.55em)
#deck([Interviews are often framed as evaluations of you, but your most important job is to evaluate the role. You are making a multi-year decision that will shape how you spend your time, whose problems you solve, and which trade-offs you make. Relying on the job description or a polished pitch is risky; they rarely reveal what matters most day to day: the clarity of the mandate, the manager’s style, the distribution of decision rights, and the operating environment you would enter. This edition helps you develop and use a precise question set that elicits concrete evidence rather than opinions. Instead of asking if a team “values collaboration,” you will ask for recent examples of cross-functional work and how conflicting priorities were resolved. Instead of asking what success “looks like,” you will ask how success is measured in the first months and who reviews progress. These shifts surface the practical conditions…])
#v(0.9em)
#callout([ORIENTATION], [Use this edition as a working guide before and during your interview cycle. Start by clarifying what you need to learn about the mandate, success measures, decision rights, and operating environment. Then translate each learning goal into a neutral, story-seeking question. Sequence these questions across the loop so that you ask the right person at the right moment. Close by interpreting what you heard through a consistent lens, looking for corroboration and gaps. Treat your questions as diagnostic instruments. Strong questions are anchored in time, ask for examples, and seek mechanisms, not slogans. Ask for the last instance a decision was made, who was in the room, what inputs were used, and how the result was tested. When you hear generalities, follow with a probe that invites a specific memory. When you hear a…])
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
#deck([Listen for specifics: named decision forums, time-bound examples, artifacts, and clear owners. Favor verbs over adjectives in the answers. When someone describes a process, ask when it last ran and what changed as a result. Note who initiates decisions, who provides inputs, and who can veto. Track time horizons: weekly rituals, quarterly checkpoints, annual resets. Pay attention to how people describe conflict and learning—are misses examined to improve the system, or to assign blame? Notice hedging, contradictions across interviewers, or answers that never get beyond principle statements. Absence of detail is itself a signal about clarity, recall, or transparency. Your goal is to assemble a coherent picture that multiple people could reasonably recognize.])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Define what you must learn to make a sound decision]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[List the uncertainties that would meaningfully change your choice if answered clearly. For most senior roles, these cluster into four domains: mandate and scope, success measures, decision rights, and operating environment. Mandate…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Translate intentions into neutral, example-seeking questions]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Avoid adjectives and hypotheticals. Convert “Is leadership supportive?” into “Tell me about a recent initiative like this—who sponsored it, what resources were committed, and what changed after the first review?” Replace “What does success…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Sequence questions across the interview loop]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Plan which questions to ask of which stakeholders. The hiring manager is best for mandate, success measures, and their operating system. Peers are best for decision rights, friction points, and collaboration norms. Cross-functional…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [Listen for specifics: named decision forums, time-bound examples, artifacts, and clear owners. Favor verbs over adjectives in the answers. When someone describes a process, ask when it last ran and what changed as a result. Note who initiates decisions, who provides inputs, and who can veto. Track time horizons: weekly rituals, quarterly checkpoints, annual resets. Pay attention to how people describe conflict and learning—are misses examined to improve the system, or to assign blame? Notice hedging,…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Before drafting questions, inventory your own decision criteria. You are not just testing the role; you are testing whether it supports the way you create value. Define your must-haves, trade-offs you will accept, and deal-breakers. This keeps your questions disciplined and prevents you from being swept away by brand or urgency.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Clarify your mandate fit]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Write down the types of problems you want to own and the outcomes you are ready to be accountable for. Identify adjacent areas you can influence but should not be expected to lead. Note any mismatches that would create…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Define success measures you can stand behind]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[List the time frames and milestones that feel realistic for the kind of work at hand. Note the inspection rhythms you prefer, what leading indicators you trust, and which lagging outcomes you are willing to be judged…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Map decision rights you need to do responsible work]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Document the decisions you need to own, the ones you can co-own, and the ones you are fine to influence without owning. Include budget authority, hiring and performance authority, technical or product choices, and…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Build a role evaluation question set that tests mandate, success measures, decision rights, and operating conditions through concrete, time-bound examples asked of the right people.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[If we were six months in and you were pleased with progress, what specifically would be different, and how would we know?]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Can you walk me through the last time this kind of decision was made—who initiated it, what inputs were used, where it was decided, and what happened next?]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Turn each intent into a question that asks for a recent example, a mechanism, or a decision path. Replace adjectives with nouns and verbs: instead of asking if collaboration is strong, ask when the last cross-functional plan was set, which teams were involved, what trade-offs were made, and how conflicts were resolved. Anchor to time frames and cadences. Prefer “tell me about the last time” over “how would you.” Seek artifacts and rhythms: reviews, dashboards, forums, calendars, and checklists.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite each leading or hypothetical question into a neutral probe that invites a specific, recent example, identifies who owned the decision, and clarifies how progress was inspected.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile questions are broad, leading, or easy to deflect. They invite opinions or ideals rather than evidence. Examples include: “Is leadership supportive?” “Is this a collaborative culture?” “Will I have autonomy?” “Do you value strategy?” These questions put interviewers on the spot to declare virtues and can elicit rehearsed answers. Fragile questions also include hypotheticals that float above reality: “How would you handle a major setback?” or “How do you usually make decisions?” They do not anchor to time, ownership, or outcomes. When you hear a value statement in response, you learn little about how work actually moves. Fragile…],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible questions are specific, time-bound, and aimed at the plumbing of how work gets done. They do not accuse or assume; they invite stories and mechanisms. Examples include: “Tell me about a setback in the last two quarters—what changed in the plan, who made the call, and what was learned?” “Walk me through how the current roadmap is prioritized—who submits requests, where are trade-offs made, and how are decisions communicated?” “In the first 90 days, what outcomes will we review together, on what cadence, and which leading indicators matter most?” “When a cross-functional dependency slips, what’s the escalation path, and who has…])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you ask your questions, run a credibility audit. First, confirm that none of your questions are answered in the public job description or the recruiter’s brief. If they are, refine them to go a layer deeper. Second, check that each question fits your seniority and the scope of the role; avoid asking for authority that is clearly beyond the remit unless you are testing whether the remit can expand. Third, ensure you can explain why you are asking without sounding adversarial. A simple framing sentence—“I’ve learned to ask about decision paths early so I can align my approach”—keeps the tone constructive. Fourth, prepare a relevant example from your own experience for any question you ask, because strong interviewers may mirror it back to you. Fifth, balance your set so you do not over-index on risk. Include at least one question that explores opportunity or potential leverage, such as latent assets or underutilized capabilities. Finally, prioritize your top…])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Clarify the opportunity you are evaluating]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Name the role, the hiring manager, the business unit or team, and the primary mission as stated to you. What is your initial understanding of the outcomes the organization wants from this role in the next 12 months?]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Define your nonnegotiables and trade-offs]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List the top three nonnegotiables you need to do responsible work in this role (for example, decision rights, sponsorship, scope). List up to three trade-offs you are willing to accept for the right mandate.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Draft your top eight defensible questions]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write eight neutral, example-seeking questions that test mandate, success measures, decision rights, and operating environment. For each, note who is the best person to ask (manager, peer, cross-functional partner,…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Identify red flags, green lights, and follow-ups]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List the specific signals you will treat as red flags, the signals that would increase your confidence, and the follow-up evidence you will request if an answer is vague or contradictory.]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) Is leadership supportive of this function?],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Tell me about a significant initiative led by this function in the last year. Who sponsored it, what resources were committed at the start, where key decisions were made, and what changed after the first review?])
#v(0.25em)
#small([The before question invites a value statement that anyone can answer positively. The after question asks for a concrete story with identifiable sponsors, commitments, and governance. It reveals whether the function has true backing or only rhetorical support. You will learn if resources are committed upfront or drip-fed, whether decisions happen in a clear…])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) What does success look like in this role?],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) If we are sitting down 90 days in, what outcomes would reassure you we are on the right track, how will we inspect progress together, and who else will be in that review?])
#v(0.25em)
#small([The before question encourages abstract ideals. The after question forces clarity on time-bound outcomes, inspection cadence, and stakeholders. You learn whether early wins are about inputs, outputs, or outcomes, and whether the manager will review progress in a structured way. You also see who else shares accountability and how aligned the review group is…])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Use this question set beyond interviews. In recruiter screens, test basic mandate clarity and sponsorship before investing time. In peer conversations, probe collaboration rhythms and decision interfaces. In skip-level meetings, validate strategic durability and how priorities survive shifts. In reference calls, ask for examples that corroborate or challenge what you heard. In internal mobility discussions, adapt the same structure to evaluate scope expansion and new dependencies. Across all contexts, anchor to recent examples, mechanisms, and decision paths to keep…])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Debrief within 24 hours using a consistent template]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Summarize key points under mandate, success measures, decision rights, and operating environment. Write what you heard, not what you hoped to hear. Highlight direct quotes that show mechanisms or decisions. Note what you did not ask due to time and plan when…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Score confidence, not positivity]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Replace a one-to-five satisfaction score with a one-to-five confidence score about your understanding of each domain. Low confidence means you need more evidence; high confidence means you have enough to decide, even if some signals are mixed. This prevents…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Cross-check alignment across interviewers]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Compare answers to the same questions from different people. Agreement on purpose and decision paths is a strong signal; disagreement can be healthy if it reflects role evolution, but it can also indicate unresolved tension. Note whether contradictions are…]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Practice aloud until your questions sound natural and concise. Record yourself asking each question with a one-sentence framing that explains why you are asking. Edit for length and tone. Rehearse neutral follow-ups that convert generalities into examples: “What was the time frame?” “Who made the call?” “What changed after that review?” Ask a trusted peer to role-play as a skeptical interviewer and push back so you can keep your composure and curiosity under pressure.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[I have a few questions that help me understand how this role creates value and how we’ll work together. I’ll keep them concise and focused on recent examples so I can align my approach to how you operate.]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: List your decision criteria under mandate, success measures, decision rights, and operating environment. Highlight your top three nonnegotiables and the trade-offs you can…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Draft 12 example-seeking questions and map each to the best interview stage and stakeholder. Write one neutral follow-up for each question.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Run a credibility audit. Remove anything answered in public materials, tighten wording for neutrality, and prepare a brief framing sentence for each question.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Rehearse aloud. Record yourself, cut filler words, and refine sequencing so your top three questions fit even in a short conversation.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Use your questions in two conversations. After each, debrief within 24 hours using your template and assign a confidence score for each domain.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Iterate. Rewrite any question that produced vague answers, add targeted follow-ups to close gaps, and confirm your next evidence requests.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will ask neutral, example-seeking questions in every interview, debrief within 24 hours, and base my decision on clear evidence about mandate, success measures, decision rights, and operating conditions.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://careercenter.umich.edu/content/interviewing-resources")[University of Michigan Career Center — Interviewing Resources]. This link is provided for general career-preparation context. Signal Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
