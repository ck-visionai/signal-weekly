# Career Weekly Launch Handover

## Verified live

Career Weekly is live at `https://careerwkly-o9unenra.manus.space`. The homepage loads the approved Career Weekly branding, the Clear Answers section appears directly below the hero, the public sitemap is available, and the verified Search Console property reports `https://www.signrl.com/sitemap.xml` with status **Success** (last read 26 Aug 2026; 3 discovered pages).

The GA4 Measurement ID `G-6WR14B2GZP` is configured. A production browser check confirmed the live document initializes `window.dataLayer`, creates `gtag`, queues the GA4 config call with the correct ID, and loads the Google tag script. The early HTML bootstrap is intentionally idempotent with the React analytics hook.

## Friday release schedule

The enabled project-owned Heartbeat job is:

| Field | Value |
| --- | --- |
| Name | `career-weekly-friday-release` |
| Cron | `0 0 8 * * 5` (Friday, 08:00 UTC) |
| Callback | `POST /api/scheduled/release-friday-edition` |
| Task UID | `A5WgNEPraj6WZhYGWDGobW` |
| Status | Enabled |

There are currently no recorded runs because the next scheduled trigger has not occurred. A non-destructive live callback smoke test returned HTTP 403 for an unauthenticated request, confirming the endpoint is reachable and correctly protected against non-Heartbeat callers without publishing an edition. A true platform-authenticated trigger still needs to be observed through the first scheduled run or the Management UI’s Run Now action.

## Beehiiv onboarding

The existing publication is renamed to **Career Weekly**. Beehiiv currently shows Automations as included for exploration during the Max trial but states that publishing and activating an automation requires the **Scale or Max plan**. Therefore the two-touchpoint sequence is documented but cannot be activated on the current free-capability path without a plan decision. The no-cost fallback is to send two regular newsletters per week manually: a welcome/start-here message with Edition 01 and one curated catch-up recommendation, followed by the normal Friday briefing.

## Deferred product policy

The public archive remains preview-first. Edition 01 is the only openly downloadable full edition. Future full editions remain delivered through the weekly email until a later decision enables one-at-a-time email-gated Subscriber Archive Access after the archive reaches meaningful scale.

## Next owner actions

1. Keep the first Friday run under observation and confirm a successful release transition in the schedule history.
2. In Beehiiv, either keep the documented manual two-touchpoint cadence on the free-capability path or choose Scale/Max before activating an automation. Do not activate or send anything without reviewing the draft emails.
3. Optionally bind `www.signrl.com` as the primary production domain and update canonical/OG URLs if that becomes the public launch URL.
