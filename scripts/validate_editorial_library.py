from __future__ import annotations

import re
import subprocess
from pathlib import Path

OUT = Path('/home/ubuntu/webdev-static-assets/career-weekly-library/future-editions')
errors: list[str] = []
preview_count = 0
complete_count = 0

for pdf in sorted(OUT.glob('career-weekly-edition-*-preview.pdf')):
    preview_count += 1
    info = subprocess.check_output(['pdfinfo', str(pdf)], text=True, stderr=subprocess.DEVNULL)
    pages = int(next(line.split(':', 1)[1] for line in info.splitlines() if line.startswith('Pages:')))
    text = subprocess.check_output(['pdftotext', '-layout', str(pdf), '-'], text=True)
    if not 4 <= pages <= 6:
        errors.append(f'{pdf.name}: preview page count {pages}')
    if 'CAREER WEEKLY · A SIGNRL PUBLICATION' not in text:
        errors.append(f'{pdf.name}: missing masthead')
    if 'CONTINUE WITH THE FULL EDITION' not in text:
        errors.append(f'{pdf.name}: missing full-edition invitation')
    if text.count('WORKING PROMPT') != 1:
        errors.append(f'{pdf.name}: expected one concise exercise, found {text.count("WORKING PROMPT")}')

for pdf in sorted(OUT.glob('career-weekly-edition-*-complete.pdf')):
    complete_count += 1
    info = subprocess.check_output(['pdfinfo', str(pdf)], text=True, stderr=subprocess.DEVNULL)
    pages = int(next(line.split(':', 1)[1] for line in info.splitlines() if line.startswith('Pages:')))
    text = subprocess.check_output(['pdftotext', '-layout', str(pdf), '-'], text=True)
    if not 11 <= pages <= 15:
        errors.append(f'{pdf.name}: complete page count {pages}')
    if 'CAREER WEEKLY · A SIGNRL PUBLICATION' not in text:
        errors.append(f'{pdf.name}: missing masthead')
    if 'SOURCE NOTES' not in text:
        errors.append(f'{pdf.name}: missing source notes')
    if text.count('WORKING PROMPT') != 3:
        errors.append(f'{pdf.name}: expected three action pages, found {text.count("WORKING PROMPT")}')

print(f'preview={preview_count} complete={complete_count} errors={len(errors)}')
if errors:
    print('\n'.join(errors[:40]))
    raise SystemExit(1)
