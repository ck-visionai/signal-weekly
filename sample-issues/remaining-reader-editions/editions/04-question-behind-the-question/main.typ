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
#show: report-theme.with(title: "The Question Behind the Question", author: "Signal Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "capability-lens-0", short: [Capability lens], long: [Capability lens], description: [The specific skill or judgment area you decide a prompt is testing, which guides what evidence you select and how you frame your answer.]),
  (key: "constraint-1", short: [Constraint], long: [Constraint], description: [The binding limit shaping a decision, such as time, budget, dependencies, or stakeholder boundaries, which defines what good judgment looks like in the story.]),
  (key: "decision-spine-2", short: [Decision spine], long: [Decision spine], description: [A compact statement of the pivotal choice you made and the trade-off involved, which anchors your narrative and showcases judgment.]),
  (key: "alignment-work-3", short: [Alignment work], long: [Alignment work], description: [The actions you take to surface dissent, build shared understanding, and secure support, including principles, forums, and agreements.]),
  (key: "operating-rule-4", short: [Operating rule], long: [Operating rule], description: [A durable, portable principle you adopted from an experience that you can apply in new contexts, showing learning transfer.]),
  (key: "archetype-5", short: [Archetype], long: [Archetype], description: [A common pattern of interview prompts, such as pressure test, trade-off test, alignment test, scope test, or self-correction test, which suggests the capability being assessed.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 04 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 04 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[SIGNAL WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[The Question Behind the Question]
#v(0.6em)
#text(size: 14pt, fill: muted)[Decode difficult prompts into the capability an interviewer is trying to assess.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Equip you to decode difficult interview prompts, identify the underlying capability being tested, and select honest, specific evidence that demonstrates it.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Identify the capability beneath a difficult interview question, then select evidence that demonstrates it honestly.
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
#text(size: 22pt, weight: "bold")[Decode the question behind the question]
#v(0.55em)
#deck([Some interview prompts feel like riddles. A senior stakeholder asks about a conflict you handled. A panel member drills into a budget miss. A founder pushes you to explain a time something did not work. These prompts are rarely about the surface story. They are structured to test a capability the role depends on: judgment under pressure, systems thinking, stakeholder alignment, risk management, or learning agility. If you take the question literally and answer at face value, you risk missing what the interviewer actually wants to learn. If you try to perform for applause, you risk sounding polished but untrustworthy. This edition teaches you to decode the question behind the question, choose a capability lens, and select evidence that is both relevant and believable. You will learn a small set of repeatable moves: listen for the capability cue, anchor your role and scope, name the constraint, and describe the…])
#v(0.9em)
#callout([ORIENTATION], [Mid-career and executive interviews favor inference over interrogation. Instead of asking if you are good at a capability, interviewers observe how you reason about real constraints. A question about a delayed launch might be testing prioritization, not scheduling. A request to describe a failure may be probing your pattern recognition and recovery habits. The decoding move is to translate from story to capability and back again. Treat each prompt like a job-relevant capability test disguised as a conversation. Listen for context: who is asking, where they sit in the organization, and what this role must deliver. Calibrate your answer to the altitude of the role you are pursuing. Executives listen for how you choose trade-offs and align stakeholders. Functional heads examine how you structure unknowns, define…])
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
#deck([To extract the capability behind a prompt, listen for three cues. First, listen for the verbs in the question: convince, reconcile, escalate, de-risk, pivot, define, sequence. Verbs often signal the capability in play. Second, scan for the constraint the interviewer introduces: limited time, limited budget, competing stakeholders, ambiguous data, cross-functional dependency. The constraint often matches the real constraint in the role. Third, consider the asker's vantage point. A finance leader asking about a delayed approval is likely testing governance and decision hygiene, not storytelling flair. If you are unsure, ask a one-line clarifying question that tests your hypothesis: would it help if I focus on how I structured the decision versus the implementation details. By validating the angle, you reduce…])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Spot the archetype of the prompt]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Most difficult prompts fall into a few archetypes: pressure test, trade-off test, alignment test, scope and sequencing test, and self-correction test. A pressure test sounds like tell me about a time the plan slipped. A trade-off test…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Map archetype to capability category]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Once you know the archetype, select the capability category most relevant to the role. Pressure tests often probe judgment and prioritization. Trade-off tests examine decision quality and risk appetite. Alignment tests assess stakeholder…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Anchor your role, scope, and constraint]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Before details, state three anchors: your role, the scope you owned, and the main constraint. For example, as the operations lead, I owned end-to-end scheduling across three work streams under a vendor reliability constraint. This prevents…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [To extract the capability behind a prompt, listen for three cues. First, listen for the verbs in the question: convince, reconcile, escalate, de-risk, pivot, define, sequence. Verbs often signal the capability in play. Second, scan for the constraint the interviewer introduces: limited time, limited budget, competing stakeholders, ambiguous data, cross-functional dependency. The constraint often matches the real constraint in the role. Third, consider the asker's vantage point. A finance leader asking about a…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Great decoding is wasted if your evidence is thin or mismatched. Build a compact inventory of episodes that demonstrate core capabilities for the target role. Do not chase perfect success stories. Choose moments where you exercised judgment in real conditions, including setbacks. For each episode, capture the role you played, the scope you actually owned, the binding constraints, the decision you made, the alignment work you did, and what you would do differently now. This turns raw experience into reusable signal that can be tailored to many prompts without sounding rehearsed or evasive.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Select episodes across constraint types]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Pick four to six episodes that span different constraints: time compression, budget pressure, ambiguous data, cross-functional conflict, shifting goals. This range lets you match the interviewer’s prompt with a…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Define your actual seat and edges]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[For each episode, write one sentence about what you owned end to end, and one sentence about what was outside your control. Candidates lose credibility when answers inflate authority. Clear edges increase trust and…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Name the decision and the trade-offs]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Identify the pivotal decision in the episode and the primary trade-off you navigated. For example, we chose stability over speed in the final two weeks, or we accepted short-term cost to avoid downstream quality risk.…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Create a one-page capability map for the role you are targeting. List the top five capabilities the role uses to deliver value, the constraints most common in the environment, and one episode from your inventory that demonstrates each capability. Keep it short enough to scan in one minute.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[As the (role), I owned (scope) under (constraint), with authority to (decision rights). I partnered with (key stakeholders) and was accountable for (outcome boundaries you genuinely owned).]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Given that setup, the pivotal decision was (trade-off). I framed options by (data, principles, or tests), aligned (stakeholders) by (method), monitored (risk), and learned (operating rule you now use).]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Translate each prompt into capability, constraint, and decision. Ask what capability is truly being tested, what constraint defines the playing field, and what decision reveals your judgment. Answer in that order: role, scope, constraint; reasoning; learning.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite one of your common interview answers so that the capability is explicit in the opening line, the constraint is named early, and the reasoning is described before any outcomes. Keep it under two minutes spoken time and use your inventory language verbatim.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile answers are either theatrical or thin. Theatrical answers overplay success, blur role boundaries, or turn complex situations into neat victories. They feel practiced but hollow, and they collapse under gentle follow-up because details do not line up. Thin answers avoid decisions, hide trade-offs, or provide only chronology. They drift without showing what you actually did and why. Both types fail the decoding test because they do not reveal the capability being assessed. Fragile answers also include unanchored claims, vague timelines, and anonymous teams doing the hard parts. If your story works only when no one asks a second…],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible answers are specific, proportional, and falsifiable. They start with your actual role and scope, so your authority is clear. They name the primary constraint so your decision context is visible. They reveal your reasoning by describing options considered and the principle or data that drove your choice. They acknowledge trade-offs and residual risk without dramatizing. They give credit to collaborators and state edges of control. They end with a learning you still apply, which makes the episode portable to new contexts. Because they are grounded in structure rather than theatrics, defensible answers welcome follow-up. If an…])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Run a quick audit on any answer you plan to use. First, role clarity: can a stranger understand what authority you actually had. Second, scope boundaries: can you name what you did not control and who you depended on. Third, constraint honesty: is the main constraint stated plainly without blaming others. Fourth, decision spine: can you state the pivotal decision in one sentence. Fifth, alignment work: did you outline how you handled dissent or secured support. Sixth, risk management: did you name how you reduced or monitored downside. Seventh, learning transfer: did you articulate a rule you now use. If any element is missing or padded, revise before you rehearse.])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Capability hypothesis]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Select a difficult interview question you expect. Write the likely capability being tested, the key constraint it implies, and why this matters in the role you are targeting.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Episode match]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[From your inventory, choose an episode that fits the capability and constraint. Write your role, scope, decision rights, and the specific trade-off you navigated.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Reasoning outline]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List the options you considered, the data or principles that guided your choice, and the alignment steps you took. Include how you monitored or limited risk.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Learning transfer]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write the operating rule you adopted because of this episode and one way you would apply it in the first 90 days in the target role.]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) We missed a quarter because the vendor did not deliver, but I rallied the team, pushed everyone harder, and we ended up shipping most of it anyway. It was tough, but we learned to never rely on that vendor again, and the leadership team was impressed with our effort under pressure.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) As the program lead, I owned integration across three work streams under a vendor reliability constraint. The capability you may be testing is how I prioritize under pressure. The pivotal decision was whether to delay the whole release or decouple two unaffected components. I framed options by mapping dependencies and testing a minimal viable release for impact on customers and support. I aligned engineering and support leads in a 24-hour checkpoint to choose decoupling, while scheduling a fallback if quality drifted. We moved forward with a smaller…])
#v(0.25em)
#small([The weak answer chases approval, blames a vendor, and implies heroics without decisions. The stronger answer names role, scope, constraint, capability, decision, options, alignment, risk control, and a durable rule. It is specific without making performance claims.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I had a conflict with a sales leader about pricing. We argued a lot, but I stood my ground. Eventually they gave in and we kept the price where I wanted it. It showed that I can be firm with peers and protect margins.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) As the product lead, I owned packaging and price structure; sales owned discounting within policy. I think you may be testing stakeholder alignment and principled negotiation. The pivotal decision was whether to change list price mid-cycle or adjust discount policy for a specific segment. I framed options by clarifying our pricing principles, reviewing segment willingness to pay signals, and modeling downstream support load by deal type. I held a joint working session to surface risks, then proposed a pilot discount floor for the contested segment with…])
#v(0.25em)
#small([The weak answer centers winning an argument. The stronger answer clarifies roles, surfaces the capability being tested, and shows principled alignment work inside constraints. It avoids claiming victory and focuses on repeatable decision hygiene.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Take three prompts from different domains and translate each into capability, constraint, and decision. For example, a question about cutting scope maps to prioritization under resource constraints; a question about a team dispute maps to alignment under ambiguity; a question about a missed forecast maps to accountability and correction. Practice with episodes that are adjacent but not identical to broaden your range without stretching credibility.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Pre-interview capability warm-up]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Skim your capability map and choose one episode for each top capability. Say the first sentence out loud: role, scope, constraint. Confirm that you can state the pivotal decision in one breath. If you cannot, tighten the episode or choose another.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Active decoding during the interview]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[When asked a complex prompt, silently name the archetype and capability. If uncertain, ask a one-line clarifier. Then answer with your anchors and reasoning. If the interviewer interrupts, do not speed up. Acknowledge, then continue with the decision and…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Mid-course correction]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[If you realize mid-answer that you chose the wrong capability lens, adjust explicitly. For example, I focused on prioritization, but it sounds like you are more interested in how I managed dissent. Let me illustrate that dimension in the same episode. This…]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Rehearse aloud with a timer. Practice opening with role, scope, and constraint in under fifteen seconds. Then practice a one-minute reasoning segment: options, principle or data, alignment, risk control. Finish with a ten-second learning rule. Record yourself once, listen for inflation, hedging, or vague verbs, and adjust. Do not memorize scripts. Memorize anchors and the decision spine. The goal is a steady cadence that can flex to different prompts while keeping your evidence honest and proportionate.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Before I jump in, would you like me to focus on how I structured the decision, how I aligned stakeholders, or the implementation details that followed.]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: List the top five capabilities your target role must deliver, based on the job description and conversations with peers. Write one sentence defining each capability in your…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Build your episode inventory. Capture six episodes across different constraints. For each, write your role, scope, constraint, pivotal decision, and learning rule.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Create your capability map linking each capability to one episode. Note gaps where you lack strong evidence and identify adjacent episodes that could work with a narrower…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Draft two-minute answers for three likely prompts, using the anchors and reasoning-first structure. Record yourself and mark any places where you inflate, hedge, or rush to…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Run a credibility audit with a trusted peer. Ask them to challenge role clarity, scope edges, decision spine, and learning transfer. Revise answers to address any weak…],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Conduct a live rehearsal. Ask a peer to mix prompts across archetypes and interrupt you mid-answer. Practice clarifying, adjusting capability lenses, and closing with your…])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will answer difficult prompts by naming the capability, stating my role, scope, and constraint, and revealing my reasoning and learning without exaggeration or blame.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://careercenter.umich.edu/content/interviewing-resources")[University of Michigan Career Center — Interviewing Resources]. This link is provided for general career-preparation context. Signal Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
