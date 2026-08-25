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
#show: report-theme.with(title: "The Executive Screen", author: "Career Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "executive-screen-0", short: [Executive screen], long: [Executive screen], description: [A short, early-stage conversation with a recruiter or hiring manager focused on basic fit, clarity, and trajectory rather than deep evaluation.]),
  (key: "operating-situation-1", short: [Operating situation], long: [Operating situation], description: [The environment and conditions in which you lead, such as turnaround, scale-up, integration, transformation, or stabilization under constraint.]),
  (key: "lever-2", short: [Lever], long: [Lever], description: [A practical mechanism you use to create change, like redesigning decision rights, instituting a planning cadence, or rationalizing a process.]),
  (key: "edge-constraint-3", short: [Edge constraint], long: [Edge constraint], description: [A limiting factor that shapes decisions, including time compression, regulatory windows, budget ceilings, multi-region complexity, or leadership transition.]),
  (key: "evidence-line-4", short: [Evidence line], long: [Evidence line], description: [A concise, two-sentence proof point that pairs context with a decision and action to demonstrate capability without a long story.]),
  (key: "role-relevant-opening-5", short: [Role-relevant opening], long: [Role-relevant opening], description: [A 75–90 second introduction that names your operating situations, shows two compact examples, and invites a next step aligned to the specific role.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 06 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 06 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[The Executive Screen]
#v(0.6em)
#text(size: 14pt, fill: muted)[Make the opening minutes of a recruiting or hiring-manager conversation easier to follow.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Design and deliver a concise, role-relevant opening that frames your mandate fit through the operating situations you are prepared to lead, so the first minutes of a recruiting or hiring-manager conversation are easy to follow and simple to act on.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Craft a concise, role-relevant opening that explains the operating situations you are prepared to lead through.
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
#text(size: 22pt, weight: "bold")[06 — The Executive Screen]
#v(0.55em)
#deck([This edition helps you shape the first two minutes of a live conversation with a recruiter or hiring manager. Those early minutes set the frame for everything that follows: what they listen for, which experiences they ask about, and how they imagine you operating in the job. A clear opening reduces cognitive load for the listener and shows that you are capable of leading complex work with structure and restraint. Many mid-career and executive candidates default to a biography or title recitation: a meandering walk through role history, a handful of buzzwords, and an unanchored claim of being results-oriented. That approach asks the listener to perform the translation. Busy interviewers rarely do. They need a quick mental model of where you operate well and how you make sense of ambiguous mandates. Your goal is not to tell your whole story; it is to quickly orient the listener to three things: the kinds of operating…])
#v(0.9em)
#callout([ORIENTATION], [Use this reader in three sittings. First, read the short guide so you understand the structure of an effective opening. Second, complete the inventory to identify the situations, levers, and constraints that define your best work. Third, assemble and rehearse a concise script that you can tailor to each role profile. You are writing for a listener who is making rapid, comparative decisions. Keep every sentence tied to the role at hand. Name situations before functions. Be careful with adjectives. Replace sweeping claims with concrete context, decisions, and actions. Aim for 75–90 seconds on the initial delivery. If you are between roles, you are curating a portable professional identity. If you are pursuing an internal move, you are reframing known experiences for a new mandate. In both cases, the structure is the…])
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
#deck([Your opening is a compact map: situation, lever, evidence, handoff. Name the operating situations you lead through, show two decision-and-action fragments that fit the role, and point the listener to the next question. Clear beats complete.])
#v(0.75em)
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Clarify the job of your opening]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[The first minutes are not a test of charm; they are a test of clarity. Your opening needs to do four things quickly: orient the listener to your operating zone, connect that zone to the role they are filling, demonstrate traction with two…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Map the anatomy: positioning line, evidence lines, handoff]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[An effective opening has a simple structure you can memorize and adapt: 1) Positioning line (10–15 seconds). Name your function and the operating situations you lead through. Include the scale or constraints only if they matter to this…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Choose role-relevant operating situations]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Operating situations are the environments and conditions under which your leadership is most effective. Common patterns include: - Turnaround with time pressure and trust deficits - Scale-up from founder-led to durable operating model -…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [Your opening is a compact map: situation, lever, evidence, handoff. Name the operating situations you lead through, show two decision-and-action fragments that fit the role, and point the listener to the next question. Clear beats complete.])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Before you assemble the script, inventory the patterns that define your best work. You are looking for repeatable situations, not isolated wins. Capture the decisions you owned, the levers you used, and the constraints you operated within. Translate insider projects into market language a recruiter or cross-functional leader can understand. This work positions you to sound specific without sounding narrow and to be confident without over-claiming. The inventory should be concise, but it must be rich enough that you can draw two tight evidence lines for any role you pursue.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Map your recurring operating situations]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[List three to five situations you have confronted more than once. Name them in neutral, portable language. Examples: stabilizing a function after leadership turnover; moving from founder-driven to system-driven…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Identify the levers you reliably pull]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[For each situation, write the primary levers you used. Keep them behavioral and testable. Examples: redesigning planning cadences; implementing a lightweight intake process; reframing metrics into a weekly operating…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Capture edge constraints and conditions]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Strong openings mention the constraints that shaped the work. Constraints can include time compression, budget ceilings, regulatory windows, multi-region complexity, vendor lock-in, or leadership transitions. Naming…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Assemble a 75–90 second opening for a specific target role. Use the positioning line + two evidence lines + handoff structure. Draft it verbatim, then refine for clarity, brevity, and role relevance.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[I lead (function or mandate) for organizations navigating (operating situation), especially when (key constraint or condition).]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[For example, in (concise context), I owned the decision to (critical decision). I (specific action taken), which shows how I (capability or lever) under (relevant constraint).]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Name the situation first, then the function. Replace insider labels with portable language. Tie actions to decisions you owned. Use simple verbs. Use “so that” or “which shows” to connect actions to capability. Avoid adjectives you cannot defend with a later example.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Refactor your current bio or long introduction into the structure above. Delete excess chronology. Keep only the situations, levers, and two evidence lines that match the role you are discussing. End with a clear handoff inviting the next question.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile openings share common traits: they over-index on titles, rely on buzzwords, and ask the listener to do the translation. They describe feelings about leadership rather than decisions. They tell long stories with no clear end. They make claims that cannot be proved within a hiring process. They ignore the hiring mandate and present a generic identity. These moves make it hard for the interviewer to place you inside their problem set and create early doubt about fit.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) A defensible opening is modest in tone, precise in language, and grounded in decisions you owned. It prioritizes role relevance over biography, situations over slogans, and clarity over performance. It includes constraints that show your operating judgment. It uses examples that you can unpack in detail later. It invites focused follow-up rather than fishing for praise. This kind of opening travels across industries because it rests on portable operating logic, not internal labels or one-off wins.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you use your opening, run a short audit: 1) Every claim maps to a decision you can explain step by step. 2) Terms are understandable to a cross-functional listener. 3) The situations you name match the context of the role. 4) Constraints are stated plainly rather than dramatized. 5) Your examples do not rely on confidential details. 6) A former colleague would nod at the description. 7) If you removed adjectives, your opening would still stand. 8) Your resume and LinkedIn timeline will not contradict this framing.])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Situations to lead through]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List two operating situations that best match the target role. For each, write one sentence naming the situation in market language (e.g., post-merger integration across regions; scale-up from founder-led to operating…]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Levers and decisions]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[For each situation, name the primary lever you would pull (e.g., redesign decision rights, rationalize go-to-market motion, implement planning cadence). Write the specific decision you typically own when using that…]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Constraints and conditions]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Identify two constraints you have successfully worked within that are likely relevant to the role (e.g., time compression, regulatory change, stakeholder sensitivity, budget ceilings). Write one sentence on how you…]
#v(0.35em)
#block(width: 100%, stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Evidence lines]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Draft two evidence lines using the structure: context, decision, action, capability. Keep each to two sentences. Example starter: “In (context), I owned the decision to (decision). I (action), which shows how I…]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I’m a results-driven leader with over 15 years of experience leading cross-functional teams. I’ve worked in different industries and I’m passionate about growth and innovation.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) I lead go-to-market and integration work for organizations moving from founder-led to repeatable operating models, especially when timelines are tight and teams are stretched. For example, during a time-bound integration across two regions, I owned the decision to unify the customer handoff and simplify sales support. I set a weekly operating review with clear intake and decision rights, which shows how I stabilize commitments while teams transition.])
#v(0.25em)
#small([The before version is a title-and-adjective cloud; it leaves the listener to infer fit. The after version names the situation, the lever, and a decision owned. It shows how the candidate would operate inside a scale-up or integration mandate without making claims that require confidential data.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I’m a strategic HR professional who cares deeply about people and culture. I’ve partnered with the business to drive engagement and transform organizations.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) I build practical talent systems for organizations formalizing from informal operations, often under regulatory scrutiny or rapid growth. In my last mandate, I owned the decision to introduce a simple performance and feedback cadence for a distributed team during a hiring freeze. I trained managers on a light, monthly rhythm and clarified decision rights for promotions, which shows how I create clarity and momentum without adding bureaucracy.])
#v(0.25em)
#small([The before version centers passion and aspirations; it lacks operating context. The after version anchors to a recognizable situation, a lever the listener can test, and a decision the candidate owned. It signals fit for mandates that require order and trust without overstating outcomes.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Adapt your opening for two adjacent contexts: an internal move and an external search. For the internal move, reference shared context sparingly and translate insider labels into portable language as if the listener were external. For the external search, preserve the same structure but pick situations and levers that map cleanly to the posted mandate. In both cases, end with a handoff that invites the interviewer to connect your examples to their immediate priorities.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Time and trim test]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Read your opening aloud and time it. Aim for 75–90 seconds. Cut extra adjectives and subordinate clauses. Replace multi-word phrases with single words. If a sentence does not point to the role, remove or tighten it.]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Outsider clarity check]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Share the script with someone outside your function. Ask them to repeat back what you do, where you operate best, and what you might do in the target role. If they struggle, your language is still insider-focused. Rewrite until a cross-functional peer can…]
],
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Role alignment scan]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Compare your opening to the role description and known mandate. Circle the words that match their priorities. If your situations or levers do not mirror the role’s needs, adjust them. Delete anything that forces the listener to bridge a big gap. Add…]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Repetition under small amounts of pressure makes your opening reliable. Practice standing, with a timer, while looking at a neutral point on the wall to simulate eye contact. Work toward consistent pace and even tone. Record and play back once a day for a week; minor adjustments compound quickly. Practice switching between a general version and two role-specific versions. The muscle you are building is not memorization; it is the ability to choose quickly which situations and levers to highlight based on what you learn before the call. Keep a one-page crib sheet with three situations, three levers, and three constraints so you can swap elements without rewriting the whole script. Finish your rehearsal by practicing the…])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Thanks for making time. I lead (function or mandate) for organizations navigating (operating situation), especially when (key constraint). For this role, I’m focused on the (specific mandate from job description), where…]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Select one target role. Extract the mandate, likely operating situations, and constraints from the posting and any notes you have.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Complete the inventory. Write three situations, three levers, and two constraints in market language. Translate insider terms.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Draft your positioning line and two evidence lines. Keep it to 75–90 seconds. Remove chronology and extra adjectives.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Record the opening three times. Edit for clarity and pace. Replace any vague claims with a decision-action-capability fragment.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Test with one cross-functional peer and one recruiter or mentor. Adjust language so both can restate your fit in their own words.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Deliver the opening in a live context: a screening call, a networking conversation, or a mock interview. Note what follow-up questions it triggers and refine accordingly.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will lead the first two minutes with a role-relevant, situational opening that invites a focused next question.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://wasserman.nyu.edu/channels/interviewing-negotiation-process/")[NYU Wasserman Center — Interviewing & Negotiation Process]. This link is provided for general career-preparation context. Career Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
