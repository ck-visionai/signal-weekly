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
#show: report-theme.with(title: "Ask for Time Before You Answer", author: "Career Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "response-window-0", short: [Response window], long: [Response window], description: [A specific, pre-agreed period you request to review offer materials and prepare a considered reply. Clarity on start and end times reduces check-ins and anxiety on both sides.]),
  (key: "written-offer-1", short: [Written offer], long: [Written offer], description: [The official document describing title, compensation, start date, and contingencies. It converts verbal discussions into concrete terms you can review and reference later.]),
  (key: "contingent-terms-2", short: [Contingent terms], long: [Contingent terms], description: [Conditions that must be met for an offer to stand, such as background checks, references, or eligibility verification. Understanding these protects you from surprises after…]),
  (key: "exploding-deadline-3", short: [Exploding deadline], long: [Exploding deadline], description: [A short-fuse expiration on an offer. When encountered, clarify the reason, request a minimal extension if needed, and focus your questions on high-impact items first.]),
  (key: "decision-anchor-4", short: [Decision anchor], long: [Decision anchor], description: [A specific date and time you commit to return your response. Anchors create trust and focus your review process; they are more effective than vague promises to reply soon.]),
  (key: "counterparty-5", short: [Counterparty], long: [Counterparty], description: [The person or team on the other side of the decision process. Keeping their constraints, timelines, and need for clarity in mind helps you frame requests respectfully and…])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 10 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 10 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[CAREER WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[Ask for Time Before You Answer]
#v(0.6em)
#text(size: 14pt, fill: muted)[Treat offer review as a deliberate professional decision rather than a rushed reaction.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Equip you with a calm, professional process to ask for time before you accept, decline, or negotiate an offer. You will learn how to create a brief review window, surface missing information, and return with a clear, defensible next step.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Create space to read an offer, identify information gaps and respond with clarity rather than urgency.
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
#text(size: 22pt, weight: "bold")[Ask for time before you answer]
#v(0.55em)
#deck([An offer can trigger an adrenaline spike. The impulse to please, to end uncertainty, or to match the other party’s pace can make you answer before you have read the fine print or compared the role to your real constraints. That is how smart people end up agreeing to terms they do not fully understand, or closing doors they would have rather kept open. A measured response is not hesitation; it is leadership over your own decision. Asking for time is a signal that you intend to take the role, the people, and the obligations seriously. It also reduces avoidable back-and-forth by allowing you to review the documents once, list gaps, and come back with a thoughtful response. In this edition, you will build a short script and a repeatable routine to request a review window, set expectations, and keep the tone constructive. You will leave with language you can use the next time someone says, “Can you give me your answer…])
#v(0.9em)
#callout([ORIENTATION], [Treat an offer decision like any other material commitment: clarify scope, confirm the numbers, understand contingencies, and align timing with existing obligations. Most offers tolerate a small, clearly defined pause. The key is to ask early, be specific about your timeline, and explain what you will do during that time. You are not asking for a favor; you are shaping a process that protects both sides from rushed mistakes. You will practice a neutral, warm tone that acknowledges momentum without making promises. You will collect the written offer, identify what is missing, and set a return date you can meet. If you get pushback, you will know how to hold your boundary and keep rapport. Clarity beats speed, and a brief pause now is cheaper than a difficult course correction later.])
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
#deck([As you read the offer packet, extract decision-critical facts into one place. Capture the role title, team, reporting line, location or remote policy, travel expectations, start date, and probation period if applicable. Record compensation elements separately: base pay cadence, bonus eligibility and timing, commission rules, equity type and vesting schedule, and any sign-on payment and repayment triggers. Note benefits highlights: medical and retirement plans, paid time off and holidays, leave policies, and any allowances. List contingencies: background check, references, work eligibility, non-compete, non-solicit, confidentiality, or intellectual property agreements. Flag practical items: equipment, expense policy, relocation or visa support, and work schedule norms. Mark what is clear, what is unclear, and…])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Acknowledge receipt and interest without committing]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Start by recognizing the moment and signaling engagement. Say thank you, reflect back the role title and the person or team involved, and share one specific, sincere point of enthusiasm. Avoid language that implies agreement. Mention you…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Ask for a clear, short review window]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Choose a window that you can defend and keep. Typical windows range from one to three business days for straightforward offers, and slightly longer if relocation, equity plans, or complex contingencies are involved. Ask for a specific…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Clarify documents and open items before you sign off]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Do not enter a review window with vague materials. Confirm exactly what you will receive: the written offer letter, role scope, base and variable pay details, any equity plan overview, benefits summary, paid time off policy, non-compete or…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [As you read the offer packet, extract decision-critical facts into one place. Capture the role title, team, reporting line, location or remote policy, travel expectations, start date, and probation period if applicable. Record compensation elements separately: base pay cadence, bonus eligibility and timing, commission rules, equity type and vesting schedule, and any sign-on payment and repayment triggers. Note benefits highlights: medical and retirement plans, paid time off and holidays, leave policies, and any…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([A clean inventory converts a vague sense of risk into a short, actionable list. This prevents reactive questions and helps you separate personal preferences from decision blockers. Build two columns: confirmed details and open questions. Then order your questions by impact on your decision, not by curiosity.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Map confirmed facts versus unknowns]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[On one page, write down everything you know for sure from the written documents. In a second list, capture anything that is ambiguous, missing, or verbally promised but not in writing. This includes titles that differ…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Rank questions by decision impact]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Not all unknowns are equal. Identify which open items could change your decision or affect your first 90 days meaningfully. Examples include reporting line, variable pay mechanics, schedule expectations, or a relocation…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Define your non-negotiables and flex zones]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Before you re-engage, name your must-haves and where you can flex. Non-negotiables might be a specific start date due to notice requirements, a remote day to accommodate caregiving, or written clarity on bonus…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Draft a short, respectful request for time that you could send today in response to an offer. Name the documents you need, the exact time you will respond, and what you will do in the window. Keep it to 4–6 sentences and use neutral, professional language.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[so I can give you a well-considered answer]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[after reviewing the written offer, scope, and benefits details]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [Replace urgency with structure. Convert vague timing into a specific return date and time. Swap apologies and over-explanations for respect and clarity. Avoid hedging (“hopefully,” “might,” “I guess”). Name what you need, state when you will return, and suggest the next step, such as a brief call to address key questions. Keep tones warm and factual.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite your draft ask-for-time message to remove filler words, tighten the timeline, and explicitly request any missing documents. Add one sentence that names what you will do during the review window and the exact time you will respond.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile requests sound uncertain, invite pushback, or leave the door open to misinterpretation. Examples include: “Can I maybe have a little more time?” which suggests you do not value theirs; “I’m swamped, can we do later?” which centers your chaos instead of the decision; “I’ll try to get back soon,” which makes you sound unreliable; or “I need time because I have other offers,” which can be read as posturing and may erode trust. Fragile language often over-apologizes (“I’m so sorry to ask…”) or hides the ask inside a long paragraph. The result is unclear expectations and a higher risk of repeated check-ins or rushed agreement.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible requests are specific, respectful, and tied to the quality of the decision. They state a clear return time and name the documents you will review. They acknowledge the other party’s pace without adopting it. Example frame: “Thank you for the offer. To give you a well-considered answer, I’d like to review the written offer, benefits summary, and bonus plan. Would end of day Wednesday work for my response? If helpful, I can send any clarifying questions by tomorrow.” This positions your ask as a benefit to both sides, sets a boundary you can keep, and invites a simple yes.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you send your ask-for-time message, run a quick credibility audit. First, timeline realism: can you confidently meet the return time you proposed? Second, document completeness: have you requested all materials needed to decide? Third, tone check: read it aloud; does it sound steady, warm, and clear without apologies or posturing? Fourth, alignment: does your message reflect the seniority of the role and the complexity of the offer? Fifth, follow-through plan: is your calendar blocked to do the review, and do you have a placeholder on their calendar for a short follow-up if needed? Credibility is not volume of words; it is clarity plus delivery.])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Clarify your decision window]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[What is the shortest review window you can confidently keep, given your current obligations? Write the exact date and time you will respond, and list the steps you will complete during that window.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Name your must-have documents]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List the specific documents you need to see in writing before you can respond. For each, write the open question it will help you answer (for example, bonus plan to confirm eligibility and payout timing).]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Rank your open questions]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[List your top five open questions in order of impact on your decision. For each, write one concise sentence that you will use when asking for clarification.]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Draft your ask-for-time message]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write a 4–6 sentence note you could send today in response to an offer. Include acknowledgment, your review window, the documents you need, and your exact return time. Then underline any words that sound apologetic or…]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) Hi! Thanks for the offer. I’m excited and I think it could be a great fit. I need to look at a few things and talk to some people, so I’ll try to get back soon. Can you send whatever you have?],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Thank you for the offer for the Marketing Lead role. I’m glad to hear the team is enthusiastic. To give you a well-considered answer, I’d like to review the written offer, benefits summary, and any bonus plan details. Would end of day Thursday work for my response? If so, I’ll send any clarifying questions by tomorrow afternoon.])
#v(0.25em)
#small([The before message is friendly but vague, with no timeline and no specific documents. The after message adds a role reference, names the packet, sets a clear return time, and offers a small milestone within the window. This reduces ambiguity and invites a simple confirmation.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) This sounds good, and I think I can make it work. I need to check a couple things with my family. I’ll let you know as soon as I can. If there’s a deadline, tell me.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) I appreciate the offer for the Operations Manager role. To be responsible on timing and commitments, I’d like to review the written offer, PTO and leave policies, and the on-call expectations. I can return with a considered response by Tuesday 3 p.m. Does that timeline work on your side?])
#v(0.25em)
#small([The before message centers personal logistics, lacks specificity, and hands control of timing to the other side. The after message connects the request to decision quality, lists targeted documents, and proposes a concrete response time while checking for alignment.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Adapt your ask-for-time script to different channels and tempos. Prepare one version for live conversation (short, spoken, with a firm return time), one for email (slightly more detailed, with a bulleted list of requested documents if needed), and one for messaging apps (tight and polite, with a calendar invite to anchor the return). For global teams, specify time zones. For urgent scenarios, propose the shortest realistic window and a micro-milestone (for example, “I’ll send top questions by noon and return a decision by 5 p.m.”).])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Sanity-check your timeline against your calendar]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Open your calendar before you ask for time. Confirm you have space to read thoroughly, extract facts, and draft questions. If you see conflicts, move meetings now or choose a different return time. Reliability is built by making the promise you can keep, not…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Confirm document completeness before starting your clock]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Do not begin your review window until you have the documents you requested. If the offer arrives without key attachments, acknowledge receipt and restate your need: “Thanks for sending. I’ll start my review once the bonus plan and benefits summary arrive so I…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Draft and prioritize your questions in one pass]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Read once to understand, then extract facts and list questions in a single sitting. Mark each question by impact level, and trim any that are nice-to-know. Group related items to speed the follow-up conversation. This keeps your return message concise and…]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Practice your ask-for-time script out loud before you need it. Say the opening thank you, the role title, your request for the written materials, and your exact return time. Breathe, keep your tone steady, and pause after you ask. If the other party pushes for an instant answer, acknowledge their pace and repeat your return time. Have one backup line ready if they cannot allow your full window, such as offering the shortest viable alternative you can keep. Rehearsal reduces filler words, helps you avoid over-explaining, and makes your boundary sound natural rather than defensive.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Thank you for the offer. To give you a well-considered answer after reviewing the written details, I’ll come back by (day, time). Does that timing work?]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Capture the offer details and your ask-for-time draft in a single document you can reuse.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Block calendar time for focused review, extraction, and drafting questions within your requested window.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Request any missing documents immediately, and confirm when you will start your review clock.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Rank your top five open questions by impact and prepare a concise ask for each.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Schedule a brief follow-up call or send your questions in one organized message.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Deliver your response on or before your promised deadline, and document any agreements in writing.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will ask for time before I answer, set a clear return date, and use that window to produce a grounded, on-time response.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://resources.depaul.edu/career-center/resumes-interviews/Pages/salary-negotiation.aspx")[DePaul Career Center — Job Offers & Salary Negotiation]. This link is provided for general career-preparation context. Career Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
