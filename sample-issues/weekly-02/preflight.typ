#import "@preview/glossarium:0.5.10": make-glossary, register-glossary, print-glossary, gls
#import "report-theme.typ": report-theme

#show: make-glossary
#show: report-theme.with(
  title: "Signal Weekly Sample Briefing 02",
  author: "A Signrl publication",
  rhythm: "longform",
  body-size: 10pt,
  running-header: false,
)

#let terms = (
  (key: "ats", short: "ATS", long: "applicant tracking system", description: [A system employers may use to organise application materials.]),
)
#register-glossary(terms)

This preflight confirms the Signal Weekly reader-edition base and the use of #gls("ats").

#print-glossary(terms, show-all: true, disable-back-references: true)
