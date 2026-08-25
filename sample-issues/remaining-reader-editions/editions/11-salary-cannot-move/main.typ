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
#show: report-theme.with(title: "When Salary Cannot Move", author: "Career Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "base-salary-ceiling-0", short: [Base salary ceiling], long: [Base salary ceiling], description: [A firm limit on base pay set by level, parity, or budget rules that is not likely to change for this offer.]),
  (key: "total-compensation-1", short: [Total compensation], long: [Total compensation], description: [The sum of cash and non-cash components, including salary, bonus, equity, benefits, and any one-time payments.]),
  (key: "non-cash-value-2", short: [Non-cash value], long: [Non-cash value], description: [Benefits or terms that do not increase base pay but improve the package, such as time flexibility, learning funds, or equipment.]),
  (key: "decision-rights-3", short: [Decision rights], long: [Decision rights], description: [Who has authority to approve each term of the offer and the process or timing they follow.]),
  (key: "trade-off-4", short: [Trade-off], long: [Trade-off], description: [A concession or sequencing you accept to make approval easier, such as a milestone review in place of an immediate title change.]),
  (key: "walk-away-line-5", short: [Walk-away line], long: [Walk-away line], description: [Your pre-defined boundary for declining, stated in terms of conditions that prevent performance or create unacceptable risk.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 11 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 11 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[When Salary Cannot Move]
#v(0.6em)
#text(size: 14pt, fill: muted)[Clarify the overall package and ask responsibly without assuming every term is negotiable.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Build a precise, respectful plan for clarifying the entire offer and identifying one or two priority terms to discuss when base salary is largely fixed.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Identify the one or two terms, questions or conditions that matter most when base salary has limited flexibility.
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
#text(size: 22pt, weight: "bold")[Choose the one or two levers that matter most]
#v(0.55em)
#deck([There are many moments in a career when base salary is constrained. Budgets close, pay bands are firm, or internal parity guardrails are in play. You may still feel pressure to advocate for yourself while maintaining a constructive tone. This edition helps you clarify the total package, decide what truly matters for this transition, and ask responsibly without signaling that everything is negotiable. You will assemble facts about the offer, map your needs and trade-offs, and practice a focused ask with alternatives. The goal is to reach a decision you can defend to yourself and your stakeholders, even if the number you hoped for is not available.])
#v(0.9em)
#callout([ORIENTATION], [You are not negotiating a number; you are designing a workable start. When base salary cannot move, shift from pushing to mapping. Clarify the full package, the timeline of value, and the terms that protect your ability to deliver. Ask for the smallest set of changes that unlock the most relief, performance, or stability. Anchor in business logic, not personal need. Show you understand where the employer is constrained, and place your requests within decision paths they can actually use. If you accept, accept cleanly. If you decline, close the loop respectfully and keep the door open.])
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
#deck([When you receive an offer and hear that base is fixed, slow the conversation long enough to collect the moving parts. Ask for a written summary of all compensation components, eligibility dates, and any one-time items. Verify bonus cycles, vesting schedules, and policy-based benefits. If something is unclear, ask what precedent exists and who owns the decision. Extract the timing of value and the names of decision makers. With this picture, you can judge what to elevate in your ask versus what to leave untouched. Do not assume silence equals flexibility. Confirm whether a term is discretionary or governed by a rule.])
#v(0.75em)
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Confirm the ceiling and why it exists]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Before you decide what to ask for, verify the salary ceiling and understand its source. Ask clear, non-confrontational questions to learn whether the limit is policy, budget timing, level, or internal parity. Clarify the effective date for…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Map the whole offer into present and future value]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Capture each element of the package across time. Write down base salary, bonus targets and timing, equity or long-term incentives, sign-on amounts and vesting, benefits, retirement match timing, paid time off, remote or hybrid provisions,…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Distinguish deal-breakers from enhancers]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Separate must-haves from nice-to-haves. A must-have is a term that meaningfully affects your ability to accept and succeed, such as flexible hours to cover caregiving, a sign-on to bridge a gap, or a title level that grants access to key…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [When you receive an offer and hear that base is fixed, slow the conversation long enough to collect the moving parts. Ask for a written summary of all compensation components, eligibility dates, and any one-time items. Verify bonus cycles, vesting schedules, and policy-based benefits. If something is unclear, ask what precedent exists and who owns the decision. Extract the timing of value and the names of decision makers. With this picture, you can judge what to elevate in your ask versus what to leave untouched.…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Before responding, conduct a brief inventory of your needs, risks, and tradeable value. You are clarifying what you truly need to accept, the risks you need to hedge, and what you can offer or sequence to enable your request. This prevents you from arguing your personal preferences and positions you to propose terms that help the business while addressing your constraints.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[List non-negotiables and exposure points]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Identify the small set of conditions that will materially affect your decision. Examples include a minimum first-year cash floor due to overlapping obligations, a schedule guardrail, or level alignment that unlocks the…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Identify levers you can trade or sequence]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Note where you can be flexible in exchange for your priority term. You might accept a later start date to align with budget timing, commit to a structured onboarding plan that accelerates impact, or agree to revisit…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Map approval paths and timing]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Think about who can approve each term. Base salary is often bound by level and parity. Sign-ons may sit with talent or finance. Title alignment involves org design. Remote work may require executive sign-off. Ask your…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Assemble a one-page negotiation brief. Include your understanding of the salary ceiling and why it exists, a timeline of value across the offer, your two must-haves with a sentence on business impact, your single focused ask, a narrower fallback, and a clean acceptance statement. Bring this to any live call to keep the conversation tight.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[The role I am ready to accept is...]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[Based on the scope, deliverables, and timing we discussed...]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Translate personal wants into operational outcomes and approval-ready terms. Replace statements like I need more money with a specific, low-friction proposal that connects to execution, timing, or risk reduction for the employer. Use language that aligns with internal decision rules.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite your ask so it names one precise term, ties it to delivery or risk reduction, and states a realistic approval path and fallback.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile stances include arguing fairness without context, presenting a long list of small items, or implying you will accept only if multiple unrelated terms move. Demanding exceptions without acknowledging policy invites pushback. Framing the ask as compensation for personal life events without linking to delivery weakens your case. Sounding vague about timing or decision owners also reduces credibility.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible stances emphasize deliverables, timing, and the minimal change that unlocks your start. They acknowledge constraints, propose a concrete path to approval, and include a fallback you could accept. They show you have ranked your needs, understand parity and bands, and will make a crisp decision. This tone helps your counterpart advocate for you and preserves the relationship if the answer is no.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you ask, check three points. First, does your request align with how the organization actually approves things, including timing and level rules. Second, is your business logic clear enough that your counterpart could repeat it in a two-sentence summary to the final approver. Third, are you prepared to accept quickly if your one or two priority terms are met, or to decline respectfully if they are not. If any answer is no, refine the ask until it passes this audit.])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Map the value timeline]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List each offer component and note when it delivers value to you in the first 18 months. Include salary, bonus, sign-on, equity, benefits, and any waiting periods.]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Name your two must-haves]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write the one or two terms that would materially change your decision to accept. State why each matters for performing the role, not just for personal preference.]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Draft your focused ask]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write a three-sentence request that names one precise change, ties it to delivery or risk reduction, and states the approval path and a narrower fallback.]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Define your walk-away line]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write one sentence that states the minimum conditions under which you would decline and the reason that is consistent with your performance and commitments.]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]

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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I really need a higher base. If you cannot move it, I would also like more vacation, a better title, and a work-from-home allowance.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) I understand the base is fixed due to level and parity. To make this transition work, could we add a one-time sign-on payable on start to bridge the gap from forfeited earnings. If sign-on funds are limited, a smaller sign-on with a three-month vesting or a relocation stipend would still address the cash-flow risk. I can confirm acceptance upon approval.])
#v(0.25em)
#small([The weak version bundles many unrelated items and centers personal need without a decision path. The improved version acknowledges the constraint, names one business-aligned term with a clear purpose, and offers a fallback with similar intent. It shows the candidate understands approval mechanics and will decide quickly, which helps the counterpart advocate…])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I want the senior title and a bonus guarantee because I am taking a risk.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Given the cross-functional scope and the stakeholders we discussed, title alignment to the senior level would enable the access needed to deliver. If the title must follow the normal review, could we set a written milestone review at six months tied to defined outcomes and confirm bonus eligibility from start. I am comfortable starting with the current base under that plan.])
#v(0.25em)
#small([The first version asserts risk without linking to delivery. The improved version connects the title to access and scope, acknowledges the standard process, and proposes a dated, outcome-based review with clear eligibility. It trades immediate change for a scheduled path and keeps the salary constraint out of dispute.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Your focused-ask method also works for internal moves, retention discussions, and project-based engagements where rates are capped. In each case, clarify the ceiling, map value over time, rank a tiny set of must-haves, and propose one precise change tied to delivery. The same credibility audit applies before you ask.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Clarity check]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Can someone outside the conversation read your one-page brief and repeat your ask and the reason in two sentences. If not, simplify. Remove extra adjectives and limit scope to one or two terms. Make the approval path explicit.]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Reputation check]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[How would your request look if shared internally by email. Ensure your tone is respectful and focused on delivery. Avoid framing that sounds entitled or transactional. Assume your words will be forwarded to the final approver.]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Decision check]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[If you receive a yes on your primary or fallback term, are you ready to accept promptly. If you receive a no on both, are you ready to decline respectfully. Decide in advance to avoid prolonged back-and-forth.]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Practice the conversation out loud. Start by acknowledging the base constraint and summarizing the role you are ready to accept. Deliver your focused ask in one breath. Pause. If you hear resistance, ask one clarifying question about decision rules, then present your fallback. Close by confirming you will decide quickly based on their response and timeline. Keep your tone calm, brief, and collaborative.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[I understand base is fixed at this level. To start effectively, could we approve a one-time sign-on payable on start, or alternatively a smaller sign-on with a short vesting schedule.]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 76pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]

#pagebreak()
// PAGE 10 — NEXT STEPS AND GLOSSARY
#header("10", "NEXT STEPS")
#v(1em)
#kicker([MAKE THE NEXT MOVE CONCRETE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A six-day application reset.]
#v(0.6em)
#grid(columns: (30pt, 1fr), row-gutter: 8pt,
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Request the full written offer with timing details for each component and confirm who owns each decision.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Map your value timeline across the first 18 months and mark exposure points you need to cover.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Rank two must-haves and one fallback. Discard enhancers from your negotiation plan.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Draft your focused ask and run the credibility audit with a trusted peer.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Rehearse your spoken prompt and schedule the call with the recruiter or hiring manager.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Deliver the ask, document outcomes, and make a clear accept or decline plan based on responses.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will ask for the smallest set of changes that unlock a workable start, and I will decide promptly based on clear, written terms.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx")[DePaul Career Center — Job Offers & Salary Negotiation]. This link is provided for general career-preparation context. Career Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
