// Career Weekly interview-preparation resource.
// The shared report theme owns global typography, hierarchy and page rhythm.

#import "report-theme.typ": report-accent, report-theme

#show: report-theme.with(
  title: "The Executive Interview Preparation Brief",
  author: "Career Weekly",
  rhythm: "report",
  running-header: true,
)

// ---------- Title page ----------
#page(margin: (top: 30%, x: 2.2cm), numbering: none, header: none)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(size: 26pt, weight: "bold", fill: report-accent)[The Executive Interview Preparation Brief]
    #v(0.5em)
    #text(size: 14pt, fill: luma(80))[A practical guide to preparing clear, credible answers for consequential conversations]
    #v(2em)
    #line(length: 40%, stroke: 0.5pt + luma(160))
    #v(2em)
    #text(size: 12pt)[
      Career Weekly \
      #datetime.today().display("[month repr:long] [day], [year]")
    ]
  ]
]

// ---------- Table of contents ----------
#page(numbering: none, header: none)[
  #outline(title: [Contents], indent: 1.5em)
]

// ---------- Main body ----------
#counter(page).update(1)

= Start with the decision in front of you

At senior levels, an interview is rarely just a request to repeat your résumé. It is a working conversation about the decision the organisation needs to make: whether your judgment, operating range and leadership approach are relevant to the mandate ahead.

This brief helps you prepare a small, adaptable set of true examples rather than a long script. It is designed for mid-career and executive professionals whose experience may be broad, nonlinear or shared across teams. It does not promise an interview result. Its purpose is to make your contribution easier to explain, test and remember.

#text(fill: report-accent, weight: "bold")[A useful standard:] state what happened, what you personally decided or did, what changed, and what you would carry forward. Keep the evidence honest. If a result was shared by a team, explain your own role within it.

== The preparation question

Before collecting stories, write one sentence for each prompt below.

- What decision is this role likely asking its leader to make or own?
- What has to change for the organisation to consider the hire worthwhile?
- Which two or three parts of your experience make your contribution credible here?
- What is still unknown, and what would you need to learn in the first conversations?

This is not research theatre. It gives your examples a point of view. A strong answer does not pretend to know the organisation’s internal situation; it shows how you would investigate, prioritise and act when the evidence becomes available.

= Build a five-story working bank

Prepare five stories that can answer more than one question. MIT Career Advising & Professional Development recommends preparing a small group of adaptable examples, rather than scripting every possible question.[1] The most useful stories contain a meaningful trade-off, a visible decision and a result you can describe without overstating it.

#table(
  columns: (1.15fr, 2.85fr),
  inset: 8pt,
  stroke: 0.4pt + luma(190),
  table.header([*Story type*], [*What to capture*]),
  [Change], [A time you created clarity, momentum or alignment during ambiguity. Name the decision, stakeholders and what moved.],
  [Judgment], [A difficult call with imperfect information. Explain the options, the risk you accepted and the guardrail you set.],
  [People], [How you raised the standard, coached a colleague, repaired trust or handled a difficult performance conversation.],
  [Delivery], [A cross-functional outcome. Separate your contribution from the team’s contribution and use only figures you can explain.],
  [Setback], [A decision, project or relationship that did not go as planned. Show ownership, learning and the adjustment that followed.],
)

For each story, capture five lines only: the setting; the task or decision; your specific actions; the result; and the relevance to the role. You can then adapt the same example for leadership, collaboration, resilience, prioritisation or stakeholder-management questions without sounding rehearsed.

= Shape the answer around your actions

The STAR structure—Situation, Task, Action and Result—is a practical way to organise an example. MIT’s guidance suggests reserving the largest share of the answer for your actions and using the result to make the outcome or learning clear.[1] The UK National Careers Service likewise advises keeping examples concise, conversational and ready for follow-up questions.[2]

== A senior-level STAR prompt

*Situation.* What was happening, and why did it matter? Give enough context for someone outside your organisation to understand the stakes. Do not begin with a full company history.

*Task.* What were you accountable for? If it was a team effort, distinguish the collective objective from your own responsibility.

*Action.* What did you notice, decide, influence or change? This is the centre of the answer. Use precise verbs: reframed, prioritised, convened, tested, simplified, escalated, negotiated or redesigned.

*Result.* What changed? Use a number only when you can explain the measure and your contribution. A result can also be a decision reached, a risk reduced, a relationship repaired, a capability built or a lesson that changed your later approach.

== A 90-second answer map

Use this map to practise pace, not to memorise wording.

#table(
  columns: (1fr, 3fr),
  inset: 8pt,
  stroke: 0.4pt + luma(190),
  table.header([*Moment*], [*What the listener should understand*]),
  [Opening], [“The situation was…” Give the operating context and the decision at stake in two sentences.],
  [Ownership], [“I was responsible for…” Clarify the outcome you owned, not merely the meeting you attended.],
  [Action], [“I first… Then…” Share two or three choices that reveal your thinking and how you worked through others.],
  [Outcome], [“The result was…” State the change, evidence or learning without inflating it.],
  [Bridge], [“That is relevant here because…” Connect the example back to a challenge suggested by the role.],
)

If the interviewer asks for more detail, add it. If they move on, let the answer stand. Concision is not withholding; it leaves room for a real conversation.

= Prepare for four consequential questions

== “Why now?”

This question often tests coherence, not enthusiasm alone. A useful answer links the role’s direction to a next chapter in your own operating story.

Start with a truthful observation about what you have built or learned. Name the next kind of problem you are ready to take on. Then explain why the opportunity is worth exploring—not why it is already perfect.

*Working prompt:* “The through-line in my recent work has been [your credible pattern]. I am now most useful where [the next problem you are ready to own]. What makes this conversation worth having is the chance to understand whether the mandate calls for that kind of work.”

Avoid turning this into a criticism of your current employer or a generic claim that you are “ready for a challenge.” The aim is a considered transition story, not a departure speech.

== “Tell me about a difficult decision.”

Choose an example with a genuine tension: speed versus certainty, performance versus trust, local optimisation versus long-term capability, or a stakeholder commitment versus a changing fact pattern.

Lead with the decision and constraints. Explain what information you sought, which voices you included, what you decided, and how you communicated the rationale. If the outcome was mixed, say so. Clear reflection can be more credible than a frictionless success story.

== “How do you lead through change?”

Do not answer with a leadership philosophy alone. Pair a principle with a concrete example. Explain how you created a shared picture of the problem, set the next decision cadence, handled disagreement, and made progress visible. Then state the evidence you watched to know whether the change was working.

== “What would you do in your first 90 days?”

Treat this as a prioritisation exercise, not a promise of a detailed plan before you have access to the people and information. Separate learning from action.

#table(
  columns: (1fr, 3fr),
  inset: 8pt,
  stroke: 0.4pt + luma(190),
  table.header([*Period*], [*A grounded answer can include*]),
  [First 30 days], [Listen to key stakeholders, understand the operating rhythm, review the available evidence and clarify how success will be measured.],
  [Days 31–60], [Test the initial diagnosis, agree priority choices, identify early risks and begin one visible, appropriate action.],
  [Days 61–90], [Translate the learning into a sequenced plan, ownership and decision cadence—while remaining ready to adjust as facts change.],
)

= Make the evidence easy to test

Interviewers may ask follow-up questions because they want to understand how you think, not because the first answer failed. Plan for these four checks.

- *Scope:* What was your role, and where did the team begin and end?
- *Judgment:* What alternative did you decline, and why?
- *People:* Who disagreed or needed to be brought along, and how did you handle it?
- *Evidence:* What changed, how did you know, and what was still uncertain?

Prepare the facts behind each story. If you use a metric, be ready to explain its source, timeframe and limitations. If confidentiality prevents detail, say what you can responsibly describe and focus on the decision process.

= Rehearse without becoming scripted

The goal is not to memorise a polished paragraph. It is to be able to retrieve the right evidence under pressure, in your own words.

== A 30-minute rehearsal

#table(
  columns: (0.75fr, 3.25fr),
  inset: 8pt,
  stroke: 0.4pt + luma(190),
  table.header([*Minutes*], [*Practice*]),
  [0–5], [Read the job description. Circle the capabilities that recur and select the two stories most relevant to them.],
  [5–15], [Speak two stories aloud using the 90-second map. Record only what felt unclear, overlong or unsupported.],
  [15–25], [Ask a trusted peer to use one follow-up question from the evidence checks above. Practise answering the follow-up, not defending your résumé.],
  [25–30], [Write three refinements: one sharper opening, one missing fact to verify and one question you genuinely want to ask the interviewer.],
)

After the conversation, write down what landed, what you would shorten, and what you learned about the role. That reflection turns each interview into material for the next one.

= Your one-page preparation sheet

Complete this before the interview. Keep it as notes, not a script.

#grid(
  columns: (1fr),
  row-gutter: 0.85em,
  [#text(weight: "bold")[Role mandate in one sentence:] #line(length: 100%, stroke: 0.45pt + luma(120))],
  [#text(weight: "bold")[The two capabilities I need to make credible:] #line(length: 100%, stroke: 0.45pt + luma(120))],
  [#text(weight: "bold")[Story I will lead with:] #line(length: 100%, stroke: 0.45pt + luma(120))],
  [#text(weight: "bold")[The decision or trade-off it reveals:] #line(length: 100%, stroke: 0.45pt + luma(120))],
  [#text(weight: "bold")[The proof I can responsibly cite:] #line(length: 100%, stroke: 0.45pt + luma(120))],
  [#text(weight: "bold")[The follow-up I should prepare for:] #line(length: 100%, stroke: 0.45pt + luma(120))],
  [#text(weight: "bold")[The question I genuinely need answered:] #line(length: 100%, stroke: 0.45pt + luma(120))],
)

#v(1em)
#text(fill: luma(95), size: 9pt)[Career Weekly publishes practical career-intelligence resources for professionals and leaders in motion. This educational guide cannot guarantee an interview, offer or career outcome.]

= Sources

[1] Massachusetts Institute of Technology, Career Advising & Professional Development, #link("https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/")[“Using the STAR method for your next behavioral interview.”] Accessed August 2026.

[2] National Careers Service, #link("https://nationalcareers.service.gov.uk/careers-advice/interview-advice/the-star-method")[“The STAR method.”] Accessed August 2026.
