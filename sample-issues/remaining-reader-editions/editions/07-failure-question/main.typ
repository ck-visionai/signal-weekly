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
#show: report-theme.with(title: "When They Ask About a Failure", author: "Career Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "ownership-0", short: [Ownership], long: [Ownership], description: [The part of the situation you directly controlled or influenced, including decisions you made or failed to make.]),
  (key: "decision-rights-1", short: [Decision rights], long: [Decision rights], description: [Clarity on who can make which calls, approve changes, or re-sequence work across teams.]),
  (key: "control-boundary-2", short: [Control boundary], long: [Control boundary], description: [The line between factors you can influence and those you cannot, used to assign responsibility accurately.]),
  (key: "risk-cadence-3", short: [Risk cadence], long: [Risk cadence], description: [A regular rhythm of check-ins tied to known risk points, used to detect shifts early.]),
  (key: "acceptance-criteria-4", short: [Acceptance criteria], long: [Acceptance criteria], description: [The objective conditions that define whether a deliverable is fit for purpose at each gate.]),
  (key: "off-ramp-5", short: [Off-ramp], long: [Off-ramp], description: [A pre-agreed path to pause, pivot, or exit a plan or vendor relationship when thresholds are not met.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 07 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 07 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[When They Ask About a Failure]
#v(0.6em)
#text(size: 14pt, fill: muted)[Show ownership and learning without turning the story into blame or performance.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Help you craft a concise, accountable answer about a failure that shows sound judgment, learning, and a durable change in how you lead work.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Prepare a responsible answer that explains context, ownership, learning and what changed in your practice.
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
#text(size: 22pt, weight: "bold")[When they ask about a failure]
#v(0.55em)
#deck([Few questions expose your professional maturity faster than, “Tell me about a time you failed.” At mid-career and executive levels, the point is not guilt or theatrics. The point is whether you can sit at the table when outcomes fall short, name your decisions accurately, hold the right tension between factors you controlled and those you did not, and show how your practice evolved. It is a test of your operating system, not just your storytelling. Many leaders drift into two unhelpful extremes. One is the sanitized anecdote where nothing truly went wrong, which reads as evasion. The other is a blame-forward monologue that minimizes your role, inflates other people’s, and leaves the listener wondering what would change if you were in the same situation again. Both erode trust. A strong answer is brief, concrete, and reflective. It names the context and your role, clarifies the decision points you owned, and explains…])
#v(0.9em)
#callout([ORIENTATION], [Your task is to prepare a responsible, defensible answer about a real failure. You will inventory possible stories, choose one that shows growth without endangering relationships, and shape it into four parts: context, ownership, learning, and what changed in your practice. Then you will run a credibility audit, rehearse delivery, and build a one-page reference you can refresh before conversations.])
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
#deck([As you draft, extract only the facts you need to explain what was attempted, the call you made, what you missed, and how your practice is now different. If a detail does not illuminate your decision-making, leave it out. Your goal is not to win the argument with your past; it is to demonstrate that you run better systems now.])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Understand the purpose of the question]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Interviewers and stakeholders use failure questions to model how you learn, not to relive your worst day. They listen for whether you can diagnose causes without dramatics, assign responsibility accurately, protect trust, and implement…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Select a story that carries insight, not just noise]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Choose a situation where you had meaningful responsibility and a clear decision point, even if other factors played a role. Avoid stories still entangled in confidentiality or where naming any detail would violate trust. If the failure…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Use a four-part structure: context, ownership, learning, change]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Keep your answer under two minutes. Organize it this way: - Context: one or two lines that set the stage. State the objective and constraints. - Ownership: what you decided, did, or failed to do. Name the missed signal or flawed…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [As you draft, extract only the facts you need to explain what was attempted, the call you made, what you missed, and how your practice is now different. If a detail does not illuminate your decision-making, leave it out. Your goal is not to win the argument with your past; it is to demonstrate that you run better systems now.])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Before you write, build a small inventory of plausible failure stories. You want range: scale, function, timeframe, and the kinds of decisions you owned. This reduces the chance that you anchor on the first memory or default to events that are more dramatic than instructive.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[List 5–7 candidate failures with decision points you owned]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Write short labels with dates or phases. For each, name the objective, the constraint, and the key decision you made that influenced the outcome. Examples: launched without pilot, overestimated adoption, misaligned…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Prune red flags and high-risk stories]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Remove stories that compromise confidentiality, retraumatize others, or would require naming individuals in a way that assigns blame. Also drop situations where you had almost no agency—there is little learning to show.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Map controllable versus uncontrollable factors]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[For your top two stories, list factors you controlled (assumptions, sequencing, stakeholder engagement, scope, risk triggers) and those you did not (regulatory changes, force majeure, inherited constraints). This primes…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Prepare a two-minute answer about a real failure that demonstrates mature ownership, a specific learning, and a practice you now use. Deliver it in four parts: context, ownership, learning, and change. Keep names and sensitive details out. Your listener should walk away knowing how you operate, not who to blame.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[My responsibility in that situation was X, and I made the call to Y based on Z.]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Since then, in comparable situations I have done A and B as standard practice, which has helped me surface risks earlier and adjust before commitments harden.]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Translate charged statements into responsible language. Examples: - Instead of “It wasn’t my fault,” say, “I underestimated X and did not build Y into the plan.” - Instead of “They dropped the ball,” say, “I assumed alignment without verifying decision rights and check-ins.” - Instead of “We had no choice,” say, “Given the constraints, I chose tradeoff A over B and missed the downstream effect on C.” - Instead of “We saved it at the last minute,” say, “We recovered partially, and I now prevent the pattern by doing D earlier.”])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite your story to include only what clarifies your decision, what you misjudged, the insight you gained, and the changes you instituted. Remove character judgments, speculation about motives, and excess chronology. Aim for 180–220 words on paper, which you can deliver in under two minutes aloud.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile answers sound evasive, theatrical, or self-exonerating. Signals include: - The failure is actually a disguised success with no real consequence. - Most sentences describe what others did wrong; your role is vague. - The learning is trite or generic, such as “communication is important.” - The change is a one-time hero move, not a repeatable practice. - The answer requires naming people or disclosing sensitive details to make sense.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible answers accept responsibility proportionately, show a specific learning, and name a durable change. Signals include: - You can point to the decision you owned and the signal you missed. - You distinguish between what was in your control and what was not. - You translate the learning into an observable practice with examples. - You maintain respect for people involved and avoid blame-heavy language. - You can answer two follow-ups with the same calm structure.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Run this check before you finalize: - Accuracy: Are you clear about the objective, constraints, and your decision? Would a colleague who was there recognize the events at a high level? - Proportion: Are you taking more or less responsibility than you had? Adjust to match your actual agency. - Specificity: Can you name one changed practice that is now standard for you? If not, revise your learning and change. - Brevity: Can you deliver it in under two minutes without rushing? Trim adjectives and side plots. - Respect: Does your language protect relationships and confidentiality? Replace loaded labels with neutral descriptors. - Consistency: If asked follow-ups, can you extend the same logic without adding new villains or contradictions?])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Choose the story]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List three candidate failures where you had a real decision point. For each, write the objective, the constraint you underestimated, and the decision you owned that influenced the outcome.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Own your call]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[For your selected story, write two sentences that name your role and the specific call you made. Then write one sentence that names the signal you missed at the time.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Name the learning]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[What did you learn about your process that generalizes to other work? Write one sentence that states the insight without blame or flattery. Example structure: “I learned that when X is true, I must Y before Z.”]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Operationalize the change]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List two concrete behaviors you now use to prevent or manage similar situations. For each, note when you apply it, what you look for, and how you know it is working.]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) We had a project go sideways because other teams did not deliver on time. I kept pushing, but they missed every date. In the end we got most of it out the door, and leadership was fine with it. I learned to push harder and escalate sooner.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Context: I led a cross-functional rollout under a tight date. I assumed early sign-offs meant sustained alignment, and I did not establish decision rights or interim checkpoints. Ownership: I chose to proceed without clarifying who could change scope, so when upstream teams re-prioritized, I learned about it late and could not re-sequence. Learning: I realized I was treating alignment as a one-time event rather than a cadence, and I had not mapped who could move which pieces. Change: I now set decision rights at kickoff, schedule brief check-ins tied to…])
#v(0.25em)
#small([The weak version blamed “other teams” and offered no durable change. The stronger version names the decision the leader owned, the missed signal, the process insight, and the specific practices now in place.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I tried a new vendor and they underperformed. It made us look bad. I told leadership we should never take that kind of risk again. I now only use vendors people already know.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Context: I selected a new vendor to speed up a specialized deliverable under budget pressure. I compressed due diligence to meet a date and skipped a small pilot. Ownership: I made the call to skip the pilot and rely on references. Early quality issues were detectable, but I had not defined acceptance thresholds or an exit path. Learning: I learned that when I am compressing timelines, I trade evaluation for speed unless I install a small test and objective gates. Change: I now run a time-boxed pilot with clear acceptance criteria and a pre-agreed…])
#v(0.25em)
#small([The weak version retreats into blanket avoidance and overgeneralizes the risk. The improved version identifies the leader’s decision, the process flaw, and a repeatable control that preserves speed without pretending certainty.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Adapt your answer for different contexts. For written applications, compress to 130–160 words and lead with the changed practice. For panel interviews, keep the structure and invite follow-up with a line like, “Happy to share how I apply this in different settings.” For executive conversations, emphasize the control boundary you learned to draw and the governance or cadence you now use.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Check proportional ownership]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Read your draft and underline every sentence about your role. If more than half the lines refer to other people, rebalance. If you over-own to look noble, recalibrate to what you actually controlled.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Is the change observable?]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Ask yourself, could a colleague notice the change you claim? If the change is an idea rather than a behavior, make it concrete: cadence, artifact, threshold, or trigger you now use.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Trim to essential facts]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Remove color commentary and motive assignments. Keep the objective, the constraint, your decision, the missed signal, the learning, and the changed practice. Everything else is optional.]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Practice aloud three times. First, read the full script to hear the flow. Second, deliver without notes using simple language, aiming for under two minutes. Third, record yourself and listen for hedging, speed, and blame tones. Replace filler with direct statements. End each version with your changed practice so the listener leaves with your operating upgrade top of mind.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[“Context, my call, what I learned, what I changed.”]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Build your inventory of 5–7 failure candidates and prune to two viable stories using the control and confidentiality filters.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: For each of the two, draft the four-part answer. Keep both under 220 words and include a specific changed practice.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Run the credibility audit with a trusted peer who will challenge vague claims. Revise language to be proportionate and neutral.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Rehearse both answers aloud and record them. Trim 10–15 seconds by removing adjectives and side plots. Tighten your closing change statement.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Stress test with follow-up questions. Prepare two short examples of how you have applied the new practice since the failure, without naming sensitive details.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Choose one primary story and one backup. Create a one-page cue card with your four-part outline and two proof points of the changed practice.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will describe a real failure with fair ownership, name a clear learning, and show the lasting change in how I operate.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/")[MIT Career Advising & Professional Development — STAR method]. This link is provided for general career-preparation context. Career Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
