// Native professional report entry.
// Prepared projects receive report-theme.typ beside this file.

#import "report-theme.typ": report-accent, report-theme

#show: report-theme.with(
  title: "The Executive ATS Résumé Audit",
  author: "Signal Weekly",
  rhythm: "report",
  running-header: true,
)

// ---------- Title page ----------
#page(margin: (top: 30%, x: 2.2cm), numbering: none, header: none)[
  #set par(first-line-indent: 0em)
  #align(center)[
    #text(size: 26pt, weight: "bold", fill: report-accent)[The Executive ATS Résumé Audit]
    #v(0.5em)
    #text(size: 14pt, fill: luma(80))[A 15-minute pre-submission checklist for mid-career and executive professionals]
    #v(2em)
    #line(length: 40%, stroke: 0.5pt + luma(160))
    #v(2em)
    #text(size: 12pt)[
      Prepared by Signal Weekly \
      #datetime.today().display("[year]-[month]-[day]")
    ]
  ]
]

// ---------- Table of contents ----------
#page(numbering: none, header: none)[
  #outline(title: [Contents], indent: 1.5em)
]

// ---------- Main body ----------
#counter(page).update(1)

= Use this before every application

This is not a promise of an interview or a way to “beat” a system. It is a disciplined final check for making your real experience easy to understand, search and verify. Applicant tracking systems differ by employer. The goal is a document that is clear for both software and a busy hiring team.

Set a 15-minute timer. Keep the job description open beside your résumé. Then work through the three passes below.

#block(fill: luma(244), inset: 12pt, radius: 4pt)[
  *The rule:* Never add a keyword, credential, title or result that you cannot explain truthfully in an interview. Clear evidence is more valuable than keyword volume.
]

= Pass 1: Make the document easy to read

Use one clean, application-ready version for online portals. Creative or design-led versions can still have a place in direct outreach, but do not make the recruiter or the software reconstruct your employment story.

#table(
  columns: (1.25fr, 2.1fr, 2.1fr),
  inset: 7pt,
  stroke: luma(210),
  table.header([*Check*], [*Keep*], [*Remove or reconsider*]),
  [Structure], [One main reading path; conventional headings such as Experience, Education and Skills], [Decorative section names that hide what the section contains],
  [Layout], [A single-column, text-first application version], [Information embedded in graphics, icons, text boxes or complex tables],
  [Typeface], [A common, legible font at a readable size], [Stylised fonts, tiny type or colour-dependent meaning],
  [Contact details], [Name, city/region, phone, email and LinkedIn in the main body], [Critical contact information only in a header or footer],
  [File], [The exact file type requested by the employer], [Assuming every portal treats a visual PDF the same way]
)

MIT Career Advising & Professional Development specifically cautions that graphics, text boxes and tables can be distorted or ignored by some résumé parsers; it also recommends testing whether the extracted text remains complete and in the right order. [1]

== The two-minute text test

Export your application file, then save or convert a copy to plain text. Read it from top to bottom. If a date, company, title, metric or contact detail disappears or appears in the wrong place, simplify the source document before applying.

= Pass 2: Match the role with evidence

Do not start by rewriting every line. Start by finding the role’s *decision language*. Read the job description once for the work itself, then a second time to highlight repeated items in these four groups:

#table(
  columns: (1.25fr, 3.8fr),
  inset: 7pt,
  stroke: luma(210),
  table.header([*Look for*], [*Examples of what to record*]),
  [Business mandate], [Growth, turnaround, transformation, cost discipline, market entry, operating model],
  [Functional scope], [P&L, board reporting, M&A integration, enterprise sales, product strategy, risk, data platform],
  [Leadership context], [Team size, cross-functional leadership, stakeholder groups, global remit, governance],
  [Tools and credentials], [Named systems, frameworks, sector terms, licences, certifications and methods]
)

Now map only the items you have actually done. LinkedIn’s career guidance advises using job-description language and showing important skills naturally in accomplishments, rather than relying on a disconnected skills list. [2]

== Turn responsibilities into evidence

Use this sentence pattern for each important bullet:

#block(fill: luma(244), inset: 12pt, radius: 4pt)[
  *Action + scope + decision language + measurable result* \
  Example: “Led a cross-functional pricing reset across three markets, aligning commercial and finance leaders and improving gross margin by 3.2 percentage points.”
]

Ask these questions about every bullet you keep:

- Does it begin with what *you* did, not only what the team was responsible for?
- Does it name the business context, platform, customer, geography or operating problem where relevant?
- Does it show a result, scale, decision or consequence that a senior reader can assess?
- Does its vocabulary match the target role truthfully and naturally?

Indeed recommends placing relevant terms in the summary, work experience, skills and education/training sections, and pairing keywords with action verbs and context. [3]

= Pass 3: Make the executive case in 30 seconds

An executive résumé is not a career autobiography. It is a concise argument for why your next scope is credible. Run this final scan from the top of page one.

#table(
  columns: (0.8fr, 3.1fr),
  inset: 7pt,
  stroke: luma(210),
  table.header([*Time*], [*What a reader should understand*]),
  [0–10 seconds], [Target role, sector or operating environment, leadership level and the strongest differentiator],
  [10–20 seconds], [The scale of your remit: people, revenue, budget, market, portfolio, programmes or transformation],
  [20–30 seconds], [Two or three credible outcomes that show how you create value]
)

If the answer is unclear, fix the opening summary before adding more content. Useful executive summaries are specific enough to be believable, but do not crowd the page with every skill you have ever used.

== Final submission checklist

Before uploading, confirm each item below.

#table(
  columns: (0.45fr, 4.45fr),
  inset: 7pt,
  stroke: luma(210),
  [☐], [I used the employer’s requested file format and named the file professionally.],
  [☐], [My contact details and dates appear in readable, selectable text.],
  [☐], [My target role and the most relevant business outcomes are visible on page one.],
  [☐], [I matched the job description only where my experience supports the language.],
  [☐], [I removed vague fillers such as “various,” “multiple” and “responsible for” when a specific fact is available.],
  [☐], [I checked the plain-text version for missing, duplicated or out-of-order content.],
  [☐], [I proofread names, dates, numbers, links and file title before submitting.]
)

= A reusable application log

Keep a simple record as you tailor each application. It prevents rushed rewrites and helps you see which positioning produces useful conversations.

#table(
  columns: (1.2fr, 3.8fr),
  inset: 7pt,
  stroke: luma(210),
  [Role and employer], [........................................................],
  [Date submitted], [........................................................],
  [Three role terms I can support], [........................................................],
  [Evidence bullets updated], [........................................................],
  [Referral or direct contact], [........................................................],
  [Follow-up date], [........................................................]
)

= Closing note

An ATS-friendly résumé is not a generic résumé. It is a clear, evidence-led version of your experience for a specific decision. Use the job description as a source of language, not as a script to copy. Then make it easy for the next reader—software or human—to understand the work you have actually done.

#block(fill: luma(244), inset: 12pt, radius: 4pt)[
  *Signal Weekly* delivers practical career intelligence for professionals and leaders in motion. Visit #link("https://www.signrl.com")[www.signrl.com] for weekly guidance on résumés, interviews and negotiation.
]

= References

[1] #link("https://capd.mit.edu/resources/make-your-resume-ats-friendly/")[MIT Career Advising & Professional Development, “Make your résumé ATS-friendly.”]

[2] #link("https://www.linkedin.com/top-content/career/resume-tips/resume-keywords-for-ats-and-recruiters/")[LinkedIn, “Resume Keywords for ATS and Recruiters.”]

[3] #link("https://www.indeed.com/career-advice/resumes-cover-letters/resume-keywords-and-phrases")[Indeed Career Guide, “How To Use Resume Keywords and Phrases.”]
