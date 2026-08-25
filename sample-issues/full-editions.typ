#import "briefing-template/report-theme.typ": report-theme

#let cobalt = rgb("#1646D8")
#let ink = rgb("#171A1F")
#let soft-blue = rgb("#F1F5FF")

#show: report-theme.with(
  title: "Career Weekly Sample Library",
  author: "A Signrl publication",
  rhythm: "longform",
  body-size: 10pt,
  running-header: false,
)

#set page(margin: (top: 1.5cm, bottom: 1.4cm, x: 1.7cm), numbering: none, header: none)
#set text(font: ("Libertinus Serif", "Noto Serif"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.16em, spacing: 0.52em, first-line-indent: 0pt)

#let cover(number, title, subtitle, objective, source-label, source-url) = [
  #align(left)[
    #text(size: 8.2pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING #number · COMPLETE SAMPLE EDITION]
    #h(1fr)
    #text(size: 7.5pt, fill: luma(98))[CAREER WEEKLY · A SIGNRL PUBLICATION]
  ]
  #v(0.7em)
  #line(length: 100%, stroke: 1.2pt + cobalt)
  #v(1.6em)
  #text(size: 30pt, weight: "bold")[#title]
  #v(0.5em)
  #text(size: 12pt, fill: luma(82))[#subtitle]
  #v(2.2em)
  #text(size: 8pt, weight: "bold", fill: cobalt)[WHAT THIS EDITION HELPS YOU DO]
  #v(0.35em)
  #text(size: 14pt)[#objective]
  #v(2.5em)
  #block(fill: soft-blue, inset: 14pt)[
    #text(size: 8pt, weight: "bold", fill: cobalt)[HOW TO USE THE WORKING PAGE]
    #v(0.35em)
    Read this preview, then complete the next page before your next application, interview or offer conversation. The value is not in collecting advice; it is in making a decision visible enough to act on.
  ]
  #v(2.7em)
  #line(length: 100%, stroke: 0.45pt + luma(185))
  #v(0.35em)
  #text(size: 7.5pt, fill: luma(94))[This is a sample briefing for educational reading. It is not a historic newsletter send and does not guarantee an interview, offer or outcome. Framework reference: #link(source-url)[#source-label].]
]

#let worksheet(number, title, prompt, moves, source-label, source-url) = [
  #align(left)[
    #text(size: 8.2pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING #number · WORKING PAGE]
    #h(1fr)
    #text(size: 7.5pt, fill: luma(98))[#title]
  ]
  #v(0.55em)
  #line(length: 100%, stroke: 1.2pt + cobalt)
  #v(1.1em)
  #text(size: 20pt, weight: "bold")[Make the next step concrete.]
  #v(0.35em)
  #text(size: 11pt, fill: luma(82))[#prompt]
  #v(1.15em)
  #text(size: 8pt, weight: "bold", fill: cobalt)[WORK THROUGH THESE THREE PROMPTS]
  #v(0.35em)
  #for move in moves [
    #block(stroke: (left: 2pt + cobalt), inset: (left: 12pt, right: 8pt, y: 8pt), above: 8pt)[#move]
  ]
  #v(1.1em)
  #text(size: 8pt, weight: "bold", fill: cobalt)[YOUR ONE-SENTENCE COMMITMENT]
  #v(0.35em)
  #block(stroke: 0.6pt + luma(175), inset: 12pt, height: 65pt)[
    #text(fill: luma(130))[The action I will take before my next career decision is:]
  ]
  #v(0.8em)
  #text(size: 7.3pt, fill: luma(94))[Educational guidance only. Further reading: #link(source-url)[#source-label].]
]

#let edition(number, title, subtitle, objective, prompt, moves, source-label, source-url) = [
  #cover(number, title, subtitle, objective, source-label, source-url)
  #pagebreak()
  #worksheet(number, title, prompt, moves, source-label, source-url)
]

#edition(
  "01", "Evidence Before Adjectives", "Turn broad claims into credible evidence a reader can question and trust.",
  [Rewrite one résumé bullet so your action, context and result are visible without relying on adjectives.],
  [Choose one claim you make about your leadership or expertise. What specific decision or outcome would make it believable?],
  (
    [Name the operating context: what was changing, at risk or newly required?],
    [State the action you personally took; avoid letting “we” hide your contribution.],
    [Write the observable result and the question you could answer if a reviewer asked for proof.],
  ),
  "MIT Career Advising & Professional Development — STAR method", "https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/",
)

#pagebreak()
#edition(
  "02", "The ATS Translation Layer", "Use a role’s real language while keeping every claim honest and defensible.",
  [Produce a role-to-evidence map that improves relevance without keyword stuffing.],
  [Select one target role. Which three phrases from its description best describe work you have genuinely done?],
  (
    [Copy the phrase exactly as the employer uses it.],
    [Add one specific project, decision or result that proves the match.],
    [Remove any term you would struggle to explain aloud in an interview.],
  ),
  "University of Michigan Career Center — Interviewing Resources", "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()
#edition(
  "03", "Your Three-Story Interview Bank", "Prepare a compact set of truthful stories that can adapt to more than one question.",
  [Build three flexible examples before you need to answer under time pressure.],
  [Choose one change story, one problem-solving story and one learning story. What makes each useful beyond a single question?],
  (
    [Write the situation in one sentence; keep context short enough to leave room for your action.],
    [Name the decision, judgment or contribution that was distinctly yours.],
    [State the result and the lesson you would carry into the target role.],
  ),
  "MIT Career Advising & Professional Development — STAR method", "https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/",
)

#pagebreak()
#edition(
  "04", "The Question Behind the Question", "Decode difficult prompts into the capability an interviewer is trying to assess.",
  [Choose a story based on the judgment required, not on the drama of the question.],
  [Take one difficult prompt: is it really asking about ownership, influence, resilience, judgment or self-awareness?],
  (
    [Write the capability you think is being tested.],
    [Choose a real example with enough stakes to demonstrate that capability.],
    [End your answer with the result or reflection that makes the learning relevant now.],
  ),
  "University of Michigan Career Center — Interviewing Resources", "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()
#edition(
  "05", "Research, Reflect, Rehearse", "Connect organisation research, your own evidence and natural spoken preparation.",
  [Create a one-page preparation note that improves both your answers and your questions.],
  [Before your next interview, what should you know about the organisation—and what must you know about your own relevance?],
  (
    [Record three signals about the organisation’s current priorities or operating context.],
    [Match each signal to one relevant experience, skill or question.],
    [Practise the connection aloud in bullet points rather than memorising a script.],
  ),
  "University of Michigan Career Center — Interviewing Resources", "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()
#edition(
  "06", "The Executive Screen", "Make the opening minutes of a recruiting or hiring-manager conversation easier to follow.",
  [Craft a concise role-relevant introduction instead of a chronological career summary.],
  [What kind of operating situation do you tend to lead through, and why does it matter for this role now?],
  (
    [Describe the business or operating problems you are most experienced at solving.],
    [Choose one concise outcome that supports that positioning.],
    [Ask a question that checks whether you have understood the mandate correctly.],
  ),
  "NYU Wasserman Center — Interviewing & Negotiation Process", "https://wasserman.nyu.edu/channels/interviewing-negotiation-process/",
)

#pagebreak()
#edition(
  "07", "When They Ask About a Failure", "Show ownership and learning without turning the story into blame or performance.",
  [Prepare a responsible answer that describes what changed in your judgment or operating practice.],
  [Which setback can you discuss with honesty, appropriate context and a clear learning?],
  (
    [State what happened without changing the facts or blaming another person.],
    [Name the part you owned and the decision you would now approach differently.],
    [Describe the practice, checkpoint or question you added afterward.],
  ),
  "MIT Career Advising & Professional Development — STAR method", "https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/",
)

#pagebreak()
#edition(
  "08", "Questions That Help You Evaluate the Role", "Use interview questions to understand scope, success measures and decision rights.",
  [Leave the conversation with evidence about the job—not merely the feeling that it went well.],
  [What do you need to understand before deciding the work, manager and operating environment fit your criteria?],
  (
    [Write one question about success in the first six to twelve months.],
    [Write one question about authority, influence and where decisions sit.],
    [Write one question tailored to the interviewer’s direct experience of the role.],
  ),
  "University of Michigan Career Center — Interviewing Resources", "https://careercenter.umich.edu/content/interviewing-resources",
)

#pagebreak()
#edition(
  "09", "The Whole-Role Negotiation Map", "Evaluate the offer as a whole role, not only as a headline salary number.",
  [Compare compensation, benefits, scope and working conditions against your own decision criteria.],
  [Which parts of the role will matter most to your ability to do good work and make a sound move?],
  (
    [List your non-negotiables before you receive an offer.],
    [Separate fixed terms from questions that need clarification or may be open to discussion.],
    [Request the written information you need to compare the complete package.],
  ),
  "DePaul Career Center — Job Offers & Salary Negotiation", "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)

#pagebreak()
#edition(
  "10", "Ask for Time Before You Answer", "Treat offer review as a deliberate professional decision rather than a rushed reaction.",
  [Create enough space to read the details, identify gaps and make an informed response.],
  [What information would you regret not asking for before you accept, decline or negotiate?],
  (
    [Ask when the employer needs a considered response.],
    [Read the written offer and note every term that is unclear or contingent.],
    [Choose one trusted person who can challenge your assumptions without deciding for you.],
  ),
  "DePaul Career Center — Job Offers & Salary Negotiation", "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)

#pagebreak()
#edition(
  "11", "When Salary Cannot Move", "Clarify the overall package and ask responsibly without assuming every term is negotiable.",
  [Make one focused request or decide deliberately that the offer is right for your priorities.],
  [If base salary is fixed, what single term, piece of information or condition would most affect your decision?],
  (
    [Ask which elements are governed by policy and which can be discussed.],
    [Prioritise one or two requests rather than producing an unfocused list.],
    [Decide whether the available package fits your stated criteria, not only your initial expectation.],
  ),
  "DePaul Career Center — Job Offers & Salary Negotiation", "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)

#pagebreak()
#edition(
  "12", "The Career Decision Memo", "Make the trade-offs visible before momentum makes the decision for you.",
  [Write a short, candid decision note that names the evidence, risk and next question.],
  [In twelve months, what would need to be true for you to regard this move as a sound decision?],
  (
    [State the opportunity in one sentence: mandate, reporting line and operating context.],
    [Name the strongest evidence for fit and the clearest unresolved concern.],
    [Write the next question you need answered before deciding.],
  ),
  "DePaul Career Center — Job Offers & Salary Negotiation", "https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx",
)
