/**
 * Career Signal Weekly / Executive Signal Desk
 * Privacy page uses the same warm-paper, graphite, and refined-teal editorial system as the landing page.
 */
import { ArrowLeft, ArrowUpRight } from "lucide-react";

const sections = [
  {
    title: "1. Overview",
    paragraphs: [
      "Career Signal Weekly publishes practical career intelligence for mid-career and executive professionals. This Privacy Policy explains how we collect, use, disclose, and protect personal information when you visit the Career Signal Weekly website, subscribe to the newsletter, or contact us.",
      "By using the website or subscribing, you acknowledge the practices described in this policy. If you do not agree with them, please do not provide personal information through the website.",
    ],
  },
  {
    title: "2. Information We Collect",
    paragraphs: [
      "When you subscribe to Career Signal Weekly, we collect the email address you provide. If you contact us directly, we may collect your name, email address, and the contents of your message.",
      "Our website, hosting provider, and newsletter platform may also process limited technical information necessary to operate and protect their services, such as device or browser information, log data, IP address, and interaction data. If we introduce analytics, advertising pixels, additional forms, paid products, or new data-collection tools, we will update this policy before using them.",
    ],
  },
  {
    title: "3. How We Use Information",
    paragraphs: [
      "We use personal information to operate Career Signal Weekly, confirm subscriptions, send the newsletter and related service messages, respond to requests, maintain security, understand and improve the publication, and comply with applicable legal obligations.",
      "We do not sell your personal information. We do not use your email address to send unrelated marketing communications.",
    ],
  },
  {
    title: "4. Newsletter Subscription and Unsubscribe Choices",
    paragraphs: [
      "Career Signal Weekly uses a double-confirmation process. After you submit an email address, you must confirm the subscription through the email we send before receiving the newsletter.",
      "You may unsubscribe at any time by using the unsubscribe link included in every Career Signal Weekly email. You may also contact us at signalweeklyhq@gmail.com to request help with your subscription.",
    ],
  },
  {
    title: "5. Service Providers",
    paragraphs: [
      "We use carefully selected service providers to operate the website and newsletter. In particular, Beehiiv processes subscription information and delivers newsletter emails on our behalf. Our website hosting provider processes information needed to make the website available and secure.",
      "These providers may process personal information only as needed to provide their services, subject to their own contractual, security, and privacy practices.",
    ],
  },
  {
    title: "6. Data Retention",
    paragraphs: [
      "We retain subscriber information while your subscription remains active and for a reasonable period afterward when necessary for operational, legal, security, or record-keeping purposes. When you unsubscribe, we will stop sending marketing emails, although limited information may be retained to honour your unsubscribe request and meet legal obligations.",
    ],
  },
  {
    title: "7. Cookies, Analytics, and Similar Technologies",
    paragraphs: [
      "The Career Signal Weekly website may use essential technologies required for its operation and security. If we use analytics, advertising cookies, or similar tracking technologies, we will describe the relevant tools and choices here and, where required, obtain consent before enabling them.",
    ],
  },
  {
    title: "8. Your Privacy Rights",
    paragraphs: [
      "Depending on where you live, you may have rights to request access to, correction of, deletion of, or restriction of the personal information we hold about you, or to object to certain processing. You may also have the right to withdraw consent where our processing is based on consent.",
      "To make a request, contact us at signalweeklyhq@gmail.com. We may need to verify your identity before responding. We will respond in accordance with applicable law.",
    ],
  },
  {
    title: "9. International Processing",
    paragraphs: [
      "Career Signal Weekly and its service providers may process information in countries other than the country in which you live. Where information is transferred internationally, we will use reasonable safeguards required by applicable law.",
    ],
  },
  {
    title: "10. Children’s Privacy",
    paragraphs: [
      "Career Signal Weekly is not directed to children, and we do not knowingly collect personal information from children. If you believe that a child has provided personal information to us, please contact us so that we can take appropriate steps.",
    ],
  },
  {
    title: "11. Changes to This Policy",
    paragraphs: [
      "We may update this Privacy Policy from time to time. We will post the updated version on this page and revise the effective date above. Material changes will take effect when the updated policy is posted unless otherwise stated.",
    ],
  },
];

export default function Privacy() {
  return (
    <div className="privacy-page">
      <header className="privacy-nav">
        <a className="privacy-brand" href="/" aria-label="Return to Career Signal Weekly home">
          <span className="privacy-mark" aria-hidden="true"><i /><i /><i /></span>
          Career Signal Weekly
        </a>
        <a className="privacy-return" href="/"><ArrowLeft size={15} /> Back to the briefing</a>
      </header>

      <main className="privacy-main">
        <div className="privacy-eyebrow"><span /> LEGAL NOTE / 2026</div>
        <h1>Privacy, stated <em>plainly.</em></h1>
        <p className="privacy-lede">How Career Signal Weekly handles the information you share when you subscribe or contact us.</p>

        <article className="privacy-article">
          <div className="privacy-meta"><span>PRIVACY POLICY</span><span>Effective 18 August 2026</span></div>
          <dl className="privacy-details">
            <div><dt>OPERATOR</dt><dd>Shortlizt LLC</dd></div>
            <div><dt>CONTACT</dt><dd><a href="mailto:signalweeklyhq@gmail.com">signalweeklyhq@gmail.com</a></dd></div>
            <div><dt>MAILING ADDRESS</dt><dd>60 Paya Lebar Rd, Paya Lebar Square, Singapore 409051</dd></div>
          </dl>

          {sections.map((section) => (
            <section className="privacy-section" key={section.title}>
              <h2>{section.title}</h2>
              {section.paragraphs.map((paragraph) => <p key={paragraph}>{paragraph}</p>)}
            </section>
          ))}

          <section className="privacy-section privacy-contact">
            <h2>12. Contact Us</h2>
            <p>For questions about this Privacy Policy or Career Signal Weekly’s privacy practices, contact:</p>
            <address>
              <strong>Shortlizt LLC</strong><br />
              60 Paya Lebar Rd, Paya Lebar Square, Singapore 409051<br />
              <a href="mailto:signalweeklyhq@gmail.com">signalweeklyhq@gmail.com</a>
            </address>
          </section>

          <a className="privacy-beehiiv" href="https://www.beehiiv.com/privacy" target="_blank" rel="noreferrer">
            Read Beehiiv’s Privacy Policy <ArrowUpRight size={15} />
          </a>
        </article>
      </main>
    </div>
  );
}
