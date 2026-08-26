#!/usr/bin/env bash
set -euo pipefail
BASE_URL="${1:?usage: audit_pdf_branding.sh BASE_URL OUTPUT_DIR}"
OUT_DIR="${2:?usage: audit_pdf_branding.sh BASE_URL OUTPUT_DIR}"
mkdir -p "$OUT_DIR/pdfs" "$OUT_DIR/text"
REPORT="$OUT_DIR/pdf-branding-audit.tsv"
printf 'url\tstatus\tpages\tlegacy_signal_weekly\tmasthead\n' > "$REPORT"

curl -fsS "$BASE_URL/api/trpc/editions.public?input=%7B%22json%22%3A%7B%22limit%22%3A12,%22offset%22%3A0%7D%7D" \
  | sed 's/\\\\"/"/g' > "$OUT_DIR/public.json"
grep -oE '"(previewUrl|completeUrl)":"[^"]+"' "$OUT_DIR/public.json" | sed -E 's/^"[^"]+":"([^"]+)"$/\1/' | sort -u > "$OUT_DIR/urls.txt"

while IFS= read -r path; do
  [ -z "$path" ] && continue
  name="$(basename "$path")"
  pdf="$OUT_DIR/pdfs/$name"
  txt="$OUT_DIR/text/${name%.pdf}.txt"
  status="ok"
  if ! curl -fsSL "$BASE_URL$path" -o "$pdf"; then status="download-failed"; fi
  pages="-"
  legacy="-"
  masthead="-"
  if [ "$status" = ok ]; then
    pages="$(pdfinfo "$pdf" | awk -F: '/^Pages/{gsub(/ /, "", $2); print $2}')"
    pdftotext -layout "$pdf" "$txt"
    if grep -qi 'Signal Weekly' "$txt"; then legacy="yes"; else legacy="no"; fi
    if grep -q 'CAREER WEEKLY · A SIGNRL PUBLICATION' "$txt"; then masthead="yes"; else masthead="no"; fi
  fi
  printf '%s\t%s\t%s\t%s\t%s\n' "$path" "$status" "$pages" "$legacy" "$masthead" >> "$REPORT"
done < "$OUT_DIR/urls.txt"

cat "$REPORT"
