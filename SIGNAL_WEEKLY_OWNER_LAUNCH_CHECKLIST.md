# Signal Weekly: Owner Launch Checklist

This checklist covers the items that require access to your own business accounts. The website-controlled SEO files and metadata can be implemented in the codebase; these steps must be completed by you because they involve your Beehiiv, Porkbun and Google accounts.

## 1. Confirm the official address

Use **`https://www.signrl.com`** as the one address you place in Beehiiv, LinkedIn, PDFs, training invitations and email signatures. Keep HTTPS enabled in GitHub Pages. Do not remove the existing `signrl.com` DNS records while the current site is live.

## 2. Test the subscriber journey

Use a spare email address that has never subscribed before.

1. Open `https://www.signrl.com` in an incognito/private browser window.
2. Submit the Beehiiv form with the spare address.
3. Confirm the confirmation email arrives and its button works.
4. Confirm the welcome email arrives after confirmation.
5. Change every website button or text link inside Beehiiv to `https://www.signrl.com` if it currently uses an old address.
6. Confirm the Privacy Policy link on the website opens `https://www.signrl.com/privacy`.

Record the date, result and any issue in a simple document. This is your first launch test record.

## 3. Set up Google Search Console

1. Open [Google Search Console](https://search.google.com/search-console/) with the business Google account you will keep long term.
2. Add a **Domain property** for `signrl.com`.
3. Google will show a DNS verification record. In Porkbun, add that record exactly as supplied by Google.
4. Return to Search Console and click **Verify**.
5. Once the SEO update is live, submit `https://www.signrl.com/sitemap.xml` in **Indexing → Sitemaps**.
6. Use **URL Inspection** for the home page and `/privacy`, then select **Request indexing**.

## 4. Keep ownership portable

| Asset | Your next action |
|---|---|
| Domain | Keep Porkbun login, renewal method and recovery email under the business owner’s control. |
| Main live repository | Keep `https://github.com/ck-visionai/signrl` as the GitHub Pages source. |
| Clean private backup | Keep `https://github.com/ck-visionai/signrl-site` private as the future working-portal source backup. |
| Newsletter list | Keep Beehiiv account ownership and consent records under the business owner’s control. |
| Media files | Store original images, logos, PDFs and lead magnets in a separate cloud folder owned by the business. |
| Search and analytics | Keep the business Google account as an administrator in Search Console and your chosen analytics tool. |

## 5. Publish real reading materials

Do not publish placeholder resources. Start with one real PDF or article, such as the **Executive ATS Résumé Audit Checklist**. Give each resource a clear title, short description, author/editorial attribution, update date and one subscription call to action.

## 6. Before a future no-code portal switch

Keep the current GitHub Pages site live while a future Editor portal is built and tested privately. Only switch the `www` DNS record after the replacement has passed signup, download, mobile, SEO and Privacy Policy tests. Keep the original GitHub Pages record details for at least 30 days as a rollback option.
