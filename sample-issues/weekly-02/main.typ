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
#show: report-theme.with(
  title: "The ATS Translation Layer",
  author: "Career Weekly · A Signrl publication",
  rhythm: "longform",
  body-size: 10pt,
  running-header: false,
)

#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)

#let terms = (
  (
    key: "ats",
    short: "ATS",
    long: "applicant tracking system",
    description: [Software an employer may use to organise application materials and support its hiring process.],
  ),
  (
    key: "role-language",
    short: "role language",
    long: "role language",
    description: [The employer’s own wording for the mandate, outcomes, operating context and capabilities of a role.],
  ),
  (
    key: "evidence",
    short: "evidence",
    long: "evidence",
    description: [A specific project, decision, contribution or observable result that can support a professional claim.],
  ),
  (
    key: "scope",
    short: "scope",
    long: "scope",
    description: [The scale, complexity, stakeholders, constraints and decision rights that define the work you performed.],
  ),
  (
    key: "outcome",
    short: "outcome",
    long: "outcome",
    description: [The observable change, decision, delivery or learning that followed your work.],
  ),
  (
    key: "keyword-stuffing",
    short: "keyword stuffing",
    long: "keyword stuffing",
    description: [Adding terms without the relevant experience or evidence needed to explain them credibly.],
  ),
)
#register-glossary(terms)

#let header(number, label) = [
  #align(left)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 02 · FROM THE SAMPLE LIBRARY]
    #h(1fr)
    #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]
  ]
  #v(0.45em)
  #line(length: 100%, stroke: 0.9pt + cobalt)
]

#let kicker(body) = text(size: 8pt, weight: "bold", fill: cobalt, tracking: 0.07em)[#body]
#let deck(body) = text(size: 12pt, fill: muted)[#body]
#let small(body) = text(size: 8pt, fill: muted)[#body]
#let pill(body) = block(fill: soft-blue, inset: (x: 8pt, y: 4pt), radius: 3pt)[#text(size: 7.5pt, weight: "bold", fill: cobalt)[#body]]
#let callout(title, body) = block(fill: soft-blue, inset: 13pt, radius: 5pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[#title]
  #v(0.45em)
  #body
]
#let step(number, title, body) = block(stroke: (left: 2.2pt + cobalt), inset: (left: 11pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[#number]
  #h(0.55em)
  #text(weight: "bold")[#title]
  #v(0.25em)
  #text(fill: muted)[#body]
]
#let worksheet-field(label, prompt, height: 66pt) = [
  #text(size: 8pt, weight: "bold", fill: cobalt)[#label]
  #v(0.25em)
  #text(size: 8.5pt, fill: muted)[#prompt]
  #v(0.45em)
  #block(stroke: 0.7pt + line-grey, inset: 8pt, height: height)[#text(size: 8pt, fill: luma(125))[Write here. Use specific projects, decisions, constraints and results—not general qualities.]]
]

// PAGE 1 — COVER
#set page(numbering: none, header: none)
#align(left)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 02 · READER EDITION]
  #h(1fr)
  #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]
]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 32pt, weight: "bold", fill: ink)[The ATS\
Translation Layer]
#v(0.6em)
#text(size: 14pt, fill: muted)[Use a role’s real language while keeping every claim honest, relevant and ready to explain aloud.]
#v(1.8em)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 12pt,
  pill([10 PAGES]),
  pill([20–30 MINUTES]),
  pill([ONE REUSABLE MAP]),
)
#v(2em)
#callout([WHAT YOU WILL COMPLETE], [
  By the end of this reader edition, you will have a role-to-evidence map for one target role, two revised résumé lines, and a short spoken explanation of why your experience is relevant. The goal is not to mimic a job description. It is to make the work you have genuinely done easier to recognise.
])
#v(1.6em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
You are tailoring a résumé, preparing for an initial recruiter conversation, or deciding whether a role is genuinely aligned with your background.
#v(1.7em)
#line(length: 100%, stroke: 0.5pt + line-grey)
#v(0.4em)
#small([This is a Sample Briefing prepared for educational reading, not a historic newsletter issue. It offers a practical framework and does not guarantee a screening, interview or employment outcome.])

#pagebreak()
#set page(numbering: "1", header: none)

// PAGE 2 — THE DECISION
#header("02", "THE DECISION")
#v(1em)
#kicker([THE POSITIONING PROBLEM])
#v(0.45em)
#text(size: 23pt, weight: "bold")[Your résumé is not a biography.\ It is a business case.]
#v(0.55em)
#deck([A job description is written from the employer’s point of view. Your résumé is usually written from your own career history. The translation layer connects the two without distorting either.])
#v(1.1em)
An #gls("ats") may help organise the language and information in an application, but the more useful question is broader: *can a recruiter or hiring manager quickly see why your past work is relevant to this role now?* That requires #gls("role-language") and #gls("evidence") to meet in a form a real person can follow.

#v(0.8em)
#grid(
  columns: (1fr, 22pt, 1fr, 22pt, 1fr),
  align: horizon,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(weight: "bold")[ROLE LANGUAGE] #v(0.35em) The employer’s mandate, context and requested capabilities.],
  align(center)[#text(size: 17pt, fill: cobalt)[→]],
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(weight: "bold")[YOUR EVIDENCE] #v(0.35em) Projects, decisions, operating context and results you can explain.],
  align(center)[#text(size: 17pt, fill: cobalt)[→]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(weight: "bold", fill: cobalt)[CREDIBLE MATCH] #v(0.35em) Clear wording that makes relevance easy to recognise.],
)

#v(1em)
#callout([THE HONESTY GATE], [
  Do not add a term merely because it appears in a posting. Add it only when you can describe the context, your contribution and the result without improvising. If you cannot explain it aloud, it is not a stronger application—it is a fragile one.
])
#v(0.85em)
#text(size: 8pt, weight: "bold", fill: cobalt)[TWO-MINUTE ORIENTATION]
#v(0.3em)
Before you continue, write the title of one role you are genuinely considering. Then answer three questions in the margin or on a separate note: What problem appears to have created this role? What would a stronger first six months look like? Which part of the mandate is closest to work you have already done?

#pagebreak()

// PAGE 3 — READ THE ROLE
#header("03", "READ THE ROLE")
#v(1em)
#kicker([STEP 1 · EXTRACT THE REAL MANDATE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Read for decisions, not for nouns.]
#v(0.55em)
#deck([Most job descriptions contain a mixture of generic capability words and useful operating signals. Start with the signals that tell you what must change, what is at risk and what good work would look like.])
#v(0.85em)
#step([A], [Find the business problem], [Look for phrases that describe a gap, transition, constraint, customer need, operating priority or risk. These reveal why the role exists.])
#step([B], [Find the decision terrain], [Underline where the role must influence, build, simplify, resolve, prioritise, lead or coordinate. This is where #gls("scope") often lives.])
#step([C], [Find the evidence of success], [Notice the outcomes: growth, delivery, retention, quality, adoption, pace, cost, trust or clarity. These tell you what the employer may use to judge progress.])

#v(0.9em)
#text(size: 8pt, weight: "bold", fill: cobalt)[A USEFUL ANNOTATION KEY]
#v(0.35em)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 9pt,
  block(fill: paper, stroke: 0.6pt + line-grey, inset: 10pt)[#text(weight: "bold")[01 · CONTEXT] #v(0.3em) What is changing, constrained or newly required?],
  block(fill: paper, stroke: 0.6pt + line-grey, inset: 10pt)[#text(weight: "bold")[02 · ACTION] #v(0.3em) What must this person decide, influence or deliver?],
  block(fill: paper, stroke: 0.6pt + line-grey, inset: 10pt)[#text(weight: "bold")[03 · OUTCOME] #v(0.3em) What would progress look like in six to twelve months?],
)

#v(1em)
#callout([FOUR-MINUTE EXTRACTION], [
  Open one target job description. Copy one phrase into each of the three boxes above: a context phrase, an action phrase and an outcome phrase. Then circle the phrase that matters most to the role. Do not collect more than five phrases; a smaller, clearer set is more useful than an exhaustive list.
])

#pagebreak()

// PAGE 4 — INVENTORY EVIDENCE
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Your title is not your evidence.]
#v(0.55em)
#deck([Experienced professionals often have more relevant evidence than a job title reveals. The useful task is to identify the operating situations you have already navigated.])
#v(0.95em)
#grid(
  columns: (0.33fr, 0.67fr),
  gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 18pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,\not duties.]],
  [
    #step([01], [Operating context], [What was changing? Consider growth, recovery, restructuring, a new system, a difficult stakeholder environment, a customer problem or a risk that needed attention.])
    #step([02], [Your contribution], [What did you personally frame, decide, build, unblock, redesign, influence or deliver? Name the part that was yours.])
    #step([03], [Observable result], [What changed? The #gls("outcome") might be a decision made, a service launched, a process clarified, a risk reduced, a team aligned or a learning captured.])
  ],
)

#v(1em)
#callout([THE “WE” CHECK], [
  Team language is sometimes accurate, but it can conceal your individual contribution. Keep the team context, then add the decision, analysis, coordination or leadership you personally supplied. A reviewer needs enough detail to understand your role without claiming the work was done alone.
])

#v(0.9em)
#text(size: 8pt, weight: "bold", fill: cobalt)[PROMPT]
#v(0.3em)
Choose one project from the past two years. If you removed your job title, could a reader still understand the scale, the problem and the contribution you made? If not, that project may need a better evidence note before it becomes a résumé line.
#v(0.7em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [
  List three situations before choosing your strongest one: a change you helped navigate, a decision you helped make clearer, and a problem you helped resolve. For each, note the stakeholders, the constraint and the evidence you could share if asked for detail. This gives you a pool of truthful material rather than forcing every role phrase onto a single story.
])

#pagebreak()

// PAGE 5 — BUILD THE TRANSLATION
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.55em)
#deck([A credible translation keeps the employer’s language close enough to be recognisable and your own evidence close enough to be defensible.])
#v(0.9em)
#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[
    #text(size: 8pt, weight: "bold", fill: muted)[ROLE PHRASE]
    #v(0.35em)
    #text(weight: "bold")[“Lead cross-functional change across a complex operating environment.”]
    #v(0.7em)
    #text(size: 8pt, fill: muted)[What this may signal: influence across teams, ambiguity, implementation discipline and a need to make progress visible.]
  ],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE]
    #v(0.35em)
    #text(weight: "bold")[“Coordinated operations, product and customer teams to introduce a new intake process during a service transition.”]
    #v(0.7em)
    #text(size: 8pt, fill: muted)[Add the decision, constraint and observed result when they are true and relevant.]
  ],
)

#v(0.9em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THE FOUR-PART SENTENCE]
#v(0.35em)
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 7pt,
  block(fill: paper, stroke: 0.6pt + line-grey, inset: 8pt)[#text(weight: "bold")[VERB] #v(0.25em) What you did],
  block(fill: paper, stroke: 0.6pt + line-grey, inset: 8pt)[#text(weight: "bold")[CONTEXT] #v(0.25em) Where and under what conditions],
  block(fill: paper, stroke: 0.6pt + line-grey, inset: 8pt)[#text(weight: "bold")[SCOPE] #v(0.25em) Scale, stakeholders or complexity],
  block(fill: soft-blue, stroke: 0.6pt + cobalt, inset: 8pt)[#text(weight: "bold", fill: cobalt)[OUTCOME] #v(0.25em) What changed or became possible],
)

#v(1em)
#callout([A WORDING RULE], [
  If a phrase from the posting is useful, keep it. Then earn it with a specific context and contribution. The employer’s wording should help a reader find your relevance—not become a substitute for your story.
])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Take one current résumé bullet and make two versions. In Version A, preserve your original language but add context. In Version B, use one role phrase only where the evidence genuinely supports it. Read both aloud. Keep the version that sounds both clearer and more like you.

#pagebreak()

// PAGE 6 — AVOID FRAGILE MATCHES
#header("06", "AVOID FRAGILE MATCHES")
#v(1em)
#kicker([STEP 4 · PROTECT CREDIBILITY])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Relevance should survive a follow-up question.]
#v(0.55em)
#deck([The risk of #gls("keyword-stuffing") is not only technical. It also makes a conversation harder when a recruiter asks for an example and the claim has no real evidence behind it.])
#v(0.9em)
#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[
    #text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE]
    #v(0.4em)
    #text(weight: "bold")[“Expert in enterprise transformation, data strategy and global change management.”]
    #v(0.55em)
    #text(size: 8.5pt, fill: muted)[Why it fails: broad labels, unclear #gls("scope"), no project, no decision and no way to judge the claim.]
  ],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE]
    #v(0.4em)
    #text(weight: "bold")[“Led a cross-team operating review that clarified data ownership and decision checkpoints during a regional service migration.”]
    #v(0.55em)
    #text(size: 8.5pt, fill: muted)[Why it works: it names a context, a contribution and a form of relevant change without inventing a result.]
  ],
)

#v(1em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THE THREE-MINUTE CREDIBILITY AUDIT]
#v(0.35em)
#step([1], [Could you explain the phrase?], [If asked “What did that involve?”, can you describe the work in plain language?])
#step([2], [Can you name the context?], [Would a reader understand when, where and why the work mattered?])
#step([3], [Can you give a real example?], [Do you have a project, decision or outcome that supports the claim?])

#v(0.85em)
#callout([DECIDE WHAT TO REMOVE], [
  Review one section of your résumé and mark any phrase that fails one of the three tests. Replace it with a narrower, supported line or remove it. The objective is not to mention every desirable capability; it is to ensure the evidence that remains can bear the reader’s confidence.
])

#pagebreak()

// PAGE 7 — WORKSHEET
#header("07", "YOUR ROLE-TO-EVIDENCE MAP")
#v(1em)
#kicker([WORKING PAGE · 12 MINUTES])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Map one target role before you rewrite.]
#v(0.55em)
#deck([Choose one genuine opportunity. Complete this page in order. The discipline is to connect a role phrase to evidence before you decide what belongs on the résumé.])
#v(0.75em)
#worksheet-field([01 · ROLE PHRASE], [Copy one high-signal phrase exactly as the employer uses it. Prefer a phrase about a mandate, decision or outcome.], height: 56pt)
#v(0.7em)
#worksheet-field([02 · WHAT IT LIKELY MEANS], [In plain language, what situation, capability or decision do you think this phrase represents?], height: 56pt)
#v(0.7em)
#worksheet-field([03 · YOUR CLOSEST EVIDENCE], [Name a project, decision or operating situation where you did related work. Include context before outcomes.], height: 72pt)
#v(0.7em)
#worksheet-field([04 · YOUR HONEST WORDING], [Write one sentence that uses relevant role language while staying faithful to what you actually did.], height: 72pt)

#pagebreak()

// PAGE 8 — WORKED EXAMPLES
#header("08", "WORKED EXAMPLES")
#v(1em)
#kicker([WORK THE METHOD · ILLUSTRATIVE EXAMPLES])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Two ways to make relevance visible.]
#v(0.65em)
#text(size: 8pt, fill: muted)[These examples are illustrative. Adapt the logic to your own history; do not copy details, measures or claims that are not yours.]
#v(0.8em)

#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE A · OPERATIONAL CHANGE]
#v(0.35em)
#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 12pt)[
    #text(size: 8pt, weight: "bold", fill: muted)[BEFORE]
    #v(0.35em)
    Managed a service-team process improvement project.
  ],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 12pt)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[AFTER]
    Coordinated service, operations and technology teams to redesign an intake process during a period of rising demand, creating clearer ownership and escalation steps.
  ],
)
#v(0.35em)
#small([What changed: the revised version gives the reader context, #gls("scope"), contribution and a defensible form of outcome.])

#v(1em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B · STAKEHOLDER INFLUENCE]
#v(0.35em)
#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 12pt)[
    #text(size: 8pt, weight: "bold", fill: muted)[BEFORE]
    Influenced senior stakeholders and drove alignment.
  ],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 12pt)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[AFTER]
    Framed decision options for senior stakeholders when teams held different views on delivery sequencing, helping establish an agreed priority order for the next planning cycle.
  ],
)
#v(0.35em)
#small([What changed: “influenced” becomes a visible practice—framing options, clarifying trade-offs and supporting a decision.])

#v(1em)
#callout([YOUR REVISION PROMPT], [
  Take one existing bullet. Underline the generic words. Then add the operating context, your distinct contribution and the most honest observable result. Stop when the line becomes clear—not when it becomes crowded.
])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[FOUR-MINUTE TRANSFER]
#v(0.3em)
Apply the logic of Example A or Example B to your own work. Name the original generic word you are replacing, then write the supporting context and contribution beside it. Keep a phrase only when it helps a reviewer understand why you are relevant to the target role.

#pagebreak()

// PAGE 9 — CHECK AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same map for your résumé and conversation.]
#v(0.55em)
#deck([A good application does not end at submission. Your translated lines should give you a more coherent answer when a recruiter asks, “Tell me about the work most relevant to this role.”])
#v(0.9em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THE REVIEWER’S SEQUENCE]
#v(0.35em)
#step([01], [Recognition], [Can a reader see the phrase, mandate or operating situation that matters in this role?])
#step([02], [Believability], [Can they see enough context and #gls("evidence") to believe your relevance?])
#step([03], [Curiosity], [Does the line create a useful follow-up question you are prepared to answer?])
#step([04], [Consistency], [Do your résumé, LinkedIn profile and spoken examples use compatible—not identical—language?])

#v(1em)
#callout([A FOUR-MINUTE REHEARSAL], [
  Say this aloud: “The part of this role that connects most directly with my experience is the work where I have already handled a related challenge. In my previous work, the situation was clear, my contribution was specific, and the result or learning was useful.” Keep it conversational. If it sounds like a job description, return to the evidence map.
])

#v(1em)
#worksheet-field([YOUR SPOKEN BRIDGE], [Write the four-part answer above in note form. Use bullets, not a memorised script.], height: 92pt)

#pagebreak()

// PAGE 10 — NEXT STEPS AND GLOSSARY
#header("10", "NEXT STEPS")
#v(1em)
#kicker([MAKE THE NEXT MOVE CONCRETE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A seven-day application reset.]
#v(0.6em)
#grid(
  columns: (28pt, 1fr),
  row-gutter: 8pt,
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Choose one target role and identify three high-signal phrases.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Complete the role-to-evidence map for the strongest phrase.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Rewrite two résumé lines using context, contribution, scope and outcome.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Read each line aloud and remove anything you could not explain under a follow-up question.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Prepare the 90-second spoken bridge for a recruiter or hiring-manager conversation.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6–7], [Review the application against the role. Submit only when your wording is relevant, accurate and recognisably yours.],
)

#v(1em)
#callout([ONE-SENTENCE COMMITMENT], [
  Before my next application, I will translate one role phrase into a specific project, decision or outcome I can explain with confidence.
])

#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.25em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)

#v(0.5em)
#small([Further reading: #link("https://careercenter.umich.edu/content/interviewing-resources")[University of Michigan Career Center, Interviewing Resources] and #link("https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/")[MIT Career Advising & Professional Development, STAR method]. These links provide general career-preparation information.])
#v(0.45em)
#small([Career Weekly is a Signrl publication. This reader edition is prepared for educational reading and does not guarantee a career outcome.])
