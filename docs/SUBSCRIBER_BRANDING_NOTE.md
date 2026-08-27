# Subscriber Page Branding Note

The supplied subscriber-page screenshot shows a hosted subscription surface with the Career Weekly logo and tagline. It is separate from the Career Weekly React site and is therefore likely controlled by the email provider/publication branding settings rather than Privacy.tsx or the landing-page editor. A browser navigation to the Beehiiv dashboard in this session did not load a usable dashboard view, so no external branding change was submitted. The correct next action is to update the existing Beehiiv publication’s logo and description/tagline in its publication/subscription-page branding settings, then verify the hosted subscribe URL. Keep the site logo and structured content contract aligned with the same approved brand assets and tagline.

## 27 August 2026 verification

The live subscription URL is `https://signalweeklyhq.beehiiv.com/subscribe`, which redirects to the hosted signup modal. It currently displays the title `Career Weekly`, the tagline `Career intelligence for your next consequential move`, and a Beehiiv CDN-hosted publication logo. The tagline wraps to two lines at the observed viewport, so the one-line treatment must be configured in Beehiiv’s hosted page styling or by adjusting the hosted page layout/font size; it cannot be controlled by the Career Weekly React CSS. The Beehiiv admin publication-settings URL did not load a usable control surface in the current browser session, so no external change was submitted.

## Privacy layout verification

The Privacy subtitle now renders on a single line at the verified 1280px desktop viewport. At a 375px mobile viewport it wraps naturally within the available width, preventing horizontal overflow. The effective date remains 22 August 2026 and the Contact Us heading is unnumbered.
