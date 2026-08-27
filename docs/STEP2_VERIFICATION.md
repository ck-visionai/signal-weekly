# Launch Step 2 Verification

## Verified 27 August 2026

The public Beehiiv subscription page at `https://careerweekly.beehiiv.com/subscribe` resolves to the Career Weekly hosted signup surface. The page title is `Home | Career Weekly`; it displays the Career Weekly publication name, the description `Career intelligence for your next consequential move`, the updated Signrl logo asset, and an email field with a Subscribe button.

No email address was entered and no subscription form was submitted. This confirms the signup boundary is present without triggering a subscriber record or email.

The published Career Weekly homepage at `https://careerwkly-o9unenra.manus.space/` exposes exactly one Beehiiv fallback destination: `https://careerweekly.beehiiv.com/subscribe`. No old `signalweeklyhq.beehiiv.com/subscribe` destination remains in the published homepage DOM.

The live homepage contains the GA4 script `https://www.googletagmanager.com/gtag/js?id=G-6WR14B2GZP`, the measurement marker `G-6WR14B2GZP`, and a data layer containing the `js` and `config` initialization entries with `anonymize_ip: true`.

## Boundary

This verification confirms page loading, branding, destination wiring, and analytics initialization. It does not confirm a real subscriber confirmation email or downstream GA4 event receipt, because those actions require entering personal information or waiting for an analytics hit. Those remain an owner-controlled test for the next launch step.

## Result

Step 2 page and tracking verification passed without submitting subscriber data.

## Step 3 guidance

1. Open `https://careerweekly.beehiiv.com/subscribe` in a normal browser window and submit a real email address that you control. This is an owner-controlled action because it creates a subscriber record and may send confirmation email.
2. Confirm the opt-in email arrives, complete the confirmation link, and verify that the subscriber appears in Beehiiv. If you do not want to use a personal address, create a dedicated test address first.
3. Open the live Career Weekly homepage in another tab, use the signup CTA, and complete one real test signup through the Beehiiv form. Do not repeat the test unnecessarily.
4. In Google Analytics, open **Reports → Realtime** and look for the Career Weekly web stream. Confirm that the page visit and the relevant signup interaction appear. Realtime reporting can take a short time to populate.
5. Record the test date, browser, result, and any Beehiiv confirmation outcome. Do not place the test email address in public documentation.

The production site is ready for this controlled owner test; no further code change is required for Step 2 verification.
