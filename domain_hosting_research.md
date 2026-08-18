# Domain and Hosting Research: Signal Weekly + Future ATS

Research checked 2026-08-18.

| Provider / layer | Verified capability | Implication for Signal Weekly |
| --- | --- | --- |
| Porkbun | Domain registration plus free DNS management; supports common records including A, CNAME, MX, TXT, and CAA | Suitable as a registrar and DNS home for connecting the current Signal Weekly site, Beehiiv sender verification, a future custom email domain, and later ATS subdomains. |
| Hostinger Web Apps Hosting | Separate web-application hosting service with GitHub deployment, Node.js runtime, managed MySQL, SSL, CDN, and backups | Useful only if the future ATS is intentionally deployed to Hostinger; it is not necessary to buy now just to register a domain or host the current site. |
| Current Signal Weekly site | Already published with managed hosting and custom-domain connection available in workspace settings | The simplest immediate route is to register only the domain, connect it to the current site, and keep GitHub as the code backup. |

Recommended domain pattern:

- `signalweekly.com` or `www.signalweekly.com`: public Signal Weekly landing page.
- `app.signalweekly.com` or `ats.signalweekly.com`: future authenticated ATS product.
- `newsletter.signalweekly.com` or `hello@signalweekly.com`: future branded newsletter/publication and email identity.

Official sources: https://porkbun.com/products/dns_management and https://www.hostinger.com/web-apps-hosting
