# Signal Weekly: Launch, SEO and Portability Playbook

**Purpose:** This is the non-technical operating plan for taking Signal Weekly from its current live landing page to a discoverable, credible and transferable career-intelligence website. It is written for the owner of the business, not for a developer.

> **The core principle:** Keep `www.signrl.com` as the public address that readers learn and trust. Hosting can change behind that address later. If the public URLs stay the same, readers, links and search engines experience a much smoother transition.

## 1. What is already in place

Signal Weekly already has a polished public landing page, a Beehiiv subscribe form, a Privacy Policy, a GitHub repository, GitHub Pages deployment and the `signrl.com` domain. The public page has a title and a summary description, but it does not yet have a complete search-launch package such as a canonical URL, social-sharing metadata, `robots.txt`, an XML sitemap or structured data.

| Area | Current position | What remains before an SEO-ready launch |
|---|---|---|
| Public website | Live through GitHub Pages | Confirm one official public URL and complete SEO metadata. |
| Domain | `signrl.com` and `www.signrl.com` resolve to the site | Select one canonical address for all marketing and indexing. |
| Subscriber collection | Beehiiv embedded form is active | Test confirmation, welcome email, and the final website link in the email. |
| Privacy | `/privacy` page is available | Keep the business contact details current and have local legal advice review it when needed. |
| Code ownership | Source is in `ck-visionai/signrl` | Maintain a second clean repository and regular backups before any future portal migration. |
| Search readiness | Basic title and description exist | Add technical SEO files, submit the site to Search Console, and publish useful reading material. |

## 2. Choose one official website address

Use **`https://www.signrl.com`** as the address on LinkedIn, Beehiiv, documents, training registrations and marketing materials, if that is your preferred public name. The alternative address, `https://signrl.com`, should point visitors to the chosen version rather than serving an independent duplicate copy.

This choice matters because search engines need a clear signal about which version represents the official page. Google recommends choosing a preferred or canonical URL when the same material is available at multiple addresses. [1]

| Action | Owner | When |
|---|---|---|
| Confirm whether `www.signrl.com` is the official address | Business owner | Before public promotion |
| Ensure HTTPS is enforced | Business owner | Immediately |
| Use only the official address in Beehiiv, LinkedIn, PDFs and emails | Business owner | From launch onward |
| Set a canonical tag pointing to the official address | Developer / future editor build | Before Search Console submission |
| Configure the alternate address to redirect to the official address where the host supports it | Developer / hosting provider | Before or during launch |

> **Important:** Do not repeatedly switch between `www` and non-`www` addresses after launch. Pick one, use it consistently, and make technical changes only when necessary.

## 3. SEO launch checklist

SEO is not a one-time “rank first” switch. It helps search engines understand, crawl and show a useful, trustworthy page. Google states that useful, people-first content and clear technical access are more important than shortcuts or keyword stuffing. [1]

### A. Technical SEO work to complete once

The next website version should include these improvements. They can be applied to the current landing page first, then carried into the future editable portal.

| Item | Why it matters | What the finished result should be |
|---|---|---|
| Unique page title | Helps browsers and search results describe the page | `Signal Weekly | Career Intelligence for Mid-Career & Executive Professionals` |
| Unique meta description | Gives search engines a concise candidate summary | A natural 1–2 sentence explanation of ATS, interview and negotiation insight. |
| Canonical URL | Identifies the preferred public address | `https://www.signrl.com/` on the home page and `https://www.signrl.com/privacy` on the policy page. |
| Social preview data | Controls how LinkedIn and messaging platforms present shared links | Open Graph title, description and a 1200×630 preview image. |
| `robots.txt` | Lets crawlers discover indexing instructions and the sitemap | A public `/robots.txt` that allows the public pages and lists the sitemap. |
| XML sitemap | Gives search engines a list of preferred indexable URLs | A public `/sitemap.xml` containing only canonical public pages. |
| Structured data | Gives search engines machine-readable business and site context | Basic `Organization` and `WebSite` JSON-LD; add `Article` schema only for real published articles. |
| Image alternative text | Helps accessibility and search engines understand meaningful visuals | Short, descriptive alt text for every content image. |
| Fast mobile layout | Protects user experience for phone visitors | Tested signup, buttons and reading cards on a phone. |

For a small site, a manually maintained sitemap is acceptable. Google recommends posting it at the site root and using fully qualified canonical URLs; submitting a sitemap is a hint, not a guarantee of indexing. [2]

### B. Search Console setup

After the technical files are live, set up **Google Search Console**. This is free Google tooling for verifying that you own the domain and checking how Google sees the public pages.

1. Go to [Google Search Console](https://search.google.com/search-console/) while signed in to the business Google account you will retain long term.
2. Add a **Domain property** for `signrl.com`. Follow Google’s DNS-verification instruction; this normally adds a small verification record in Porkbun.
3. Verify the official `https://www.signrl.com` address as well if Google presents it separately.
4. Submit `https://www.signrl.com/sitemap.xml` in the **Sitemaps** section once the sitemap exists.
5. Use **URL Inspection** to request indexing of the home page and the Privacy Policy after the final launch.
6. Check once per week for the first month, then monthly, for indexing errors, mobile problems and search queries.

Search performance rarely changes immediately. Google advises allowing weeks to assess the effect of meaningful SEO work and does not guarantee that any individual page will be indexed or rank for a specific term. [1]

### C. Analytics and conversion measurement

Use a privacy-conscious analytics service to measure the actions that matter to the business. At minimum, track which channel sent the visitor, whether they reached the Beehiiv form, whether they submitted it, and which reading-material or future ATS/training link they selected.

| Metric | What it tells you | Initial target use |
|---|---|---|
| Website visitors | Whether people are arriving | Compare LinkedIn, Beehiiv, direct and referral traffic. |
| Signup-form starts and completions | Whether the page converts readers into subscribers | Improve headline, promise and form placement if completion is weak. |
| Welcome-email confirmation rate | Whether the double opt-in is working | Fix confusing copy or delivery problems. |
| Reading-material clicks | Which topics earn attention | Prioritise future articles and lead magnets. |
| ATS-link clicks | Interest in the future product | Decide when the product waitlist or release is justified. |
| Training-link clicks and registrations | Demand for live learning | Refine session topics and calls to action. |

Do not add analytics before updating the Privacy Policy and cookie/consent approach where your legal obligations require it. This playbook is operational guidance, not legal advice.

## 4. Content that earns search visibility and subscribers

The landing page should remain focused on subscription. To build organic discovery, add a small library of genuinely useful, original reading materials over time. Each item should solve one defined career decision rather than repeat generic advice.

| First content cluster | Example page or downloadable guide | Practical reader promise |
|---|---|---|
| ATS résumé strategy | `Executive ATS Résumé Audit Checklist` | Find the signals an ATS may miss before a recruiter sees the résumé. |
| Difficult interviews | `How Leaders Answer High-Stakes Interview Questions` | Prepare concise evidence-based answers for executive-level questions. |
| Salary and benefits negotiation | `Executive Offer Negotiation Preparation Sheet` | Plan salary, scope, benefits and decision questions before negotiating. |
| Career change | `The 30-Minute Leadership Search Brief` | Clarify the target role, value proposition and next steps. |

Every public resource should have a specific title, a short introduction, an author or editorial attribution, an accurate update date, descriptive images and a single next action. Avoid fabricated testimonials, invented results or claims that the newsletter cannot support.

## 5. Email and conversion launch checks

Before announcing the site widely, test the subscriber journey yourself using a fresh email address.

1. Open `https://www.signrl.com` on desktop and mobile.
2. Submit the Beehiiv form using the fresh test email.
3. Confirm that the double-opt-in message arrives and its link works.
4. Confirm the welcome email arrives after verification.
5. Replace any old website link in Beehiiv with the official `https://www.signrl.com` address.
6. Open the Privacy Policy from the signup area and footer.
7. Verify that unsubscribe language and the legal business details are accurate.
8. Record the result in a simple launch checklist with the date and person who tested it.

## 6. A 30-day practical launch sequence

| Timing | Owner task | Outcome |
|---|---|---|
| Week 1 | Complete canonical URL, title, social preview, `robots.txt`, sitemap and basic structured data | A crawlable, consistently branded public site. |
| Week 1 | Set up Search Console, submit the sitemap and test the first URLs | Search visibility monitoring begins. |
| Week 1 | Test Beehiiv confirmation and welcome journey end-to-end | Subscriber collection is verified. |
| Week 2 | Publish the first genuinely useful downloadable guide and a short supporting page | A concrete reason to subscribe and share. |
| Week 2 | Update LinkedIn profile, email signature and Beehiiv buttons to the official URL | Consistent public discovery signals. |
| Weeks 3–4 | Publish one focused reading material each week and share it in relevant professional channels | A repeatable editorial rhythm begins. |
| End of month | Review signups, top sources, Search Console coverage and popular topics | Decide what to improve next. |

## 7. Make the business portable, not locked in

No website can honestly promise “100% transferable” in every imaginable future situation. External services such as Beehiiv, a domain registrar, analytics and a host have their own account rules. However, Signal Weekly can be made **highly portable** by ensuring that the business owns the critical accounts, source files and exports.

| Asset | Owner should control it | Backup or export rule |
|---|---|---|
| Domain and DNS | Porkbun account controlled by the business owner | Export/screenshot DNS records and keep recovery details securely. |
| Source code | GitHub account controlled by the business owner | Keep `ck-visionai/signrl` and the future clean repository; download a ZIP before major changes. |
| Content | Business owner | Keep a plain Markdown or document copy of every article, guide and page. |
| Images and PDFs | Business owner | Store original files in an organised cloud folder independent of the website host. |
| Subscriber list | Beehiiv account controlled by the business owner | Export subscribers only in line with your privacy obligations and keep Beehiiv as the source of consent records. |
| Analytics and Search Console | A business-owned Google account | Keep at least one business owner with administrator access. |
| Privacy and legal records | Business owner | Keep dated source copies and review when operations or jurisdictions change. |
| Future editable portal data | Business owner | Require regular CSV/JSON/SQL content exports and a documented media-library export. |

## 8. Future working-portal migration: zero-downtime approach

The future working portal is the private, no-code Editor discussed earlier. The safer move is **not** to rebuild directly on the live domain. Build it privately first, then change only the hosting behind the same public address when it has passed testing.

### Stage A — Build privately

Create the editable portal on a temporary preview address such as `staging.signrl.com` or the host’s temporary address. Import the same public content, Beehiiv form, Privacy Policy, images and current URLs. Keep `www.signrl.com` on the current GitHub Pages site while testing.

The editor should include the following controls: site headline and introduction; reading materials; downloadable files; image alt text; ATS button destination and visibility; live-training title, date and registration URL; and footer/legal details. The administrator account must be private and protected by login.

### Stage B — Prove the portal before moving traffic

Use a written acceptance checklist. Test desktop and mobile pages, Beehiiv signup, file upload, file download, public links, hidden/unpublished content, Privacy Policy, page titles, social preview and editor login. Export a copy of all content and uploads before the final switch.

### Stage C — Preserve URLs whenever possible

Keep the public paths exactly the same, at minimum:

```text
https://www.signrl.com/
https://www.signrl.com/privacy
```

If the domain and page paths do not change, this is primarily a **hosting migration**, not a public URL migration. Readers and search engines continue using the same addresses. The new portal should still include the same canonical URLs, sitemap, analytics and Search Console verification.

### Stage D — Make the domain switch

When the new portal is ready, change the relevant Porkbun DNS record for `www` from the GitHub Pages target to the new hosting provider’s target. Do this during a quiet period, after lowering the DNS TTL if the provider recommends it. Do not delete the old GitHub Pages deployment yet.

Immediately test the home page, `/privacy`, signup form, assets, mobile layout, page title, sitemap and HTTPS certificate from a private/incognito browser window. Watch analytics, server logs and Search Console during the first days after the change.

### Stage E — Keep rollback available

Retain the prior GitHub Pages site and the old DNS record details until the new portal has been stable for at least 30 days. If the new portal has an outage, you can restore the previous DNS target. This is the practical rollback plan.

If URLs must change in the future, map every old page to its most relevant replacement and use direct permanent server-side redirects (HTTP 301 or 308) wherever the new host supports them. Google recommends preparing, testing and monitoring URL mappings, avoiding redirect chains, and retaining redirects for at least a year when moving public URLs. [3] [4]

> **Do not combine everything at once.** First move the host while keeping the same domain and URLs. Make a visual redesign, a CMS change or a new domain move separately. Google specifically advises changing one significant thing at a time during a site move. [3]

## 9. What you can do yourself and what to delegate

| Safe owner tasks | Delegate or use the future Editor for |
|---|---|
| Write reading-material titles, summaries and calls to action | DNS changes and canonical redirects |
| Upload approved PDFs and images through the Editor | SEO metadata, sitemap and structured-data setup |
| Set an ATS or training destination URL | Hosting migration and rollback planning |
| Test the subscription journey | Technical performance and security checks |
| Review Search Console and analytics summaries | Database export, data backup and new-host deployment |

## 10. Decision checkpoint

The immediate recommendation is to complete the **SEO launch package on the existing live site**, keep the GitHub Pages version as the stable public reference, and maintain the ownership backups listed above. Build the no-code Editor in a separate working portal only after the full-stack project path is available and it can be tested privately.

This sequence gives Signal Weekly a live, search-ready foundation now while protecting the option to evolve into an editable ATS-and-training platform later.

## References

[1] [Google Search Central — SEO Starter Guide](https://developers.google.com/search/docs/fundamentals/seo-starter-guide)

[2] [Google Search Central — Build and Submit a Sitemap](https://developers.google.com/search/docs/crawling-indexing/sitemaps/build-sitemap)

[3] [Google Search Central — How to Move a Site](https://developers.google.com/search/docs/crawling-indexing/site-move-with-url-changes)

[4] [Google Search Central — Redirects and Google Search](https://developers.google.com/search/docs/crawling-indexing/301-redirects)
