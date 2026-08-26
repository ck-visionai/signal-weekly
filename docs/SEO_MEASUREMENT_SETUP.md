# Career Weekly SEO and Measurement Setup

## Included now

Career Weekly includes descriptive page metadata, a canonical URL, Open Graph and Twitter preview tags, Career Weekly structured data, and a configurable measurement bootstrap. The site does not load Google Analytics or add a Search Console verification tag unless the corresponding environment value is present.

## Optional configuration

| Environment variable            | Purpose                                                                | Value format                                      |
| ------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------- |
| `VITE_GA4_MEASUREMENT_ID`       | Loads GA4 and records page-level events through the optional bootstrap | A GA4 Measurement ID beginning with `G-`          |
| `VITE_GOOGLE_SITE_VERIFICATION` | Adds the Google Search Console ownership meta tag                      | The verification token supplied by Search Console |

These values are intentionally unset until the owner chooses to connect the services. They are identifiers, not passwords, but should still be configured through the project’s environment/secrets interface rather than committed to source control.

## Recommended rollout

Create a GA4 web data stream for the production domain, copy its `G-` Measurement ID into `VITE_GA4_MEASUREMENT_ID`, and validate the realtime report after publishing. In Search Console, add the production domain property, prefer DNS verification when the domain is available, or use the supplied HTML meta token in `VITE_GOOGLE_SITE_VERIFICATION`. Submit the canonical production URL and sitemap when those are available.

For social distribution, use campaign-tagged links so channel performance remains comparable. Example links are:

- `https://www.signrl.com/?utm_source=linkedin&utm_medium=social&utm_campaign=career_weekly_launch`
- `https://www.signrl.com/?utm_source=facebook&utm_medium=social&utm_campaign=career_weekly_launch`
- `https://www.signrl.com/?utm_source=youtube&utm_medium=video&utm_campaign=career_weekly_launch`

The public CTA and signup fallback remain independent of GA4 and Search Console. Measurement can therefore be enabled later without changing the subscription flow.
