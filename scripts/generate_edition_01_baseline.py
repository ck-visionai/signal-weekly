from __future__ import annotations

import json
from pathlib import Path

from generate_editorial_future_library import OUT, body_paragraphs, page

ISSUE = 1
TITLE = 'The Career Evidence Working Page'
SUBTITLE = 'Turn broad claims into credible evidence.'
SOURCE_LINES = ['U.S. Department of Labor — Job Seekers', 'https://www.dol.gov/agencies/eta/job-seekers']


def main() -> None:
    complete_pages = 11
    preview_pages = 6
    complete_editorial_pages = 8
    preview_editorial_pages = 5
    stem = 'career-weekly-edition-01-career-evidence-working-page'
    complete = ''.join(
        page(
            ISSUE,
            TITLE,
            SUBTITLE,
            'COMPLETE EDITION',
            number,
            complete_pages,
            body_paragraphs('resume', TITLE, SUBTITLE, number, complete_editorial_pages),
            intro=number == 1,
            action=number > complete_editorial_pages,
            source_lines=SOURCE_LINES if number == complete_pages else None,
        )
        for number in range(1, complete_pages + 1)
    )
    preview = ''.join(
        page(
            ISSUE,
            TITLE,
            SUBTITLE,
            'PREVIEW EDITION',
            number,
            preview_pages,
            body_paragraphs('resume', TITLE, SUBTITLE, number, preview_editorial_pages),
            intro=number == 1,
            action=number == preview_pages,
            notice=True,
        )
        for number in range(1, preview_pages + 1)
    )
    preamble = '#set text(font: ("Libertinus Serif", "Noto Sans"), size: 10.5pt, fill: rgb("18202a"))\n#set par(justify: false, leading: 0.72em, spacing: 0.72em)\n#let navy = rgb("03045e")\n#let blue = rgb("475492")\n#let ink = rgb("18202a")\n'
    out = Path(OUT)
    (out / f'{stem}-preview.typ').write_text(preamble + preview, encoding='utf-8')
    (out / f'{stem}-complete.typ').write_text(preamble + complete, encoding='utf-8')
    import subprocess
    for variant in ('preview', 'complete'):
        typ = out / f'{stem}-{variant}.typ'
        pdf = out / f'{stem}-{variant}.pdf'
        subprocess.run(['typst', 'compile', str(typ), str(pdf)], check=True, stdout=subprocess.DEVNULL, stderr=subprocess.PIPE)
    manifest = {
        'issueNumber': ISSUE,
        'title': TITLE,
        'subtitle': SUBTITLE,
        'previewPages': preview_pages,
        'completePages': complete_pages,
        'previewFile': f'{stem}-preview.pdf',
        'completeFile': f'{stem}-complete.pdf',
        'source': {'title': SOURCE_LINES[0], 'url': SOURCE_LINES[1], 'publisher': 'U.S. Department of Labor'},
    }
    (out / 'edition-01-baseline-manifest.json').write_text(json.dumps(manifest, indent=2), encoding='utf-8')
    print(json.dumps(manifest))


if __name__ == '__main__':
    main()
