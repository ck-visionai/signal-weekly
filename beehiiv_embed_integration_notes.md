# Beehiiv Embed Integration Notes

Research checked 2026-08-18.

Beehiiv’s supported approach for an external landing page is an **embedded subscribe form**. The user creates and publishes the form in Beehiiv under **Subscribers → Subscribe forms**, then uses the generated single-script embed code on the external site. The embed handles email collection and sends signups into the Beehiiv audience, where the existing double-confirmation and welcome-email flow applies.

For Signal Weekly, create a new external embedded form named `Signal Weekly Landing Page`, choose the Slim layout, collect email only, use `Get the briefing` as the button label, keep consent text disabled in the slim layout, and configure a concise success message. After publishing it, Beehiiv exposes the exact embed script required for the website.

Official references: https://www.beehiiv.com/support/article/12977090590487-creating-an-embedded-subscribe-form and https://www.beehiiv.com/features/subscribe-forms

## Live verification

The external loader successfully fetched the form configuration and injected a `slim` iframe for form ID `d349b356-d05e-4f5d-9e54-24383c078aea` into the Signal Weekly hero. The embed container is present at the intended location and its iframe is sized to 47px tall. The iframe was verified directly and in the full landing-page preview: it visibly renders the `Enter your email` field and the `Get the briefing` button in the hero.
