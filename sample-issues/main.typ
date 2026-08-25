#import "briefing-template/report-theme.typ": report-theme

#let cobalt = rgb("#1646D8")
#let ink = rgb("#171A1F")
#let soft-blue = rgb("#F1F5FF")

#show: report-theme.with(
  title: "Career Weekly Sample Briefings",
  author: "A Signrl publication",
  rhythm: "longform",
  body-size: 9.5pt,
  running-header: false,
)

#set page(margin: (top: 1.35cm, bottom: 1.25cm, x: 1.55cm), numbering: none, header: none)
#set text(font: ("Libertinus Serif", "Noto Serif"), size: 9.5pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.12em, spacing: 0.48em, first-line-indent: 0pt)
#set heading(numbering: none)

#let briefing(number, title, subtitle, decision, moves, practice, source-label, source-url) = [
  #align(left)[
    #text(size: 8.1pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING #number · PREVIEW EDITION]
    #h(1fr)
    #text(size: 7.5pt, fill: luma(98))[CAREER WEEKLY · A SIGNRL PUBLICATION]
  ]
  #v(0.55em)
  #line(length: 100%, stroke: 1.1pt + cobalt)
  #v(0.9em)
  #text(size: 24pt, weight: "bold", fill: ink)[#title]
  #v(0.3em)
  #text(size: 11.1pt, fill: luma(83))[#subtitle]
  #v(1.25em)

  #text(size: 8pt, weight: "bold", fill: cobalt)[THE DECISION]
  #v(0.26em)
  #text(size: 10.5pt)[#decision]
  #v(0.85em)

  #text(size: 8pt, weight: "bold", fill: cobalt)[THREE MOVES]
  #v(0.22em)
  #for move in moves [
    #block(fill: soft-blue, inset: (x: 10pt, y: 7pt), above: 4pt)[
      #text(fill: cobalt, weight: "bold")[→] #move
    ]
  ]
  #v(0.8em)

  #text(size: 8pt, weight: "bold", fill: cobalt)[TRY THIS BEFORE YOUR NEXT STEP]
  #v(0.24em)
  #block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 6pt, y: 3pt))[
    #practice
  ]
  #v(0.9em)
  #line(length: 100%, stroke: 0.45pt + luma(185))
  #v(0.4em)
  #text(size: 7.4pt, fill: luma(94))[
    *Reading note:* This is a sample briefing for educational reading. It is not a historic newsletter send and does not guarantee an interview, offer or outcome. Framework reference: #link(source-url)[#source-label].
  ]
]

#briefing(
  "01",
  "Evidence Before Adjectives",
  "An executive résumé should make a reviewer’s next question easier—not merely sound impressive.",
  [Before adding another adjective, ask what evidence would allow a skeptical reader to believe the claim. Scope, decision, action and result usually travel further than a list of traits.],
  (
    [Replace one broad claim such as “strategic leader” with a concrete operating decision you owned.],
    [Name the scale only when you can explain it: team, budget, customer base, region or delivery risk.],
    [Keep the evidence consistent with the stories you can tell in an interview.],
  ),
  [Choose one résumé bullet today. Underline the action you personally took, then add the context that makes the action meaningful.],
  "MIT Career Advising & Professional Development — STAR method",
  "https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/",
)

#pagebreak()

#briefing(
  "02",
  "The ATS Translation Layer",
  "Use the language of the role without borrowing experience you do not have.",
  [A résumé can be both readable to a person and legible to a system when its language mirrors the real responsibilities, tools and outcomes of the target role. Translation is not keyword stuffing; it is honest alignment.],
  (
    [Circle repeated nouns and verbs in the role description, then map each to evidence already present in your career.],
    [Use the employer’s plain-language term when it accurately describes your work; keep your original terminology where it does not.],
    [Remove unsupported keywords that would be difficult to explain in a follow-up conversation.],
  ),
  [Create a two-column note: “role language” on the left and “my proof” on the right. Keep only matches you can defend.],
  "University of Michigan Career Center — Interviewing Resources",
  "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()

#briefing(
  "03",
  "Your Three-Story Interview Bank",
  "Prepare versatile examples before you are asked for a perfect answer on the spot.",
  [A small bank of truthful stories can cover more ground than a scripted answer for every imaginable question. The goal is to choose examples with decisions, tension, actions and outcomes that adapt to different competencies.],
  (
    [Choose one story about leading change, one about solving a difficult problem and one about learning from a setback.],
    [Write only the Situation, Task, Action and Result prompts—not a word-for-word script.],
    [For every story, mark exactly what *you* did so collaboration does not obscure your contribution.],
  ),
  [Set a 90-second timer and explain one story aloud. If the action is unclear, reduce the context and expand the decision you made.],
  "MIT Career Advising & Professional Development — STAR method",
  "https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/",
)

#pagebreak()

#briefing(
  "04",
  "The Question Behind the Question",
  "Difficult interview prompts are often requests for evidence, judgment or self-awareness.",
  [When a question feels confrontational, pause long enough to identify the capability being tested. “Tell me about a failure” may be a request to understand ownership, learning and decision quality rather than an invitation to perform regret.],
  (
    [Name the likely capability before answering: judgment, influence, resilience, prioritisation or technical depth.],
    [Choose one real example that shows appropriate stakes; avoid a story so small that it reveals nothing or so sensitive that it creates unnecessary risk.],
    [End with a clear result or reflection tied back to the role you want.],
  ),
  [Take one difficult question you expect. Write: “They may be trying to understand whether I can…” and complete the sentence before choosing a story.],
  "University of Michigan Career Center — Interviewing Resources",
  "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()

#briefing(
  "05",
  "Research, Reflect, Rehearse",
  "Preparation works best when you connect the organisation, the role and your own evidence.",
  [Research alone can sound performative. Reflection alone can sound generic. Rehearsal without either can sound memorised. A practical preparation system moves through all three.],
  (
    [Research the organisation’s direction, operating context, leaders and public priorities using credible sources.],
    [Reflect on where your skills, interests and proof points genuinely meet the stated requirements.],
    [Rehearse in bullet points, then practise speaking naturally rather than memorising a script.],
  ),
  [Prepare a one-page interview note with three headings: “organisation signals,” “my relevant proof,” and “questions I need answered.”],
  "University of Michigan Career Center — Interviewing Resources",
  "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()

#briefing(
  "06",
  "The Executive Screen",
  "The first ten minutes should establish the problem you solve, not recite a career chronology.",
  [An early conversation is a chance to make your relevance easy to locate. A concise opening can connect your operating experience to the role’s present need before the discussion becomes a tour of every past position.],
  (
    [Open with the kinds of situations you have led through, not a list of employers.],
    [Connect one or two relevant outcomes to the problem the new role appears to own.],
    [Close with a question that checks whether you have understood the mandate correctly.],
  ),
  [Draft a 45-second opening using this sequence: “I tend to lead when…”, “a relevant example is…”, “what interests me here is…”.],
  "NYU Wasserman Center — Interviewing & Negotiation Process",
  "https://wasserman.nyu.edu/channels/interviewing-negotiation-process/",
)

#pagebreak()

#briefing(
  "07",
  "When They Ask About a Failure",
  "A credible answer owns the decision, names the learning and avoids rewriting the past.",
  [Strong failure stories are neither confessionals nor disguised victories. They show how you noticed a problem, what responsibility you took, what changed in your approach and how that learning now informs your judgment.],
  (
    [Choose an example with a real trade-off, a miss or a decision you would now handle differently.],
    [Be precise about your role; do not hide behind “we” when the interviewer needs to understand your judgment.],
    [Describe the change you made afterward and the evidence that it became part of your operating practice.],
  ),
  [Write one sentence for each: what happened, what you owned, what you learned, and what you now do differently. Remove any sentence that blames another person.],
  "MIT Career Advising & Professional Development — STAR method",
  "https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/",
)

#pagebreak()

#briefing(
  "08",
  "Questions That Help You Evaluate the Role",
  "The questions you ask should help you understand the work, not merely demonstrate enthusiasm.",
  [Prepared questions can surface the decision rights, success measures and operating conditions that a job description does not show. They also help you decide whether the opportunity is a genuine fit.],
  (
    [Ask how success will be assessed in the first six to twelve months, and who will make that assessment.],
    [Ask where the role has authority, where it must influence, and what decisions remain outside its control.],
    [Tailor questions to each interviewer’s perspective instead of repeating the same list in every conversation.],
  ),
  [Choose three questions: one about outcomes, one about operating context and one about the manager’s expectations. Put them in priority order.],
  "University of Michigan Career Center — Interviewing Resources",
  "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()

#briefing(
  "09",
  "The Whole-Role Negotiation Map",
  "A headline salary is only one part of an offer worth evaluating.",
  [A responsible comparison considers compensation, benefits, working arrangements, scope, growth, location and the conditions that shape the work itself. The right priorities differ by person and by role.],
  (
    [Write your non-negotiables before you receive an offer, so the decision is not made entirely under time pressure.],
    [Separate terms that are fixed by policy from terms that may be open to discussion; do not assume every term is negotiable.],
    [Ask for the written details needed to understand benefits, timing, contingencies and the full compensation picture.],
  ),
  [Make a simple scorecard with the headings: role scope, manager, compensation, benefits, flexibility, location, learning and risk. Add your own weighting.],
  "DePaul Career Center — Job Offers & Salary Negotiation",
  "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)

#pagebreak()

#briefing(
  "10",
  "Ask for Time Before You Answer",
  "A thoughtful review is part of a professional decision—not a sign of weak interest.",
  [An offer often arrives after an intense process. Before accepting, declining or negotiating, give yourself enough time to read the details, identify missing information and compare the role with your stated priorities.],
  (
    [Thank the employer, express interest where it is genuine, and ask when they need a considered response.],
    [Review the written offer rather than relying on memory from a call.],
    [Speak with a trusted advisor who can challenge your assumptions without deciding for you.],
  ),
  [Before replying, list the five questions you still need answered. If an answer is important to your decision, ask for it in writing.],
  "DePaul Career Center — Job Offers & Salary Negotiation",
  "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)

#pagebreak()

#briefing(
  "11",
  "When Salary Cannot Move",
  "A respectful negotiation recognises constraints while still clarifying what matters most.",
  [Some employers, sectors and salary structures have limited flexibility. That does not prevent a candidate from understanding the overall package, asking informed questions or considering other terms that may matter to the decision.],
  (
    [Ask which parts of the package are governed by policy and which, if any, are open to discussion.],
    [Prioritise one or two requests tied to your decision instead of producing an unfocused list.],
    [If the offer is fair for your priorities, acceptance without negotiation can still be a deliberate choice.],
  ),
  [Complete this sentence: “If base salary is fixed, the information or term that would most affect my decision is…” Use the answer to guide one focused conversation.],
  "DePaul Career Center — Job Offers & Salary Negotiation",
  "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)

#pagebreak()

#briefing(
  "12",
  "The Career Decision Memo",
  "A good next move is not merely an attractive role; it is a role that fits your own criteria.",
  [After the interviews and offer details are in front of you, capture the decision in a short written note. The goal is not false certainty. It is to make the trade-offs visible before momentum makes the decision for you.],
  (
    [State the opportunity in one sentence: role, mandate, reporting line and operating context.],
    [Name the strongest evidence for fit and the clearest unresolved concern.],
    [Write what would need to be true in twelve months for you to regard the move as sound.],
  ),
  [Write a six-line decision memo tonight: “I am considering…”, “I value…”, “the evidence for fit is…”, “the risk is…”, “I need to confirm…”, “my next step is…”.],
  "DePaul Career Center — Job Offers & Salary Negotiation",
  "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)
