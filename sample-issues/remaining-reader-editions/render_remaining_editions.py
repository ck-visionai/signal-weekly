import json
import re
import shutil
from pathlib import Path

ROOT = Path(__file__).parent
DRAFTS = ROOT / "drafts"
OUT = ROOT / "editions"
THEME = ROOT.parent / "briefing-template" / "report-theme.typ"

def compact(text, limit):
    text = " ".join(str(text).replace("\n", " ").split())
    if len(text) <= limit:
        return text
    clipped = text[:limit].rsplit(" ", 1)[0]
    return clipped + "…"

def typ(text, limit=9999):
    text = compact(text, limit)
    return (text.replace("\\", "")
                .replace("#", "")
                .replace("[", "(")
                .replace("]", ")")
                .replace("<", "(")
                .replace(">", ")"))

def quote(text):
    return typ(text).replace('"', "'")

def safe_key(text, index):
    base = re.sub(r"[^a-z0-9]+", "-", text.lower()).strip("-")
    return f"{base or 'term'}-{index}"

def cards(items, count=3, body_limit=220):
    rendered = []
    for index, item in enumerate(items[:count], 1):
        rendered.append(f'''#block(stroke: (left: 2pt + cobalt), inset: (left: 10pt, right: 4pt, y: 4pt), above: 7pt)[
  #text(size: 8pt, weight: "bold", fill: cobalt)[{index:02d}] #h(0.45em) #text(weight: "bold")[{typ(item["title"], 80)}]
  #v(0.22em)
  #text(size: 8.8pt, fill: muted)[{typ(item["body"], body_limit)}]
]''')
    return ",\n".join(rendered)

def worksheet(prompt, height):
    return f'''#text(size: 8pt, weight: "bold", fill: cobalt)[{typ(prompt["label"], 62)}]
#v(0.25em)
#text(size: 8.3pt, fill: muted)[{typ(prompt["prompt"], 220)}]
#v(0.35em)
#block(stroke: 0.65pt + line-grey, inset: 8pt, height: {height}pt)[#text(size: 7.6pt, fill: luma(125))[Write here. Use evidence you can explain, not language you merely hope a reviewer will notice.]]'''

def render(data):
    topic = data["topic"]
    number = topic["number"]
    title = typ(topic["title"], 100)
    subtitle = typ(topic["subtitle"], 180)
    terms = data["glossary"]
    entries = []
    for index, term in enumerate(terms):
        entries.append(f'(key: "{safe_key(term["term"], index)}", short: [{typ(term["term"], 50)}], long: [{typ(term["term"], 50)}], description: [{typ(term["definition"], 180)}])')
    glossary_entries = ",\n  ".join(entries)
    source_label = typ(topic["source_label"], 160)
    source_url = topic["source_url"]
    examples = data["worked_examples"][:2]
    days = data["action_days"][:6]
    worksheet_prompts = list(data["worksheet_prompts"])
    while len(worksheet_prompts) < 4:
        worksheet_prompts.append({
            "label": "Adaptation note",
            "prompt": data["transfer_prompt"],
        })
    day_rows = ",\n  ".join(f'text(size: 8pt, weight: "bold", fill: cobalt)[DAY {i+1}], [{typ(day, 180)}]' for i, day in enumerate(days))
    terms_reference = safe_key(terms[0]["term"], 0)
    return f'''#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls
#import "report-theme.typ": report-theme

#let cobalt = rgb("#1646D8")
#let navy = rgb("#152744")
#let ink = rgb("#171A1F")
#let muted = rgb("#626B75")
#let paper = rgb("#FBFAF5")
#let soft-blue = rgb("#EDF3FF")
#let line-grey = rgb("#D7DBDF")

#show: make-glossary
#show: report-theme.with(title: "{title}", author: "Signal Weekly · A Signrl publication", rhythm: "longform", body-size: 10pt, running-header: false)
#set page(margin: (top: 1.55cm, bottom: 1.5cm, x: 1.8cm), numbering: "1")
#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10pt, fill: ink, lang: "en", region: "us")
#set par(justify: false, leading: 1.08em, spacing: 0.5em, first-line-indent: 0pt)
#let terms = (
  {glossary_entries}
)
#register-glossary(terms)
#let header(number, label) = [
  #align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING {number} · FROM THE SAMPLE LIBRARY] #h(1fr) #text(size: 7.5pt, weight: "bold", fill: muted)[#number / 10 · #label]]
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
#align(left)[#text(size: 8pt, weight: "bold", fill: cobalt)[SAMPLE BRIEFING {number} · READER EDITION] #h(1fr) #text(size: 8pt, weight: "bold", fill: muted)[SIGNAL WEEKLY · A SIGNRL PUBLICATION]]
#v(0.7em)
#line(length: 100%, stroke: 1.4pt + cobalt)
#v(1.5em)
#text(size: 31pt, weight: "bold", fill: ink)[{title}]
#v(0.6em)
#text(size: 14pt, fill: muted)[{subtitle}]
#v(1.8em)
#grid(columns: (1fr, 1fr, 1fr), gutter: 12pt, pill([10 PAGES]), pill([20–30 MINUTES]), pill([ONE REUSABLE TOOL]))
#v(2em)
#callout([WHAT THIS EDITION HELPS YOU DO], [{typ(data["cover_objective"], 520)}])
#v(1.4em)
#text(size: 9pt, weight: "bold", fill: cobalt)[USE THIS WHEN]
#v(0.35em)
{typ(topic["focus"], 350)}
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
#text(size: 22pt, weight: "bold")[{typ(data["decision_title"], 120)}]
#v(0.55em)
#deck([{typ(data["decision_intro"], 930)}])
#v(0.9em)
#callout([ORIENTATION], [{typ(data["orientation"], 830)}])
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
#deck([{typ(data["extraction"], 820)}])
#v(0.75em)
{cards(data["read_steps"], 3, 240)}
#v(0.9em)
#callout([FOUR-MINUTE EXTRACTION], [{typ(data["extraction"], 520)}])

#pagebreak()
// PAGE 4 — INVENTORY
#header("04", "INVENTORY EVIDENCE")
#v(1em)
#kicker([STEP 2 · START WITH WHAT YOU CAN PROVE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Build the raw material before you write.]
#v(0.55em)
#deck([{typ(data["inventory_intro"], 760)}])
#v(0.8em)
#grid(columns: (0.32fr, 0.68fr), gutter: 14pt,
  block(fill: navy, inset: 13pt)[#text(size: 9pt, weight: "bold", fill: rgb("#D7E4FF"))[LOOK FOR] #v(0.65em) #text(size: 17pt, weight: "bold", fill: rgb("#FFFFFF"))[Decisions,\not duties.]],
  [{cards(data["inventory_steps"], 3, 220)}])
#v(0.9em)
#callout([FIVE-MINUTE EVIDENCE INVENTORY], [{typ(data["project_prompt"], 650)}])

#pagebreak()
// PAGE 5 — TRANSLATE
#header("05", "BUILD THE TRANSLATION")
#v(1em)
#kicker([STEP 3 · MAKE THE CONNECTION EXPLICIT])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Translate the work. Do not borrow the experience.]
#v(0.65em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: muted)[ROLE-RELEVANT LANGUAGE] #v(0.35em) #text(weight: "bold")[{typ(data["role_phrase"], 330)}]],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[YOUR EVIDENCE] #v(0.35em) #text(weight: "bold")[{typ(data["evidence_phrase"], 330)}]])
#v(0.8em)
#callout([THE TRANSLATION RULE], [{typ(data["translation_rule"], 600)}])
#v(0.8em)
#text(size: 8pt, weight: "bold", fill: cobalt)[THREE-MINUTE REWRITE]
#v(0.3em)
{typ(data["rewrite_prompt"], 590)}

#pagebreak()
// PAGE 6 — CREDIBILITY
#header("06", "PROTECT CREDIBILITY")
#v(1em)
#kicker([STEP 4 · MAKE IT DEFENSIBLE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A strong claim should survive a follow-up question.]
#v(0.7em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: rgb("#FFF6F3"), stroke: 0.8pt + rgb("#D99A8C"), inset: 13pt)[#text(size: 8pt, weight: "bold", fill: rgb("#A24D3D"))[FRAGILE] #v(0.4em) {typ(data["fragile"], 650)}],
  block(fill: soft-blue, stroke: 0.8pt + cobalt, inset: 13pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[DEFENSIBLE] #v(0.4em) {typ(data["defensible"], 650)}])
#v(0.85em)
#callout([THREE-MINUTE CREDIBILITY AUDIT], [{typ(data["credibility_audit"], 980)}])

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
{worksheet(worksheet_prompts[0], 60)}
#v(0.65em)
{worksheet(worksheet_prompts[1], 60)}
#v(0.65em)
{worksheet(worksheet_prompts[2], 70)}
#v(0.65em)
{worksheet(worksheet_prompts[3], 70)}

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
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) {typ(examples[0]["before"], 430)}],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) {typ(examples[0]["after"], 560)}])
#v(0.25em)
#small([{typ(examples[0]["insight"], 360)}])
#v(0.8em)
#text(size: 9pt, weight: "bold", fill: cobalt)[EXAMPLE B]
#v(0.25em)
#grid(columns: (1fr, 1fr), gutter: 12pt,
  block(fill: paper, stroke: 0.7pt + line-grey, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: muted)[BEFORE] #v(0.35em) {typ(examples[1]["before"], 430)}],
  block(fill: soft-blue, stroke: 0.7pt + cobalt, inset: 11pt)[#text(size: 8pt, weight: "bold", fill: cobalt)[AFTER] #v(0.35em) {typ(examples[1]["after"], 560)}])
#v(0.25em)
#small([{typ(examples[1]["insight"], 360)}])
#v(0.7em)
#callout([FOUR-MINUTE TRANSFER], [{typ(data["transfer_prompt"], 580)}])

#pagebreak()
// PAGE 9 — REVIEW AND REHEARSE
#header("09", "CHECK AND REHEARSE")
#v(1em)
#kicker([STEP 5 · TEST THE STORY A HUMAN WILL HEAR])
#v(0.45em)
#text(size: 22pt, weight: "bold")[Use the same reasoning on paper and aloud.]
#v(0.55em)
{cards(data["review_steps"], 3, 260)}
#v(0.85em)
#callout([A FOUR-MINUTE REHEARSAL], [{typ(data["rehearsal"], 730)}])
#v(0.75em)
{worksheet({"label": "YOUR SPOKEN BRIDGE", "prompt": data["spoken_prompt"]}, 76)}

#pagebreak()
// PAGE 10 — NEXT STEPS AND GLOSSARY
#header("10", "NEXT STEPS")
#v(1em)
#kicker([MAKE THE NEXT MOVE CONCRETE])
#v(0.45em)
#text(size: 22pt, weight: "bold")[A six-day application reset.]
#v(0.6em)
#grid(columns: (30pt, 1fr), row-gutter: 8pt,
  {day_rows})
#v(0.85em)
#callout([ONE-SENTENCE COMMITMENT], [{typ(data["commitment"], 360)}])
#v(0.7em)
#text(size: 8pt, weight: "bold", fill: cobalt)[GLOSSARY]
#v(0.2em)
#set text(size: 7.8pt)
#print-glossary(terms, show-all: true, disable-back-references: true)
#set text(size: 10pt)
#v(0.45em)
#small([Further reading: #link("{source_url}")[{source_label}]. This link is provided for general career-preparation context. Signal Weekly is a Signrl publication; this educational reader edition does not guarantee a career outcome.])
'''

def main():
    OUT.mkdir(exist_ok=True)
    for draft_path in sorted(DRAFTS.glob("*.json")):
        data = json.loads(draft_path.read_text())
        topic = data["topic"]
        folder = OUT / f'{topic["number"]}-{topic["slug"]}'
        folder.mkdir(exist_ok=True)
        shutil.copy2(THEME, folder / "report-theme.typ")
        (folder / "content.json").write_text(json.dumps(data, ensure_ascii=False, indent=2))
        (folder / "main.typ").write_text(render(data))
        (folder / ".reader-edition.json").write_text(json.dumps({"number": topic["number"], "title": topic["title"], "target_pages": 10, "status": "draft-source"}, indent=2))
        print(f"RENDERED {topic['number']} {topic['slug']}")

if __name__ == "__main__":
    main()
