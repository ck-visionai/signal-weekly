/**
 * Career Weekly / Executive Signal Desk
 * Privacy page uses the same warm-paper, graphite, and navy-to-ice editorial system as the landing page.
 */
import { ArrowLeft, ArrowUpRight } from "lucide-react";

const CAREER_SIGNAL_LOGO = "/manus-storage/career-signal-updated-mark-darknavy_2cf79fac.png";

const sections = [
  {
    title: "1. Overview",
    paragraphs: [
      "Career Weekly publishes practical career intelligence for mid-career and executive professionals. This Privacy Policy explains how we collect, use, disclose, and protect personal information when you visit the Career Weekly website, subscribe to the newsletter, or contact us.",
      "By using the website or subscribing, you acknowledge the practices described in this policy. If you do not agree with them, please do not provide personal information through the website.",
    ],
  },
  {
    title: "2. Information We Collect",
    paragraphs: [
      "When you subscribe to Career Weekly, we collect the email address you provide. If you contact us directly, we may collect your name, email address, and the contents of your message.",
      "Our website, hosting provider, and newsletter platform may also process limited technical information necessary to operate and protect their services, such as device or browser information, log data, IP address, and interaction data. If we introduce analytics, advertising pixels, additional forms, paid products, or new data-collection tools, we will update this policy before using them.",
    ],
  },
  {
    title: "3. How We Use Information",
    paragraphs: [
      "We use personal information to operate Career Weekly, confirm subscriptions, send the newsletter and related service messages, respond to requests, maintain security, understand and improve the publication, and comply with applicable legal obligations.",
      "We do not sell your personal information. We do not use your email address to send unrelated marketing communications.",
    ],
  },
  {
    title: "4. Editorial Research and Content Use",
    paragraphs: [
      "Career Weekly develops sample briefings from publicly available, licensed, or otherwise permitted sources, together with original editorial analysis and practical frameworks. Source citations are included where appropriate so readers can inspect the basis for the briefing.",
      "Subscriber information is not used to create individualized market or career research profiles. We use reasonable technical and organizational measures, including access controls and protected delivery routes where applicable, to reduce unauthorized access or redistribution of publication materials; no online system can guarantee complete prevention of misuse.",
    ],
  },
  {
    title: "5. Newsletter Subscription and Unsubscribe Choices",
    paragraphs: [
      "Career Weekly uses a double-confirmation process. After you submit an email address, you must confirm the subscription through the email we send before receiving the newsletter.",
      "You may unsubscribe at any time by using the unsubscribe link included in every Career Weekly email. You may also contact us at signalweeklyhq@gmail.com to request help with your subscription.",
    ],
  },
  {
    title: "6. Service Providers",
    paragraphs: [
      "We use carefully selected service providers to operate the website and newsletter. In particular, Beehiiv processes subscription information and delivers newsletter emails on our behalf. Our website hosting provider processes information needed to make the website available and secure.",
      "These providers may process personal information only as needed to provide their services, subject to their own contractual, security, and privacy practices.",
    ],
  },
  {
    title: "7. Data Retention",
    paragraphs: [
      "We retain subscriber information while your subscription remains active and for a reasonable period afterward when necessary for operational, legal, security, or record-keeping purposes. When you unsubscribe, we will stop sending marketing emails, although limited information may be retained to honour your unsubscribe request and meet legal obligations.",
    ],
  },
  {
    title: "8. Cookies, Analytics, and Similar Technologies",
    paragraphs: [
      "The Career Weekly website may use essential technologies required for its operation and security. If we use analytics, advertising cookies, or similar tracking technologies, we will describe the relevant tools and choices here and, where required, obtain consent before enabling them.",
    ],
  },
  {
    title: "9. Your Privacy Rights",
    paragraphs: [
      "Depending on where you live, you may have rights to request access to, correction of, deletion of, or restriction of the personal information we hold about you, or to object to certain processing. You may also have the right to withdraw consent where our processing is based on consent.",
      "To make a request, contact us at signalweeklyhq@gmail.com. We may need to verify your identity before responding. We will respond in accordance with applicable law.",
    ],
  },
  {
    title: "10. International Processing",
    paragraphs: [
      "Career Weekly and its service providers may process information in countries other than the country in which you live. Where information is transferred internationally, we will use reasonable safeguards required by applicable law.",
    ],
  },
  {
    title: "11. Children’s Privacy",
    paragraphs: [
      "Career Weekly is not directed to children, and we do not knowingly collect personal information from children. If you believe that a child has provided personal information to us, please contact us so that we can take appropriate steps.",
    ],
  },
  {
    title: "12. Changes to This Policy",
    paragraphs: [
      "We may update this Privacy Policy from time to time. We will post the updated version on this page and revise the effective date above. Material changes will take effect when the updated policy is posted unless otherwise stated.",
    ],
  },
];

export default function Privacy() {
  return (
    <div className="privacy-page">
      <header className="privacy-nav">
        <a className="privacy-brand" href="/" aria-label="Return to Career Weekly home">
          <span className="privacy-mark" aria-hidden="true"><img src={CAREER_SIGNAL_LOGO} alt="" /></span>
          Career Weekly
        </a>
        <a className="privacy-return" href="/"><ArrowLeft size={15} /> Back to the briefing</a>
      </header>

      <main className="privacy-main">
        <div className="privacy-eyebrow"><span /> LEGAL NOTE / 2026</div>
        <h1>Privacy, stated <em>plainly.</em></h1>
        <p className="privacy-lede">How Career Weekly handles the information you share when you subscribe or contact us.</p>

        <article className="privacy-article">
          <div className="privacy-meta"><span>PRIVACY POLICY</span><span>Effective 22 August 2026</span></div>
          {sections.map((section) => (
            <section className="privacy-section" key={section.title}>
              <h2>{section.title}</h2>
              {section.paragraphs.map((paragraph) => <p key={paragraph}>{paragraph}</p>)}
            </section>
          ))}

          <section className="privacy-section privacy-contact">
            <h2>Contact Us</h2>
            <p>For questions about this Privacy Policy or Career Weekly’s privacy practices, contact:</p>
            <address>
              <strong>Signrl</strong><br />
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
