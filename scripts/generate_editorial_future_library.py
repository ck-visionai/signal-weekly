from __future__ import annotations

import re
import subprocess
from pathlib import Path

from generate_future_edition_library import OUT, SOURCES, THEMES, esc


EDITORIAL_LENSES = {
    "resume": {
        "why": "A résumé is a reading problem before it is a writing problem. A hiring reader needs to understand the setting, the decision, and the contribution without filling in the gaps from a flattering adjective.",
        "lens": "Start with the reader's question: what changed, what did this person actually do, and what evidence makes the claim credible? The strongest language follows the evidence rather than trying to substitute for it.",
        "example": "A weak statement announces a trait. A useful statement gives the operating context, the action, and a result that can be discussed honestly. That structure remains useful even when the target role or industry changes.",
        "guidance": "Use the role description as a translation prompt, not as a vocabulary bank. Preserve the language that is genuinely relevant, then connect it to work you can explain with concrete detail.",
        "failure": "The common failure is compression without context: a string of verbs and numbers that sounds energetic but leaves the reader unable to tell what was difficult, what was yours, or why it mattered.",
    },
    "interview": {
        "why": "An interview answer is a small piece of evidence about judgment. It is not a performance of confidence, and it does not become more persuasive when the context, trade-off, or personal contribution is omitted.",
        "lens": "Listen for the capability beneath the question. The same experience can show judgment, ownership, influence, learning, or prioritisation depending on which decision and trade-off you make visible.",
        "example": "A rehearsed story gives a polished sequence. A useful story explains the situation, the choice, the action, the result, and what you would carry into a similar situation now.",
        "guidance": "Prepare a small bank of truthful stories, but do not memorise one answer for every prompt. Keep the facts stable and change the emphasis to answer the question that was actually asked.",
        "failure": "The common failure is answering the question you hoped to receive. That usually produces long context, vague ownership, and a conclusion that says what you learned without showing how your behaviour changed.",
    },
    "negotiation": {
        "why": "An offer is a bundle of commitments, constraints, and signals. Treating it as a single number can make a good opportunity look weak or a risky mandate look attractive.",
        "lens": "Separate facts from assumptions, preferences from requirements, and the employer's constraints from the value you are being asked to create. That separation makes a conversation more precise and less theatrical.",
        "example": "A weak negotiation reacts to the headline number. A stronger one names the scope, timing, decision rights, compensation mix, and conditions that determine whether the role can succeed.",
        "guidance": "Ask questions before making a counter. Use one clear rationale, state the change you want, and document what has actually been agreed rather than relying on a friendly implication.",
        "failure": "The common failure is negotiating every variable at once or using an alternative offer as theatre. Precision builds trust; pressure without a clear reason usually reduces it.",
    },
    "decision": {
        "why": "Career decisions become harder when the emotional urgency of the moment is mistaken for evidence. A decision memo slows the choice down enough to show the trade-offs that will still matter after the excitement fades.",
        "lens": "Name the choice, the alternatives, the constraints, and the downside. Then distinguish what you know from what you are predicting so the uncertain parts can be tested rather than hidden.",
        "example": "A weak decision is a list of pros and cons. A useful decision explains which criteria matter most, what each option makes possible, and what would cause you to revisit the choice.",
        "guidance": "Use a short time horizon for immediate action and a longer horizon for consequences. Ask whose interests are being served, what is reversible, and which assumption deserves a direct question.",
        "failure": "The common failure is false precision: assigning numbers to feelings without explaining the reasoning behind them, then treating the resulting score as if it were an objective answer.",
    },
    "competencies": {
        "why": "Broad competencies are useful only when they can be observed. A label such as leadership or communication becomes meaningful when a reader can see the behaviour, the context, and the effect on other people or the work.",
        "lens": "Move from the abstract capability to the moment in which it had to be used. Look for the decision, the stakeholders, the constraint, and the evidence that distinguishes contribution from intention.",
        "example": "A weak claim says that someone is strategic. A stronger account shows the competing priorities, the choice made, the people brought along, and the result that made the choice consequential.",
        "guidance": "Describe behaviour at the level another person could verify. A small number of specific examples is more useful than a long inventory of qualities that cannot be tested.",
        "failure": "The common failure is treating a competency model as a checklist of adjectives. That can produce polished language while hiding the exact behaviour a manager or hiring reader needs to evaluate.",
    },
    "skills": {
        "why": "A skill is not only a tool name or a course completed. Its value becomes legible when it changes a workflow, improves a decision, or helps a team deliver something with less risk or friction.",
        "lens": "Place the skill inside a real task. Distinguish exposure from repeated use, personal contribution from team outcome, and technical familiarity from the judgment needed to apply the capability responsibly.",
        "example": "A weak claim lists a tool. A useful account explains the problem, the workflow, the choice of approach, and what became faster, clearer, safer, or more reliable as a result.",
        "guidance": "Translate skills into outcomes without overstating causality. Name the limits of the evidence and identify the next practice that would make the capability more portable.",
        "failure": "The common failure is confusing a credential or a keyword with demonstrated capability. Readers need enough context to understand where the skill was used and what the person can actually do with it.",
    },
}

EDITORIAL_HEADINGS = [
    ("WHY THIS MATTERS", "why"),
    ("THE EDITORIAL LENS", "lens"),
    ("A STRONGER EXAMPLE", "example"),
    ("PRACTICAL GUIDANCE", "guidance"),
    ("COMMON FAILURE MODES", "failure"),
]


def body_paragraphs(theme: str, title: str, subtitle: str, page_no: int, editorial_pages: int) -> list[str]:
    lens = EDITORIAL_LENSES[theme]
    if page_no == 1:
        return [subtitle, f"{title} is a Career Weekly briefing for one real career situation. Read the argument first; use the working pages only after you can name the decision they are meant to improve."]
    if page_no <= len(EDITORIAL_HEADINGS) + 1:
        _, key = EDITORIAL_HEADINGS[page_no - 2]
        return [
            lens[key],
            f"For {title.lower()}, the useful test is whether the reader can understand the context, the judgment involved, and the evidence that would support the conclusion.",
            "That standard is deliberately practical. It gives a working professional a way to improve the explanation without pretending that every outcome can be controlled or reduced to a single metric.",
            "Read this section as an argument about what deserves attention first. The working pages come later, once the distinction is clear enough to apply to a real situation.",
        ]
    if page_no <= editorial_pages:
        return [
            f"Use {title.lower()} as a lens on one role, project, conversation, or offer. Begin with the facts available to you, label the assumptions, and keep the claim small enough to explain without performance.",
            "The aim is not to produce a perfect sentence or a universal answer. It is to make the next conversation, application, or decision more informed than it would have been from instinct alone.",
            "A useful test is transfer: could another person understand what happened, what you contributed, and what you would do next? If not, the missing work is usually context or judgment, not more polish.",
            "Keep the conclusion proportionate to the evidence. Precision is not the same as certainty; it is the discipline of saying what the available facts can support and what still needs to be learned.",
        ]
    return [
        "Now move from explanation to application. Keep the page concrete: one situation, one claim, one decision, and one piece of evidence that another person could reasonably assess.",
        "If the evidence is missing, record that as a finding rather than filling the gap with stronger language. A useful working page makes the next question easier to ask.",
    ]


def block(text: str, *, fill: str = "eef2fb", label: str | None = None) -> str:
    label_line = f'#text(font: "Noto Sans", size: 8.5pt, weight: "bold", fill: navy)[{label}]\n    #linebreak()' if label else ''
    return f'''#block(width: 100%, inset: (x: 0.75em, y: 0.65em), fill: rgb("{fill}"), radius: 2pt)[
    {label_line}
    #text(size: 9.5pt, fill: ink)[{esc(text)}]
  ]'''


def page(issue_no: int, title: str, subtitle: str, edition_label: str, page_no: int, total: int, paragraphs: list[str], *, intro: bool = False, action: bool = False, notice: bool = False, source_lines: list[str] | None = None) -> str:
    heading_body = f'''#text(font: "Noto Sans", size: 8pt, weight: "bold", fill: blue)[{edition_label}]
    #v(0.35em)
    #text(size: 22pt, weight: "bold", fill: ink)[{esc(title)}]
    #v(0.55em)
    #text(size: 11pt, fill: ink)[{esc(subtitle)}]'''
    heading = f'#align(center)[{heading_body}]' if intro else heading_body
    paras = '\n  '.join(f'#par(leading: 0.72em, spacing: 0.72em)[{esc(text)}]' for text in paragraphs)
    source_block = ''
    if source_lines:
        source_block = '#v(0.4em)\n' + block(' · '.join(source_lines), fill='f4f5fb', label='SOURCE NOTES')
    action_block = ''
    if action:
        action_block = '\n  ' + block('Write one accurate example from your own experience. Name the context, the action, the constraint, and the evidence another person could evaluate.', label='WORKING PROMPT')
        if notice:
            action_block += '\n  ' + block('This is a preview. Download the Complete Edition for the full editorial briefing and working pages.', fill='e7f5f7', label='CONTINUE WITH THE COMPLETE EDITION')
    return f'''#page(margin: 1.65cm, header: none, footer: none)[
  #text(font: "Noto Sans", size: 7.5pt, weight: "bold", fill: navy)[CAREER WEEKLY · A SIGNRL PUBLICATION]
  #align(right)[#text(font: "Noto Sans", size: 7.5pt, weight: "bold", fill: blue)[{edition_label} · {page_no:02d} / {total:02d}]]
  #line(length: 100%, stroke: 1pt + blue)
  #v(1.35em)
  {heading}
  #v(0.85em)
  {paras}
  {action_block}
  {source_block}
]
'''


def build_one(item: tuple[int, str, str, str, str]) -> dict:
    issue_no, theme, category, title, subtitle = item
    source = SOURCES[theme]
    complete_pages = 11 + ((issue_no * 7) % 5)
    preview_pages = 4 + ((issue_no * 3) % 3)
    safe = re.sub(r'[^a-z0-9]+', '-', title.lower()).strip('-')
    stem = f'career-weekly-edition-{issue_no:02d}-{safe}'
    editorial_pages = complete_pages - 3
    complete = ''.join(
        page(issue_no, title, subtitle, 'COMPLETE EDITION', p, complete_pages, body_paragraphs(theme, title, subtitle, p, editorial_pages), intro=p == 1, action=p > editorial_pages, source_lines=[f'{source[0]} — {source[2]}', source[1]] if p == complete_pages else None)
        for p in range(1, complete_pages + 1)
    )
    preview = ''.join(
        page(issue_no, title, subtitle, 'PREVIEW EDITION', p, preview_pages, body_paragraphs(theme, title, subtitle, p, preview_pages - 1), intro=p == 1, action=p == preview_pages, notice=True)
        for p in range(1, preview_pages + 1)
    )
    preamble = '#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10.5pt, fill: rgb("18202a"))\n#set par(justify: false, leading: 0.72em, spacing: 0.72em)\n#let navy = rgb("03045e")\n#let blue = rgb("475492")\n#let ink = rgb("18202a")\n'
    out = Path(OUT)
    (out / f'{stem}-preview.typ').write_text(preamble + preview, encoding='utf-8')
    (out / f'{stem}-complete.typ').write_text(preamble + complete, encoding='utf-8')
    for variant in ('preview', 'complete'):
        typ = out / f'{stem}-{variant}.typ'
        pdf = out / f'{stem}-{variant}.pdf'
        subprocess.run(['typst', 'compile', str(typ), str(pdf)], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
    return {'issueNumber': issue_no, 'category': category, 'title': title, 'subtitle': subtitle, 'previewPages': preview_pages, 'completePages': complete_pages, 'previewFile': f'{stem}-preview.pdf', 'completeFile': f'{stem}-complete.pdf', 'source': {'title': source[0], 'url': source[1], 'publisher': source[2]}}


def main() -> None:
    items = []
    issue_no = 13
    for theme, category, entries in THEMES:
        for title, subtitle in entries:
            items.append((issue_no, theme, category, title, subtitle))
            issue_no += 1
    results = [build_one(item) for item in items]
    (Path(OUT) / 'editorial-future-library-manifest.json').write_text(__import__('json').dumps(results, indent=2), encoding='utf-8')
    print(f'generated {len(results)} issues / {len(results) * 2} PDFs')


if __name__ == '__main__':
    main()
