#import "briefing-template/report-theme.typ": report-accent, report-theme

#let cobalt = rgb("#1646D8")
#let ink = rgb("#171A1F")
#let slate = rgb("#5F6875")
#let soft-blue = rgb("#F1F5FF")
#let pale = rgb("#F8F7F2")
#let rule-color = luma(184)

#show: report-theme.with(
  title: "The Career Evidence Working Page",
  author: "Career Weekly",
  rhythm: "longform",
  body-size: 10pt,
  running-header: false,
)

#set page(margin: (top: 1.35cm, bottom: 1.25cm, x: 1.7cm), numbering: none, header: none)
#set text(font: ("Libertinus Serif", "Noto Serif"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.16em, spacing: 0.48em, first-line-indent: 0pt)

#let topbar(label, page-label) = [
  #align(left)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[CAREER WEEKLY · #label]
    #h(1fr)
    #text(size: 7.5pt, fill: luma(98))[CAREER WEEKLY · A SIGNRL PUBLICATION · #page-label]
  ]
  #v(0.55em)
  #line(length: 100%, stroke: 1.1pt + cobalt)
]

#let section-kicker(label) = [#text(size: 8pt, weight: "bold", fill: cobalt)[#label]]
#let rule() = [#line(length: 100%, stroke: 0.45pt + rule-color)]
#let answer-lines(count: 4) = [
  #for i in range(count) [#v(1.2em) #line(length: 100%, stroke: 0.45pt + luma(198))]
]
#let action-box(title, body) = [
  #block(fill: soft-blue, inset: (x: 12pt, y: 10pt))[
    #text(size: 8pt, weight: "bold", fill: cobalt)[#title]
    #v(0.28em)
    #body
  ]
]
#let footer-note() = [#v(0.7em) #text(size: 7.2pt, fill: luma(98))[Educational guidance only. This working page does not guarantee an interview, offer or outcome.]
]

// Page 1: cover
#topbar("SAMPLE 01 · COMPLETE EDITION", "WORKING PAGE")
#v(1.35em)
#text(size: 29pt, weight: "bold")[The Career Evidence Working Page]
#v(0.45em)
#text(size: 13pt, fill: slate)[Evidence before adjectives.]
#v(1.5em)
#section-kicker[WHAT THIS EDITION HELPS YOU DO]
#v(0.35em)
#text(size: 15pt)[Rewrite one résumé bullet so your action, context and result are visible without relying on broad claims.]
#v(1.8em)
#action-box[HOW TO USE THIS PAGE][Read the short explanations, then complete the prompts. Allow 20–30 minutes. You do not need to finish every line perfectly; you need one honest, specific piece of evidence you can use in your résumé, interview or networking conversation.]
#v(1.6em)
#section-kicker[THE WORKING PRINCIPLE]
#v(0.35em)
A strong career claim gives the reader somewhere to look. It names the situation, the choice you made, the work you personally carried and the observable difference that followed.
#v(1.25em)
#rule()
#v(0.45em)
#text(size: 7.5pt, fill: luma(94))[Career Weekly · A Signrl publication. Sample document for educational reading.]

#pagebreak()

// Page 2: choose the claim
#topbar("01 · START WITH ONE CLAIM", "1 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Start with the claim you want a reader to believe.]
#v(0.4em)
#text(size: 11pt, fill: slate)[Do not begin by rewriting the whole résumé. Choose one sentence that sounds positive but leaves the evidence hidden.]
#v(1em)
#section-kicker[COMMON BROAD CLAIMS]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [*Strategic leader*\ You led important choices. Which choice, in what context?],
  [*Results-oriented*\ What changed, by how much, and over what period?],
  [*Cross-functional collaborator*\ Which groups disagreed or depended on one another?],
  [*Commercially minded*\ What customer, revenue, cost or risk decision did you influence?],
)
#v(1em)
#action-box[YOUR TURN][Write the broad claim you want to make more credible.]
#v(0.5em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 42pt)[]
#v(0.9em)
#section-kicker[THE READER’S NEXT QUESTION]
#v(0.3em)
If a skeptical but fair reader saw only this claim, what would they ask next? Write the question in plain language. For example: “What did you actually change?” or “How do you know it worked?”
#v(0.4em)
#block(width: 100%, stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 6pt, y: 7pt), height: 42pt)[]
#footer-note()

#pagebreak()

// Page 3: evidence inventory
#topbar("02 · INVENTORY THE EVIDENCE", "2 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Find the evidence before you find the wording.]
#v(0.4em)
A useful bullet does not require a dramatic achievement. It requires a concrete trace of your work. Look for decisions, deliverables, measures, constraints and changes that another person could recognise.
#v(0.9em)
#section-kicker[QUICK EVIDENCE INVENTORY]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [#text(size: 8pt, weight: "bold", fill: cobalt)[DECISION]\ What did you decide, prioritise or change?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[DELIVERABLE]\ What did you build, launch, fix or complete?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[SCALE]\ How large was the team, budget, customer base or operation?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[CONSTRAINT]\ What made the situation difficult, urgent or uncertain?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[CHANGE]\ What was different afterward?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[WITNESS]\ Who could explain or verify the work?],
)
#v(1em)
#section-kicker[NOTES FROM YOUR CAREER]
#v(0.35em)
List two projects, moments or responsibilities connected to the claim you wrote on page 2. Fragments are enough.
#v(0.25em)
#answer-lines(count: 5)
#v(0.25em)
#text(size: 8.5pt, fill: slate)[Tip: search old planning documents, performance reviews, project updates, dashboards and messages for the nouns and numbers you used at the time.]
#footer-note()

#pagebreak()

// Page 4: diagnose the claim
#topbar("03 · DIAGNOSE THE GAP", "3 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Separate the claim from the proof.]
#v(0.4em)
#text(size: 11pt, fill: slate)[The claim describes a quality. The proof describes what that quality looked like in practice. Keep both, but let the proof do more of the work.]
#v(1em)
#section-kicker[THE CLAIM–PROOF TEST]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [#text(size: 8pt, weight: "bold", fill: cobalt)[CLAIM]\ “I am a strategic leader.”],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[PROOF]\ “I redirected the launch plan after customer research exposed a retention risk.”],
)
#v(1em)
#action-box[CHECK YOUR CLAIM][Circle the words in your claim that are hard to verify: strategic, excellent, dynamic, successful, innovative, strong, collaborative, commercial, visionary. You do not have to delete them automatically. Ask what concrete sentence should sit beside them.]
#v(1em)
#section-kicker[MAKE THE INVISIBLE VISIBLE]
#v(0.35em)
Complete these prompts for your own example.
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [The reader should understand that I can…\ #v(0.25em) #line(length: 100%, stroke: 0.45pt + luma(198))],
  [The evidence that makes this believable is…\ #v(0.25em) #line(length: 100%, stroke: 0.45pt + luma(198))],
)
#v(1em)
#section-kicker[REMOVE ONE UNSUPPORTED WORD]
#v(0.3em)
Which adjective could disappear without reducing the meaning? What evidence should replace it?
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 38pt)[]
#footer-note()

#pagebreak()

// Page 5: context
#topbar("04 · MAKE THE CONTEXT LEGIBLE", "4 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Context tells the reader why the work mattered.]
#v(0.4em)
Without context, an action can sound like a task list. Context does not mean a long backstory. It means one short signal about what was changing, at risk, newly required or difficult to coordinate.
#v(1em)
#section-kicker[CHOOSE ONE CONTEXT SIGNAL]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [The business was entering a new market.],
  [A customer, cost or delivery risk had appeared.],
  [The team had to move faster with fewer resources.],
  [A system, process or relationship was not scaling.],
  [Different stakeholders wanted incompatible outcomes.],
  [A new requirement changed the definition of success.],
)
#v(1em)
#section-kicker[YOUR CONTEXT IN ONE SENTENCE]
#v(0.35em)
Start with “When…” or “As…” and stop after the situation is clear. Do not explain the entire company.
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 56pt)[]
#v(0.95em)
#action-box[KEEP IT RELEVANT][A context detail earns its place when it helps the reader understand the decision or result. If it is interesting but does not change the meaning, cut it.]
#footer-note()

#pagebreak()

// Page 6: action
#topbar("05 · NAME YOUR ACTION", "5 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Make your contribution easy to locate.]
#v(0.4em)
Use a strong verb, then name the object of the work. “Led” is not wrong, but it needs a clearer object: led a reset, led a negotiation, led a migration, led a decision process.
#v(0.9em)
#section-kicker[FROM GENERAL TO SPECIFIC]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [*Managed a team*\ → Reorganised a 12-person support team around priority accounts.],
  [*Improved operations*\ → Removed two approval steps from the weekly fulfilment process.],
  [*Worked cross-functionally*\ → Aligned product, sales and finance on a staged launch decision.],
  [*Drove growth*\ → Tested a partner channel and redirected spend toward the higher-converting segment.],
)
#v(1em)
#section-kicker[WRITE THE ACTION]
#v(0.35em)
Complete the sentence with a verb that describes what you personally did. Use “we” only when the shared ownership is important; otherwise show your part.
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 58pt)[]
#v(0.9em)
#action-box[THE INTERVIEW TEST][Could you explain the action in 30 seconds, including the choice you made and the alternatives you rejected? If not, the wording is probably still too broad.]
#footer-note()

#pagebreak()

// Page 7: result
#topbar("06 · SHOW THE RESULT", "6 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Results are stronger when they can be checked.]
#v(0.4em)
A result may be a number, but it can also be a decision reached, a risk reduced, a capability created, a delay avoided or a process made more reliable. Use the most honest measure available.
#v(0.9em)
#section-kicker[RESULT OPTIONS]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [*Performance*\ revenue, margin, conversion, retention, quality, speed],
  [*Scale*\ users, regions, teams, budget, volume, accounts],
  [*Reliability*\ fewer incidents, clearer controls, less rework, faster recovery],
  [*Decision*\ approved plan, resolved trade-off, aligned stakeholders, funded priority],
)
#v(1em)
#section-kicker[IF YOU CANNOT SHARE THE NUMBER]
#v(0.35em)
Use a bounded or comparative description: “cut the review cycle from several weeks to several days,” “reduced repeat escalations,” or “created a repeatable process used by three teams.” Never invent precision.
#v(0.9em)
#section-kicker[YOUR RESULT]
#v(0.35em)
What changed afterward? What would a colleague notice?
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 62pt)[]
#footer-note()

#pagebreak()

// Page 8: assemble bullet
#topbar("07 · ASSEMBLE THE EVIDENCE", "7 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Build the bullet in a readable order.]
#v(0.4em)
A dependable sequence is: context, action, object, result. You can change the order for rhythm, but the reader should not have to reconstruct the logic.
#v(0.9em)
#action-box[THE FOUR-PART DRAFT][When #emph[context], I #emph[action] #emph[object], resulting in #emph[result].]
#v(0.9em)
#section-kicker[YOUR FIRST DRAFT]
#v(0.35em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 75pt)[]
#v(0.85em)
#section-kicker[TRIM THE DRAFT]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [#text(size: 8pt, weight: "bold", fill: cobalt)[KEEP]\ The decision, the specific action and the result.],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[CUT]\ Scene-setting, repeated adjectives and internal jargon.],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[CHECK]\ Could a recruiter understand the role and scale without guessing?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[ALIGN]\ Does the wording match a story you can tell in an interview?],
)
#v(0.8em)
#section-kicker[REVISED DRAFT]
#v(0.35em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 62pt)[]
#footer-note()

#pagebreak()

// Page 9: examples and confidentiality
#topbar("08 · HANDLE REAL-WORLD CONSTRAINTS", "8 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Be specific without exposing confidential information.]
#v(0.4em)
You can demonstrate judgement while protecting a client, employer or colleague. Replace sensitive names with the category, use ranges instead of exact figures where appropriate, and describe the decision or change rather than revealing restricted details.
#v(0.9em)
#section-kicker[BEFORE AND AFTER]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  [#text(size: 8pt, weight: "bold", fill: cobalt)[BEFORE]\ “Responsible for improving a complex process.”],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER]\ “Mapped the handoffs in a high-volume service process, removed duplicate review and reduced avoidable rework.”],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[BEFORE]\ “Built strong relationships with senior stakeholders.”],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER]\ “Created a decision brief that aligned three senior teams on launch scope and sequencing.”],
)
#v(1em)
#section-kicker[SAFE SPECIFICITY CHECK]
#v(0.35em)
Ask yourself: What can I say truthfully? What detail is restricted? What substitute still shows the scale, judgement or outcome?
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 65pt)[]
#v(0.8em)
#action-box[DO NOT OVER-CORRECT][Confidentiality does not require vagueness. It requires choosing a level of detail that demonstrates your work without disclosing protected information.]
#footer-note()

#pagebreak()

// Page 10: quality check
#topbar("09 · RUN THE QUALITY CHECK", "9 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Test the bullet like a fair reader.]
#v(0.4em)
Read the revised sentence once without explaining it aloud. The bullet is doing its job when the reader can see the situation, your contribution and the difference made.
#v(0.9em)
#section-kicker[ONE-MINUTE REVIEW]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [□ I can identify the situation or business context.],
  [□ I can identify the action I personally took.],
  [□ The object of the action is concrete.],
  [□ The result is observable or honestly bounded.],
  [□ The language is understandable outside my organisation.],
  [□ Every claim is defensible in conversation.],
)
#v(1em)
#section-kicker[ASK A TRUSTED READER]
#v(0.35em)
Show the bullet to someone who does not know the project. Ask only two questions: “What do you think I did?” and “What do you think changed?” Their answer reveals what the sentence makes visible.
#v(0.85em)
#section-kicker[THEIR READING]
#v(0.35em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 62pt)[]
#v(0.8em)
#section-kicker[ONE FIX]
#v(0.35em)
What will you change after the review?
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 38pt)[]
#footer-note()

#pagebreak()

// Page 11: next action and references
#topbar("10 · TURN IT INTO MOMENTUM", "10 / 10")
#v(0.9em)
#text(size: 22pt, weight: "bold")[Make one piece of evidence travel further.]
#v(0.4em)
The finished bullet is not the end product. It is a compact source of truth you can adapt for a résumé, an interview answer, a networking conversation, a performance review or a decision about your next role.
#v(0.9em)
#section-kicker[YOUR NEXT THREE USES]
#v(0.35em)
#grid(columns: (1fr, 1fr), gutter: 10pt,
  [#text(size: 8pt, weight: "bold", fill: cobalt)[RÉSUMÉ]\ Where will this evidence appear?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[INTERVIEW]\ Which question could this story answer?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[CONVERSATION]\ Who should understand this capability?],
  [#text(size: 8pt, weight: "bold", fill: cobalt)[NEXT EVIDENCE]\ What adjacent example should you document next?],
)
#v(1em)
#section-kicker[THE COMMITMENT]
#v(0.35em)
Complete this sentence and put a date beside it: “Before my next application, interview or career conversation, I will…”
#v(0.25em)
#block(width: 100%, stroke: 0.6pt + rule-color, inset: 10pt, height: 64pt)[]
#v(0.85em)
#action-box[KEEP THE RECORD][Save the final bullet with the source notes behind it: project, date, scope, result and who can verify it. This makes future tailoring faster and keeps your claims consistent.]
#v(0.85em)
#rule()
#v(0.4em)
#text(size: 7.2pt, fill: luma(94))[
  *Framework note:* The context–action–result sequence is compatible with the STAR approach used in behavioural interview preparation. See #link("https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/")[MIT Career Advising & Professional Development, “The STAR Method for Behavioral Interviews”].
]
#v(0.35em)
#text(size: 7.2pt, fill: luma(94))[Career Weekly · A Signrl publication · Sample 01 complete working page.]
