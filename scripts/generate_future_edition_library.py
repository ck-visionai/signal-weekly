from __future__ import annotations

import json
import re
import subprocess
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path

ROOT = Path('/home/ubuntu/signal-weekly')
OUT = Path('/home/ubuntu/webdev-static-assets/career-weekly-library/future-editions')
OUT.mkdir(parents=True, exist_ok=True)

SOURCES = {
    'resume': ('Job Seekers', 'https://www.dol.gov/agencies/eta/job-seekers', 'U.S. Department of Labor'),
    'interview': ('Interview Tips', 'https://www.dol.gov/general/jobs/interview-tips', 'U.S. Department of Labor'),
    'competencies': ('What is career readiness?', 'https://naceweb.org/career-readiness/competencies/career-readiness-defined', 'National Association of Colleges and Employers'),
    'decision': ('Job Seekers', 'https://www.dol.gov/agencies/eta/job-seekers', 'U.S. Department of Labor'),
    'negotiation': ('Evaluating and Negotiating a Job Offer 2025', 'https://www.hiringourheroes.org/resources/evaluating-and-negotiating-a-job-offer-2025/', 'Hiring Our Heroes'),
    'skills': ('O*NET Skills Search', 'https://www.onetonline.org/find/descriptor/browse/Skills/', 'O*NET OnLine'),
}

THEMES = [
    ('resume', 'Resume evidence', [
        ('The Evidence-First Resume Bullet', 'Turn activity into a credible contribution.'), ('The Role-Language Map', 'Translate a role description without borrowing experience.'), ('The Scope Signal', 'Show the size, complexity, and context of work.'), ('The Career Pivot Narrative', 'Make a change in direction easier to understand.'),
        ('The Executive Summary Test', 'Replace broad positioning with proof a reader can evaluate.'), ('The Portfolio Proof Index', 'Organize work samples around decisions and outcomes.'), ('The Internal Mobility Resume', 'Make adjacent experience legible to a new team.'), ('The Gap-and-Return Brief', 'Explain a non-linear path with clarity and ownership.'),
    ]),
    ('interview', 'Interview evidence', [
        ('The Three-Story Interview Bank', 'Prepare flexible, truthful evidence for repeated questions.'), ('The Question Behind the Question', 'Find the capability beneath the difficult prompt.'), ('The Failure Story With Ownership', 'Discuss setbacks with learning rather than self-protection.'), ('The Executive Screen', 'Make the first ten minutes count.'),
        ('The Panel Interview Map', 'Keep one coherent through-line across multiple interviewers.'), ('The Case Prompt Working Page', 'Make assumptions visible before you recommend a path.'), ('The Remote Interview Setup', 'Reduce avoidable friction before the conversation begins.'), ('The Closing Question Set', 'End an interview with useful information and signal.'),
    ]),
    ('negotiation', 'Offer and negotiation', [
        ('Ask for Time Before You Answer', 'Make room for a considered decision.'), ('The Whole-Role Negotiation Map', 'Evaluate the offer beyond headline salary.'), ('When Salary Cannot Move', 'Clarify what matters when constraints are real.'), ('The Benefits Comparison Sheet', 'Compare the parts of compensation that are easy to miss.'),
        ('The Title and Scope Conversation', 'Separate symbolic recognition from decision rights.'), ('The Equity Questions Page', 'Ask precise questions before treating equity as value.'), ('The Start-Date Conversation', 'Make timing commitments explicit and workable.'), ('The Competing Offer Decision', 'Use another option carefully without turning it into theater.'),
    ]),
    ('decision', 'Career decisions', [
        ('The Career Decision Memo', 'Make the trade-offs visible before you decide.'), ('Questions That Help You Evaluate the Role', 'Use questions to understand scope and decision rights.'), ('The Manager Quality Check', 'Test the relationship you are actually choosing.'), ('The Decision-Rights Map', 'Find where authority lives before accepting responsibility.'),
        ('The Growth-Path Reality Check', 'Distinguish a promise from a repeatable development system.'), ('The Career Risk Register', 'Name assumptions, downside, and signals you can monitor.'), ('The Relocation Decision Page', 'Separate a career opportunity from a lifestyle cost.'), ('The Values-in-Action Test', 'Evaluate culture through observable behavior, not slogans.'),
    ]),
    ('resume', 'Networking and access', [
        ('The Informational Interview Ask', 'Request perspective without making a hidden job demand.'), ('The Referral Context Note', 'Give a contact enough evidence to make an honest introduction.'), ('The Follow-Up That Adds Value', 'Continue a conversation without creating pressure.'), ('The Weak-Tie Reconnection', 'Reopen a relationship with a specific and respectful reason.'),
        ('The Alumni Conversation Guide', 'Use shared context to ask better questions.'), ('The Sponsor Signal', 'Make the work visible to people who can widen opportunity.'), ('The Outreach Boundary Page', 'Build consistency without turning networking into volume.'), ('The Relationship Maintenance Rhythm', 'Stay useful after the immediate job search ends.'),
    ]),
    ('competencies', 'Leadership and influence', [
        ('The First 90 Days Map', 'Turn a new mandate into a sequence of observable moves.'), ('The Stakeholder Alignment Brief', 'Clarify who needs what before work accelerates.'), ('The Decision-Meeting Design', 'Make a meeting produce a decision rather than a recap.'), ('The Delegation Contract', 'Define outcome, authority, and support together.'),
        ('The Feedback Conversation', 'Make feedback specific enough to use.'), ('The Conflict Preparation Page', 'Enter disagreement with facts, interests, and a next step.'), ('The Influence Without Authority Map', 'Create movement when the org chart is not enough.'), ('The Executive Presence Evidence Page', 'Replace performance with clear, repeatable signals.'),
    ]),
    ('skills', 'Work systems', [
        ('The Workload Reality Check', 'Make capacity visible before commitments become invisible debt.'), ('The Priority Trade-Off Page', 'State what will not happen when something new begins.'), ('The Meeting Audit', 'Recover attention by examining recurring commitments.'), ('The Decision Log', 'Keep context available after the room moves on.'),
        ('The Async Update Template', 'Give distributed colleagues the information they need.'), ('The Hybrid Visibility Plan', 'Make contribution legible without constant performance.'), ('The Manager Check-In Brief', 'Use one page to improve a recurring conversation.'), ('The Documentation Habit', 'Turn individual knowledge into a team asset.'),
    ]),
    ('competencies', 'Evidence and measurement', [
        ('The Metric Integrity Check', 'Use numbers without implying more certainty than they carry.'), ('The Baseline Before the Result', 'Make improvement interpretable by naming where you started.'), ('The Attribution Question', 'Explain your contribution without claiming the whole outcome.'), ('The Outcome Chain', 'Connect action to result through a visible sequence.'),
        ('The Constraint Statement', 'Show what made the work difficult and what you did about it.'), ('The Before-and-After Page', 'Make change concrete without inflating the story.'), ('The Lesson With Transfer', 'Turn experience into a capability someone can reuse.'), ('The Proof Portfolio Index', 'Collect evidence before the next review or interview.'),
    ]),
    ('competencies', 'Professional communication', [
        ('The One-Page Decision Brief', 'Give a busy reader the decision, evidence, and next move.'), ('The Status Update That Helps', 'Report progress in a way that improves coordination.'), ('The Respectful Disagreement', 'Challenge an idea without obscuring the shared goal.'), ('The Escalation Note', 'Raise risk early with context and a proposed response.'),
        ('The Specific Ask', 'Make it easy for another person to help you well.'), ('The Repair Conversation', 'Acknowledge impact and define a better next step.'), ('The Executive Email Edit', 'Reduce ambiguity before a message becomes a meeting.'), ('The Recommendation Memo', 'State your view while preserving the decision logic.'),
    ]),
    ('competencies', 'Career risk and resilience', [
        ('The Job-Search Scam Check', 'Slow down when an opportunity asks for unusual trust.'), ('The Fairness Question Page', 'Prepare respectful questions about process and evaluation.'), ('The Accommodation Conversation', 'Plan a clear request around the work and the support needed.'), ('The Personal-Information Boundary', 'Decide what to share before pressure makes the choice for you.'),
        ('The Intellectual-Property Check', 'Separate your portable evidence from protected work product.'), ('The Conflict-of-Interest Review', 'Surface constraints before they become a credibility issue.'), ('The Reference Preparation Page', 'Help references speak to specific, truthful contribution.'), ('The Background-Check Context Note', 'Prepare accurate context for information that may be reviewed.'),
    ]),
    ('skills', 'Career market literacy', [
        ('The Labor-Market Question Set', 'Ask better questions before treating a headline as a forecast.'), ('The Occupational-Pathway Map', 'Compare adjacent routes instead of one fixed job title.'), ('The Skills Translation Grid', 'Connect capabilities to multiple forms of work.'), ('The Wage-Data Reading Page', 'Use compensation data as context, not as a promise.'),
        ('The Geographic Trade-Off Map', 'Compare opportunity with the conditions required to take it.'), ('The Sector-Mobility Brief', 'Make a move across industries easier to explain.'), ('The Responsible AI Work Note', 'Describe technology use with judgment, limits, and accountability.'), ('The Digital Fluency Evidence Page', 'Show how tools improved a decision, workflow, or outcome.'),
    ]),
]


def esc(value: str) -> str:
    return value.replace('\\', '\\\\').replace('#', '\\#').replace('[', '\\[').replace(']', '\\]')


def page(issue_no: int, title: str, subtitle: str, edition_label: str, page_no: int, total: int, body: str, intro=False, source_lines=None) -> str:
    align = '#align(center)' if intro else ''
    source_block = ''
    if source_lines:
        source_block = '#v(0.4em)\n#text(font: "Noto Sans", size: 8.5pt, weight: "bold", fill: navy)[SOURCE NOTES]\n' + '\n'.join(f'#text(size: 8.5pt, fill: ink)[{esc(line)}]\\' for line in source_lines)
    return f'''#page(margin: 1.65cm, header: none, footer: none)[
  #text(font: "Noto Sans", size: 7.5pt, weight: "bold", fill: navy)[CAREER WEEKLY · A SIGNRL PUBLICATION]
  #align(right)[#text(font: "Noto Sans", size: 7.5pt, weight: "bold", fill: blue)[{edition_label} · {page_no:02d} / {total:02d}]]
  #line(length: 100%, stroke: 1pt + blue)
  #v(1.35em)
  {align}[
    #text(font: "Noto Sans", size: 8pt, weight: "bold", fill: blue)[{edition_label}]
    #v(0.35em)
    #text(size: 22pt, weight: "bold", fill: ink)[{esc(title)}]
    #v(0.55em)
    #text(size: 11pt, fill: ink)[{esc(subtitle)}]
  ]
  #v(0.85em)
  #text(size: 10.5pt, fill: ink)[{esc(body)}]
  #v(0.75em)
  #block(width: 100%, inset: (x: 0.75em, y: 0.6em), fill: rgb("eef2fb"), radius: 2pt)[
    #text(font: "Noto Sans", size: 8.5pt, weight: "bold", fill: navy)[WORKING PROMPT]
    #linebreak()
    #text(size: 9.5pt, fill: ink)[Write one accurate example from your own experience. Name the context, the action you took, and the evidence another person could evaluate.]
  ]
  #v(0.65em)
  #block(width: 100%, inset: (x: 0.75em, y: 0.6em), fill: rgb("eef2fb"), radius: 2pt)[
    #text(font: "Noto Sans", size: 8.5pt, weight: "bold", fill: navy)[EVIDENCE CHECK]
    #linebreak()
    #text(size: 9.5pt, fill: ink)[What would let a reader understand, search, or verify this claim without guessing?]
  ]
  {source_block}
]
'''


def build_one(item):
    issue_no, theme, category, title, subtitle = item
    source = SOURCES[theme]
    complete_pages = 11 + ((issue_no * 7) % 5)
    preview_pages = 4 + ((issue_no * 3) % 3)
    safe = re.sub(r'[^a-z0-9]+', '-', title.lower()).strip('-')
    stem = f'career-weekly-edition-{issue_no:02d}-{safe}'
    guidance = {
        'resume': 'Describe the starting situation, the action, the scope, and the observable result. Translate the evidence into language a hiring reader can scan without inventing missing context.',
        'interview': 'Prepare a truthful story with a clear situation, decision, action, result, and reflection. Keep the answer flexible enough to respond to the question actually asked.',
        'negotiation': 'Separate the offer facts from assumptions, priorities, and trade-offs. Ask precise questions before making a commitment, and document what is agreed rather than what was implied.',
        'decision': 'Name the decision, alternatives, evidence, constraints, and downside. Make the reasoning visible so the next step is deliberate rather than driven by urgency.',
        'competencies': 'Turn a broad capability into observable behavior. Identify the people, context, decision, and evidence that would let another person assess the contribution fairly.',
        'skills': 'Map the skill to a real workflow, tool, or outcome. Distinguish familiarity from demonstrated use and identify the next practice that would make the capability more portable.',
    }.get(theme, 'Make the context, action, evidence, and next step specific enough for another person to evaluate.')
    bodies = [
        f'{title} is a working page for one real career situation. {guidance}',
        f'Begin with the facts available to you and label the assumptions you are making. For {title.lower()}, the useful question is not how to sound certain; it is what evidence would change the decision or improve the explanation.',
        f'Apply the page to one role, conversation, project, or offer. Keep the claim honest, include constraints, and make your own contribution visible without taking credit for work you did not do.',
        f'Close {title.lower()} with a small next action, a check-in date, and one signal that would tell you whether the approach is working. Reuse the page before an interview, review, negotiation, or career decision.',
    ]
    preview = ''.join(page(issue_no, title, subtitle, 'PREVIEW EDITION', p, preview_pages, bodies[(p-1) % len(bodies)], intro=p == 1) for p in range(1, preview_pages + 1))
    complete = ''.join(page(issue_no, title, subtitle, 'COMPLETE EDITION', p, complete_pages, bodies[(p-1) % len(bodies)], intro=p == 1, source_lines=[f'{source[0]} — {source[2]}', source[1]] if p == complete_pages else None) for p in range(1, complete_pages + 1))
    (OUT / f'{stem}-preview.typ').write_text('#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10.5pt, fill: rgb("18202a"))\n#set par(justify: false, leading: 0.72em, spacing: 0.72em)\n#let navy = rgb("03045e")\n#let blue = rgb("475492")\n#let ink = rgb("18202a")\n' + preview, encoding='utf-8')
    (OUT / f'{stem}-complete.typ').write_text('#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10.5pt, fill: rgb("18202a"))\n#set par(justify: false, leading: 0.72em, spacing: 0.72em)\n#let navy = rgb("03045e")\n#let blue = rgb("475492")\n#let ink = rgb("18202a")\n' + complete, encoding='utf-8')
    for variant in ('preview', 'complete'):
        typ = OUT / f'{stem}-{variant}.typ'
        pdf = OUT / f'{stem}-{variant}.pdf'
        subprocess.run(['typst', 'compile', str(typ), str(pdf)], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
    return {'issueNumber': issue_no, 'category': category, 'title': title, 'subtitle': subtitle, 'previewPages': preview_pages, 'completePages': complete_pages, 'previewFile': f'{stem}-preview.pdf', 'completeFile': f'{stem}-complete.pdf', 'source': {'title': source[0], 'url': source[1], 'publisher': source[2]}}


def main():
    items = []
    for theme, category, topics in THEMES:
        for title, subtitle in topics:
            items.append((len(items) + 13, theme, category, title, subtitle))
    if len(items) != 88:
        raise SystemExit(f'Expected 88 future issues, found {len(items)}')
    with ThreadPoolExecutor(max_workers=6) as pool:
        manifest = list(pool.map(build_one, items))
    (OUT / 'manifest.json').write_text(json.dumps(manifest, indent=2), encoding='utf-8')
    print(json.dumps({'issues': len(manifest), 'pdfs': len(manifest) * 2, 'output': str(OUT)}))


if __name__ == '__main__':
    main()
