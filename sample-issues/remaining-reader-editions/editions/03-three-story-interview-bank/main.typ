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
#show: report-theme.with(title: "Your Three-Story Interview Bank", author: "Signal Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  (key: "story-bank-0", short: [Story bank], long: [Story bank], description: [A small set of prepared, truthful examples you can adapt to answer multiple interview questions.]),
  (key: "anchor-question-1", short: [Anchor question], long: [Anchor question], description: [The primary prompt a story answers directly, such as a question about change, problem solving or learning.]),
  (key: "pivot-2", short: [Pivot], long: [Pivot], description: [A brief bridge that reframes a prepared story so it fits a different but related question.]),
  (key: "stakes-3", short: [Stakes], long: [Stakes], description: [What could be lost or gained in the scene and why it mattered at the time.]),
  (key: "constraint-4", short: [Constraint], long: [Constraint], description: [A limit such as time, budget, quality bar or stakeholder alignment that shaped your decision.]),
  (key: "reflection-5", short: [Reflection], long: [Reflection], description: [A short statement of what you would repeat or adjust next time based on what you learned from the experience.])
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 03 · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING 03 · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[SIGNAL WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[Your Three-Story Interview Bank]
#v(0.6em)
#text(size: 14pt, fill: muted)[Prepare a compact set of truthful stories that can adapt to more than one question.]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [Build a compact set of three truthful interview stories—a change story, a problem‑solving story and a learning story—that you can adapt to many common questions without inventing details or overclaiming.])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
Build three flexible examples: a change story, a problem-solving story and a learning story.
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
#text(size: 22pt, weight: "bold")[Edition 03 — Your Three-Story Interview Bank]
#v(0.55em)
#deck([Interviews rarely follow a script, but they often circle the same themes: how you handle change, how you solve problems and how you learn. A three‑story interview bank gives you ready, flexible material that can fit different prompts without sounding rehearsed. It also disciplines you to present evidence, context and outcomes in a way senior interviewers can evaluate quickly. Mid‑career and executive professionals face a particular challenge: your track record is broad. Without selection, you risk offering long, unfocused monologues or thin, generic claims. This edition narrows the aperture. You will design three stories that carry most of your proof. You will also learn to adapt each story for different functions and levels of detail. The goal is not entertainment; it is clarity about how you operate when stakes are real. You will draft, test and refine each story until it is short, specific and portable. You will…])
#v(0.9em)
#callout([ORIENTATION], [Your three‑story bank is not a script; it is a source of scenes you can tell in a few tight minutes, either as proof after a claim or as a direct answer to a behavioral question. Each story includes five parts: context, stakes, constraint, action and outcome with reflection. You will keep details honest, avoid vague superlatives and cite concrete evidence you can explain if asked. You will create three primary stories, each of which can answer multiple prompts: - Change story: You led, shaped or adapted to a shift in direction, scope, team, or market condition. - Problem‑solving story: You diagnosed a hard issue, chose a path and executed with trade‑offs in view. - Learning story: You discovered you were wrong or unprepared, corrected course and improved future performance. As you draft, you will tag each sentence by…])
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
#deck([Start by scanning the past three to five years for episodes with visible turning points. Write a brief inventory without editing: what changed, who was involved, what you owned and what makes the scene meaningful. Then test each scene with two questions: Could I tell this in under three minutes? Could I explain my choices step by step? If the answer to either question is no, set the scene aside or split it into smaller pieces. For each candidate scene, write a one‑line headline that names the central tension, such as shifting scope, conflicting priorities, or a quality issue near a deadline. Under the headline, jot the constraint in one sentence. Then list three actions you took that you can defend under follow‑up questioning. Finally, note one outcome you can describe factually and one lesson you carried…])
#v(0.75em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Identify the right scenes]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Choose moments with clear stakes where your actions mattered. Look for scenes with time pressure, resource limits or conflicting goals. Avoid projects where your role is hard to isolate. Prefer episodes where you can explain your decision…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Structure for adaptability]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Build each story with a short context, the specific constraint you faced, two or three decisive actions you took and one outcome with a reflection. Keep the context under three sentences. Name the constraint in plain language. Choose…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Extract portable evidence]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[List the tangible artifacts and observations that back your story. Examples include a process you designed, a decision log you kept, a role you played in a meeting or a shift in backlog, timeline or quality. You do not need numbers to be…]
]
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [Start by scanning the past three to five years for episodes with visible turning points. Write a brief inventory without editing: what changed, who was involved, what you owned and what makes the scene meaningful. Then test each scene with two questions: Could I tell this in under three minutes? Could I explain my choices step by step? If the answer to either question is no, set the scene aside or split it into smaller pieces. For each candidate scene, write a one‑line headline that names the central tension, such…])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([Before you draft final stories, build a short inventory of episodes that could carry weight in a senior interview. Aim for six to nine candidate scenes, then select the strongest one for each story type. This step prevents you from locking onto a mediocre story just because it is top of mind. It also gives you backup material if an interviewer has already heard one of your examples or if a conflict of interest arises with a reference.])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,
ot duties.]],
  [#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Surface candidate scenes]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Review recent roles, transitions and initiatives. For each, ask: Where did I face a real constraint? Where did my judgment change the outcome? Capture quick notes about the setting, your role, the core decision and the…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Score for strength and portability]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Rate each scene on two axes from low to high: stakes and portability. Stakes reflect why it mattered. Portability reflects how many different questions it could answer. Prefer scenes with clear stakes and at least…]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Select and narrow scope]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Choose one change, one problem‑solving and one learning scene. Narrow each to a single core decision. Trim side plots that do not support the decision path. If two stories overlap heavily, keep one and retire the other…]
]])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [Draft three core stories you can tell in two to three minutes each. For each, write context, constraint, two to three actions, outcome and reflection. Then produce two alternate openings and two alternate endings that fit sibling questions. Keep all claims specific enough that you could explain how you know them to be true.])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[For this role, here is what I want you to see about how I operate: I clarify stakes early, choose a path with constraints in view and create a line of sight between decisions and outcomes.]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[What I can show is a concrete trail of choices, artifacts and observations that another person could verify if needed.]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [One scene, three angles: keep the context and actions constant, but shift the emphasis by changing your opening, the constraint you highlight or the lesson you foreground so the story answers the question that was actually asked.])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
Rewrite each story three times: once to emphasize leadership and influence, once to emphasize analysis and decision quality and once to emphasize learning and adjustment. Change only the opening frame and the closing reflection while keeping the core actions intact.

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) Fragile stories rely on claims you cannot defend under light questioning. Warning signs include: grand outcomes with no trail, fuzzy timelines, inflated scope, heroic language that sidelines others and leaps from your action to a large impact without visible connection. Fragile stories also overuse vague terms like optimized, transformed or significantly without naming what changed in observable terms. Another red flag is when the only proof is your opinion or a single compliment without context.],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) Defensible stories stay close to what you owned, what you decided and what others could see changed. They name constraints clearly, such as time, budget, quality bar or stakeholder alignment. They make trade‑offs explicit and explain why a chosen path was reasonable at the time. They cite artifacts such as a plan you authored, a meeting you led, a choice you documented or a before‑and‑after practice. They describe outcomes in terms of behaviors, clarity, sequence or reliability rather than sweeping impact language. They include a short reflection on what you would repeat or change next time.])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [Before you consider a story final, run this audit: - Role clarity: Can you state your role in one sentence without exaggeration? Could a teammate confirm it? - Constraint accuracy: Are the limits you cite real and specific, not excuses? Can you name who set them or how they arose? - Decision trail: Can you recount the key options, the reason you chose the path you did and the trade‑offs you accepted? - Evidence sufficiency: Do you have at least two observable pieces of evidence that do not depend on memory alone? - Outcome precision: Can you describe what changed in plain terms another person would recognize? - Reflection depth: Have you named one concrete lesson that influenced a later action or standard you now use? - Brevity check: Can you tell it cleanly in under three minutes without rushing?])

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
#text(size: 8pt, weight: "bold", fill: cobalt)[Change story builder]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Write a scene where direction, scope, team structure or external conditions shifted. Specify: the moment you recognized the change, the constraint that most shaped your response, two or three actions you took to reset…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Problem-solving story builder]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Choose a knotty issue you owned. Outline: the core question you needed to answer, the options you considered, the test or principle that helped you choose, the actions you took to execute and one visible result. Add the…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 60pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Learning story builder]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[Pick a time you were wrong, underinformed or surprised. Define: the assumption that failed, the feedback or event that revealed it, what you changed next, and how you incorporated the learning into your habits or…]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: 70pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]
#v(0.65em)
#text(size: 8pt, weight: "bold", fill: cobalt)[Adaptation map]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[For each story, write two sibling questions it can answer. Draft a one‑sentence bridge from the question to your story, then write an alternate opening that highlights the most relevant constraint or lesson. Note a…]
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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) I led a major change that improved our results a lot. We had to switch priorities quickly and I made sure everyone got on board. It was hard, but I communicated the vision and people followed. In the end, the project was successful and leadership was pleased.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) Three months into an initiative, upstream inputs shifted and our sequence no longer matched reality. As delivery lead, I owned the rollout plan and saw that if we kept the plan as written we would miss a key dependency. The hard constraint was a fixed launch window set by an external partner. I paused the next sprint, gathered the three teams most affected and reframed the scope to protect the launch window. I published a one‑page decision note with the trade‑offs, moved one feature to a later train and added a daily dependency check. We hit the launch…])
#v(0.25em)
#small([The before version offers vague claims and no observable evidence. The after version states the constraint, the role, the decision path, the actions and the outcome in concrete terms without overclaiming impact. It also closes with a transferable practice.])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) There was a complicated problem with a tool and I solved it by working hard and collaborating. It took a while, but I figured it out and shared the solution with the team. People appreciated the effort and we moved forward.],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) A reliability issue appeared in a tool the team relied on for daily work. As the person responsible for the workflow, I needed to decide whether to patch, replace or create a manual workaround. The constraint was limited expert availability that week. I listed the three options, tested the manual workaround with two users to confirm viability, and used that test to buy time for a deeper patch. I documented the decision and set a sunset date for the workaround so it would not become permanent. The team maintained continuity during the fix, and I added a…])
#v(0.25em)
#small([The before version uses effort and collaboration as stand‑ins for judgment. The after version shows how options were weighed under a constraint, how a reversible step created space and how a simple rule prevented a temporary fix from becoming permanent.])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [Rewrite each story for a different function or industry by changing only the framing and vocabulary. Keep the core decisions and evidence constant. Replace domain‑specific terms with role‑agnostic language and emphasize the constraint and judgment so the story resonates outside your original context.])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[01] #h(0.45em) #text(weight: "bold")[Tighten language and trim filler]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Cut adjectives that do not add proof. Replace vague verbs with specific actions. Remove side plots. Keep the context under three sentences. Ensure each action verb describes a choice, not just activity.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[02] #h(0.45em) #text(weight: "bold")[Stress‑test with follow‑ups]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Ask a colleague to interrupt you with realistic probes: What other options did you reject? Who pushed back? How did you know the risk was acceptable? If you cannot answer succinctly, add clarifying detail to your written version and practice delivering it.]
],
#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[03] #h(0.45em) #text(weight: "bold")[Align to the target role]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[Read the role description and choose two qualities you want the interviewer to see. Adjust your opening and closing lines so the story connects your way of working to those qualities. Do not change the facts; change the emphasis.]
]
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [Practice each story aloud until you can deliver the core in about two minutes without notes, then rehearse compressed and expanded versions. Record yourself once. Listen for hedging language, filler and speed. Practice the bridge sentence that connects the interviewer’s question to your story so the pivot feels natural. Rotate which story you open with so you do not default to the same example every time. Rehearse handing off to a follow‑up question by ending with a short reflection rather than a long coda.])
#v(0.75em)
#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR SPOKEN BRIDGE]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[That question touches something I had to work through directly. May I share a brief example that shows how I approached it, the constraint I faced and what changed because of the choices I made?]
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
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 1], [Day 1: Build your raw inventory by listing six to nine candidate scenes with one‑line headlines and constraints.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 2], [Day 2: Select one change, one problem‑solving and one learning scene. Write context, constraint, actions, outcome and reflection for each.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 3], [Day 3: Extract evidence for each story. List artifacts, decisions, timelines and observations another person could recognize.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 4], [Day 4: Write two sibling questions for each story and draft bridge sentences, alternate openings and alternate closings.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 5], [Day 5: Run the credibility audit on each story, then rehearse each at one, two and three minutes. Record once and note edits.],
  text(size: 8pt, weight: "bold", fill: cobalt)[DAY 6], [Day 6: Do a live mock with a peer. Ask for specific feedback on clarity of role, decision quality and adaptability to different prompts.])
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [I will carry three defensible stories into every interview and adapt them honestly to the question in front of me.])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("https://capd.mit.edu/resources/the-star-method-for-behavioral-interviews/")[MIT Career Advising & Professional Development — STAR method]. This link is provided for general career-preparation context. Signal Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
