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
#show: report-theme.with(title: "The Whole-Role Negotiation Map", author: "Career Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "total-compensation-0", short: [Total compensation], long: [Total compensation], description: [All forms of pay combined, including base salary, bonuses, equity or long-term incentives, and any one-time payments like sign-on or relocation.]),
  (key: "scope-of-role-1", short: [Scope of role], long: [Scope of role], description: [The set of responsibilities, decision rights, stakeholders, and resources you will manage or influence to achieve the role’s goals.]),
  (key: "decision-criteria-2", short: [Decision criteria], long: [Decision criteria], description: [The personal and professional standards you use to judge fit, such as baseline needs, growth goals, risk tolerance, and values alignment.]),
  (key: "variable-pay-3", short: [Variable pay], long: [Variable pay], description: [Compensation that depends on performance against targets or discretion, such as bonuses or commissions, often paid on a set schedule.]),
  (key: "working-conditions-4", short: [Working conditions], long: [Working conditions], description: [The practical environment for doing the job, including location, schedule norms, travel, tools and systems, collaboration cadence, and manager style.]),
  (key: "give-get-pair-5", short: [Give-get pair], long: [Give-get pair], description: [A trade that preserves your anchors while offering flexibility elsewhere, such as an earlier start date in exchange for an onboarding budget or review timing.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 09 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 09 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[The Whole-Role Negotiation Map]
#v(0.6em)
#text(size: 14pt, fill: muted)[Evaluate the offer as a whole role, not only as a headline salary number.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Build a clear, side-by-side view of the whole role—compensation, benefits, scope, working conditions, and decision criteria—so you can negotiate or decide with discipline, not guesswork.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Compare compensation, benefits, scope, working conditions and decision criteria before you negotiate or decide.
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
#text(size: 22pt, weight: "bold")[The Whole-Role Negotiation Map]
#v(0.55em)
#deck([A headline salary number can feel like the entire story, especially when time pressure is high. Yet roles differ in ways that never show up on the first page of an offer letter. Titles hide scope. Bonuses mask risk. Benefits shift value across time. Working conditions can either multiply your effectiveness or drain it. Your long-term arc depends on more than cash in year one. This edition helps you evaluate and negotiate as a whole-role thinker. You will create a compact map that translates the offer into clear categories: what you will do, how you will be measured, how you will be supported, how you will be rewarded, and how the experience advances your broader goals. You will place each element on a scale from must-have to flexible. You will identify trade-offs you are willing to offer and the few items you need to protect. The point is not to extract everything. The point is to choose consciously. When you can…])
#v(0.9em)
#callout([ORIENTATION], [Use this edition in three passes. First, read and mark anything that applies to your current offer or target role. Second, complete the worksheet prompts to surface your baselines, non-negotiables, and flex areas. Third, assemble your negotiation moves using business-framed language that ties what you are asking for to what you will deliver. You will leave with a one-page Whole-Role Negotiation Map and a short script. Expect to tighten your scope, clarify support and success metrics, and identify two or three changes that would materially improve fit. If the offer is already strong, your map will give you confidence to accept. If key gaps remain, your map will help you request changes with a clear rationale or decide to walk away with poise.])
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
#deck([Extract the facts you have and the gaps you need to fill. List every concrete number and policy you know: base pay, bonus target and formula, equity units or percentage, vesting schedule, benefits premiums, time-off rules, work location and travel expectations, role title, reporting line, number of direct reports, decision rights, and review cadence. Note what is unclear or undocumented. Convert all timing references into dates or cycles. Where your only source is verbal, mark it as such. This extraction snapshot becomes your single source of truth for mapping, questions, and negotiation messages.])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Name the five domains of a whole role]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Break the role into five domains you can actually compare. Compensation: salary, bonus structure, equity or profit-sharing, and review cadence. Benefits: healthcare and wellbeing, retirement, paid time off, leave policies, education…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Translate vague language into operational terms]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Offer letters and conversations often use words that sound good but lack concrete meaning. Translate phrases like lead strategic initiatives into named areas, measurable responsibilities, and key stakeholders. Ask, which decisions will I…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Assign value and risk across time]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Some elements pay now; others pay later. A higher bonus tied to team results increases risk in your first year. A lower cash salary with strong learning and visible scope may compound into future roles. Generous benefits, flexible working,…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [Extract the facts you have and the gaps you need to fill. List every concrete number and policy you know: base pay, bonus target and formula, equity units or percentage, vesting schedule, benefits premiums, time-off rules, work location and travel expectations, role title, reporting line, number of direct reports, decision rights, and review cadence. Note what is unclear or undocumented. Convert all timing references into dates or cycles. Where your only source is verbal, mark it as such. This extraction snapshot…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Now, inventory your position. You need baselines, preferences, and boundaries before you enter a negotiation. Baselines ensure you do not accept a role that cannot support your life. Preferences help you maximize fit without inflating risk. Boundaries prevent you from agreeing to conditions that undermine your ability to deliver.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Set your baselines]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Define the minimums you need to say yes with integrity. Capture your base pay floor, required healthcare or equivalent stipend needs, vacation floor, location constraints, and any must-have schedule protections. Link…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Prioritize your growth and impact goals]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Identify the top two skills or experiences you intend to gain in the next 12–24 months and the kind of impact you want to be accountable for. Examples include leading a cross-functional initiative, owning a P&L slice,…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Define your risk tolerance and buffers]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Decide how much performance risk you can carry in year one. Consider variable pay percentage, dependence on factors you do not control, ramp expectations, and ambiguity level. Identify buffers you would require if risk…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Assemble your Whole-Role Negotiation Map: a one-page summary that compares the current offer to your baselines and priorities, highlights gaps, proposes give-get pairs, and frames two to three specific changes that would create a strong, sustainable fit.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[To meet the goals you set for this role, I will need the authority, resources, and terms that enable reliable delivery.]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Here is how these terms translate into higher likelihood of the outcomes we discussed.]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Translate every personal preference into a performance rationale: tie each ask to delivery speed, quality, risk reduction, or measurable capacity to hit agreed targets.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite each ask so it names the outcome at stake, the specific term that enables it, and the mutual benefit. Replace statements like I need more money with language that links the number or condition to concrete responsibilities or results.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile positions are asks that are hard to defend under scrutiny because they are framed as personal wants, lack evidence, or depend on exceptions that create internal inequity. Examples include I want a higher title because it sounds better, I need a big signing bonus because I am moving, or Can we keep this off the books? Fragile positions also include vague scope demands like fewer meetings without tying them to decision speed or delivery. When challenged, fragile positions collapse or trigger defensive reactions. They invite pushback and rarely survive approval layers. Your goal is to convert fragile asks into business-grounded…],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible positions are requests grounded in the role’s requirements, supported by comparable internal structures, and framed as enablers of performance. They state the outcome at risk, the needed condition, and a reasonable implementation. Examples: Given the cross-functional ownership and timeline, aligning the title with decision rights will prevent delays in approvals; a formal 90-day review with a calibration of scope reduces ramp risk and ensures bonus criteria are in reach; adjusting base pay to the stated band midpoint reflects year-one responsibilities and supports retention through the build phase. Defensible positions survive…])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you send any negotiation message, audit your credibility. Check that every claim you make is accurate, current, and proportionate to your track record. Avoid overstating past impact or implying guarantees about future results. Replace absolute language with measured commitments, such as I will establish, I will lead, or I will deliver within the scope we agree. Verify that your asks fit within typical ranges for the level. Ensure your tone respects the manager’s constraints and the organization’s policies. Close by inviting collaboration, not ultimatums. A short, precise, respectful note is more persuasive than a long, emotional one.])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Offer snapshot]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List the exact base salary, bonus target and formula, equity or long-term incentive details, benefits premiums and coverage summary, paid time off, location and schedule expectations, title, reporting line, team size,…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Baseline check]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write your base pay floor, benefits and time-off minimums, location and schedule limits, and any must-have resources or decision rights. For each item, write one sentence explaining why it is necessary for you to…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Priority map]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Rank your top three goals for the next 12–24 months and the kind of impact you want to own. For each, note how the offer supports or impedes the goal and what adjustment would materially improve fit.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Trade space and give-get pairs]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List three flexible items you could trade (start date, review timing, scope sequencing, hybrid days, or professional development budget) and three corresponding asks you would pair with them. Write one short sentence…]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I need a higher title and more money to feel good about this move.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Given the cross-functional ownership and the need to steer decisions across teams, aligning the title with decision authority will reduce approval delays. If we adjust the title accordingly and set base pay at the band midpoint for that level, I can reliably deliver the roadmap we outlined. I am open to a slightly later start date to accommodate onboarding with the key partners we identified.])
#v(0.25em)
#small([The before statement is a personal preference with no operational hook. The after statement ties title and pay to decision speed and delivery reliability, references internal bands, and includes a give-get trade. It gives the manager a business case to take upstream.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) Can we make the bonus higher since the salary is lower than I hoped?],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Because the first-year targets depend on factors outside my direct control, I would like to calibrate risk and reward. If we increase base pay to narrow the gap with my baseline and set a 90-day review to confirm scope, I am comfortable leaving the current bonus structure in place. This balances fixed and variable pay in a way that supports focus during ramp.])
#v(0.25em)
#small([The before statement asks for a discretionary increase without context. The after statement reframes the issue as risk calibration, proposes a specific adjustment supported by a review milestone, and shows willingness to keep the variable structure if the base is aligned.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Apply the Whole-Role Negotiation Map to any future opportunity. For each new role, repeat the extraction, baseline check, priority map, and give-get design. Keep your templates so you can compare offers quickly and spot patterns in what produces your best work.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Pressure-test your non-negotiables]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Ask yourself if each non-negotiable is tied to your ability to deliver, not just comfort. For each, write the specific risk if it is not met and the mitigation you tried to design. Remove any item that is really a preference in disguise. This step tightens…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Check for internal consistency]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Make sure your asks do not conflict. For example, if you ask for larger scope and fewer hours without adding resources or changing priorities, your message will appear unrealistic. Align title asks with decision rights and reporting line. Align bonus…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Model the first 90 days under the current offer]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Write a one-page outline of what you will do in the first 90 days if you accept as is. Identify friction points you would face and resources you would need. If the plan looks plausible, your negotiation can be lighter and focused. If the plan is full of risks…]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Say your asks out loud until they sound calm, brief, and businesslike. Practice a 30-second setup that states enthusiasm and frames your goal as setting conditions for success. Then state each ask in one sentence that names the outcome, the term, and the benefit. Prepare one sentence for likely objections, such as budget, policy, or timing. End by inviting collaboration and next steps. Record yourself, listen for filler and hedging, and revise for clarity. Confidence comes from simple, specific language delivered at a steady pace.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[I am excited about this role and want to set us up for reliable delivery; may I share two adjustments that will reduce ramp risk and help me meet the targets we discussed?]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Extract every concrete term from the offer and list gaps you need to clarify.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Complete your baseline check and write the rationale for each minimum.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Map your top three goals and assess how the current offer helps or hinders each.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Design two or three give-get pairs and convert fragile asks into defensible ones.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Draft your negotiation message, run a credibility audit, and rehearse aloud.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Hold the conversation, document agreements, and update your Whole-Role Negotiation Map.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will choose based on the whole role, not a single number. I will ask for the conditions I need to deliver. I will trade in good faith, protect my anchors, and make a clear, timely decision.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx")[DePaul Career Center — Job Offers & Salary Negotiation]. This link is provided for general career-preparation context. Career Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
