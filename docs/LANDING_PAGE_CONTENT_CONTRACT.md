# Career Weekly Landing-Page Content Contract

## Purpose

Career Weekly keeps reader-facing landing-page content in a versioned structured record rather than treating React source code as the editorial database. The public homepage reads the published record through the `siteContent` procedure and falls back to the approved repository defaults if the database is temporarily unavailable. The protected `/editor/landing` route edits the draft record; publishing copies the validated draft into the public record.

## Stable contract

The export identifier is `career-weekly.site-content.v1`. The top-level sections are `seo`, `identity`, `hero`, `quiet`, `navigation`, `inside`, `pillars`, `archive`, `practice`, `closing`, `resources`, `links`, and `footer`. Section names and field names are intended to remain stable across CMS migrations. Public links are stored as either site-relative paths or fully qualified HTTPS URLs, and the server validates the complete record before saving.

```json
{
  "schemaVersion": "career-weekly.site-content.v1",
  "contentKey": "signal-weekly-site",
  "exportedAt": "2026-08-27T00:00:00.000Z",
  "content": {
    "seo": {
      "title": "…",
      "description": "…",
      "canonicalUrl": "https://www.signrl.com/",
      "ogTitle": "…",
      "ogDescription": "…",
      "ogImage": "/manus-storage/…"
    }
  }
}
```

The abbreviated example above is illustrative; a real export always contains the complete validated `SiteContent` object, including all pillars, archive cards, practice slides, resources, links, and footer labels. It also includes a `media` array with each asset’s role, URL, optional alt text, and source field, so a CMS migration can inventory assets without parsing React components.

## Stable delivery endpoint

The published landing-page record is also available at `GET /api/content/landing-page`. The response contains `schemaVersion`, `contentKey`, and the complete published `content` object. The endpoint is intentionally read-only, same-origin, cacheable, and independent of the React component tree. A future portal can consume this endpoint during a phased migration, then replace it with an equivalent CMS delivery endpoint while preserving the same response contract.

## Editor and backend boundaries

| Capability | Current implementation | Migration implication |
| --- | --- | --- |
| Public read | `siteContent` public procedure and `GET /api/content/landing-page` | Replace with a CMS delivery API or static build importer; keep the response contract stable. |
| Draft read | `landingPage.editor` admin procedure | Map to the CMS editor or staging environment. |
| Draft save | `landingPage.saveDraft` admin mutation | Import as draft/version creation. |
| Publish | `landingPage.publish` admin mutation | Map to the CMS publish action/webhook. |
| Revisions | `landingPage.revisions` admin query plus append-only table; `landingPage.restoreRevision` creates a new draft revision | Import revision timestamps and authors where supported; restoration remains draft-only until explicitly published. |
| Export | `landingPage.export` admin query | Use as the migration seed and backup format; includes the media manifest. |
| Weekly editions | Separate `editions` and `editionSources` tables | Keep as a separate content domain; do not couple it to landing-page sections. |
| PDFs and images | Storage keys and public/signed URLs | Export original files and preserve stable asset paths where possible. |

## Recommended migration sequence

First, export the published landing-page JSON, draft JSON, revision metadata, edition records, source records, and a complete media manifest. Then create a field mapping in the new CMS using the stable section names above. Import the landing-page record into a staging environment, preserve `/`, `/privacy`, `/resources`, and PDF delivery paths, and compare the staging output with the current public site on desktop and mobile. Only after the acceptance checks pass should the public domain be pointed at the new platform.

The weekly publishing backend can remain in this project during a CMS migration. The future CMS needs to consume the public landing-page contract and may later take over landing-page publishing through an adapter. This separation avoids forcing a CMS migration to also rewrite edition scheduling, source auditing, protected PDF delivery, or the Friday release job.

## Important portability limits

The current export is a strong migration seed, not a universal one-click CMS import. A future CMS will still need a small adapter for authentication, draft/published status, revision history, media storage, and the delivery endpoint. The domain, public URL paths, original assets, PDF references, Beehiiv subscription link, and consent records remain external dependencies that must be transferred and retested separately.
