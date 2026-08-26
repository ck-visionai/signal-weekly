from __future__ import annotations

import json
import sys
from pathlib import Path

from generate_editorial_future_library import OUT, SOURCES, build_one

RELEASED_ITEMS = [
    (2, 'resume', 'Resume evidence', 'The ATS Translation Layer', 'Use role language without borrowing experience.'),
    (3, 'interview', 'Interview evidence', 'Your Three-Story Interview Bank', 'Prepare flexible, truthful interview evidence.'),
    (4, 'interview', 'Interview evidence', 'The Question Behind the Question', 'Find the capability beneath the difficult prompt.'),
    (5, 'interview', 'Interview evidence', 'Research, Reflect, Rehearse', 'Connect preparation to your own relevant proof.'),
    (6, 'interview', 'Interview evidence', 'The Executive Screen', 'Make the first ten minutes count.'),
    (7, 'interview', 'Interview evidence', 'When They Ask About a Failure', 'Discuss setbacks with ownership and learning.'),
    (8, 'decision', 'Career decisions', 'Questions That Help You Evaluate the Role', 'Use questions to understand scope and decision rights.'),
    (9, 'negotiation', 'Offer and negotiation', 'The Whole-Role Negotiation Map', 'Evaluate the offer beyond headline salary.'),
    (10, 'negotiation', 'Offer and negotiation', 'Ask for Time Before You Answer', 'Make room for a considered decision.'),
    (11, 'negotiation', 'Offer and negotiation', 'When Salary Cannot Move', 'Clarify what matters when constraints are real.'),
    (12, 'decision', 'Career decisions', 'The Career Decision Memo', 'Make the trade-offs visible before you decide.'),
]


def main() -> None:
    results = []
    for item in RELEASED_ITEMS:
        results.append(build_one(item))
    manifest = Path(OUT) / 'editorial-released-library-manifest.json'
    manifest.write_text(json.dumps(results, indent=2), encoding='utf-8')
    print(f'generated {len(results)} issues / {len(results) * 2} PDFs')


if __name__ == '__main__':
    main()
