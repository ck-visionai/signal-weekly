/**
 * Career Weekly / Executive Signal Desk
 * Contemporary editorial minimalism: warm ivory, graphite, refined teal, and paper briefing artifacts.
 */
import { useAuth } from "@/_core/hooks/useAuth";
import { type MouseEvent, useEffect, useRef, useState } from "react";
import {
  ArrowDown,
  ArrowRight,
  ArrowUp,
  ArrowUpRight,
  ChevronLeft,
  ChevronRight,
  FileSearch,
  Linkedin,
  MessageSquareText,
  Menu,
  MoveUpRight,
  Sparkles,
  Target,
  X,
} from "lucide-react";
import { defaultSiteContent } from "@shared/siteContent";
import { sampleIssues } from "@shared/sampleIssues";

const CAREER_SIGNAL_LOGO =
  "/manus-storage/career-signal-updated-mark-darknavy_2cf79fac.png";
const OFFER_STRATEGY_IMAGE =
  "/manus-storage/career-signal-offer-brief_0ee33e08.jpg";

function SignalMark({ inverse = false }: { inverse?: boolean }) {
  return (
    <span
      className={`signal-logo-wrap ${inverse ? "signal-logo-wrap--on-dark" : ""}`}
      aria-hidden="true"
    >
      <img className="signal-logo" src={CAREER_SIGNAL_LOGO} alt="" />
    </span>
  );
}

export default function Home() {
  // The useAuth hook provides authentication state.
  // To implement login/logout, call logout(), or start login from an event
  // handler: onClick={() => startLogin()} (imported from "@/const"). Never call
  // startLogin() during render (no href={startLogin()}) — it mints a one-time
  // nonce cookie and must run only at the moment of navigation.
  let { user, loading, error, isAuthenticated, logout } = useAuth();

  // Static WebDev uses the repository’s editorial defaults as the published content source.
  const content = defaultSiteContent;
  const [activeSlide, setActiveSlide] = useState(0);
  const [menuOpen, setMenuOpen] = useState(false);
  const beehiivEmbedRef = useRef<HTMLDivElement>(null);
  const topicIcons = [FileSearch, MessageSquareText, Target];
  const topicSlides = content.practice.slides.map((slide, index) => ({
    ...slide,
    number: String(index + 1).padStart(2, "0"),
    icon: topicIcons[index],
  }));
  const valueCards = content.pillars.map((pillar, index) => ({
    ...pillar,
    image: pillar.imageUrl || (index === 2 ? OFFER_STRATEGY_IMAGE : null),
    artifact: ["resume", "interview", "offer"][index],
    ctaLabel:
      pillar.ctaLabel ||
      [
        "Explore the résumé briefing",
        "Explore interview practice",
        "Explore offer strategy",
      ][index],
    ctaUrl: pillar.ctaUrl || "/resources#sample-issues",
  }));

  useEffect(() => {
    const container = beehiivEmbedRef.current;
    if (!container) return;
    container.dataset.expectedSubmitLabel = content.navigation.subscribeLabel;
    return () => {
      delete container.dataset.expectedSubmitLabel;
    };
  }, []);

  const slide = topicSlides[activeSlide];
  const TopicIcon = slide.icon;

  const scrollToSignup = (event: MouseEvent<HTMLAnchorElement>) => {
    event.preventDefault();
    setMenuOpen(false);
    window.requestAnimationFrame(() => {
      const signupTarget =
        document.getElementById("subscribe") ?? beehiivEmbedRef.current;
      signupTarget?.scrollIntoView({ behavior: "smooth", block: "center" });
      window.history.replaceState(null, "", "#subscribe");
    });
  };

  return (
    <div className="site-shell">
      <header className="topbar">
        <a className="brand" href="#top" aria-label="Career Weekly home">
          <SignalMark />
          <span className="brand-lockup">
            <strong className="brand-name">{content.identity.brandName}</strong>
            <small>{content.identity.endorsement}</small>
          </span>
        </a>

        <nav
          className={`nav-links ${menuOpen ? "nav-links--open" : ""}`}
          aria-label="Primary navigation"
        >
          <a href="#inside" onClick={() => setMenuOpen(false)}>
            {content.navigation.insideLabel}
          </a>
          <a href="#sample" onClick={() => setMenuOpen(false)}>
            {content.navigation.sampleLabel}
          </a>
          <a href="/resources" onClick={() => setMenuOpen(false)}>
            {content.navigation.resourcesLabel}
          </a>
        </nav>

        <a className="topbar-cta" href="#subscribe" onClick={scrollToSignup}>
          {content.navigation.subscribeLabel}{" "}
          <ArrowUpRight size={15} strokeWidth={2.25} />
        </a>
        <button
          className="menu-button"
          aria-label={menuOpen ? "Close navigation" : "Open navigation"}
          aria-expanded={menuOpen}
          onClick={() => setMenuOpen(open => !open)}
        >
          {menuOpen ? <X size={20} /> : <Menu size={20} />}
        </button>
      </header>

      <main id="top">
        <section className="hero-section" aria-labelledby="hero-title">
          <div className="hero-glow hero-glow--blue" />
          <div className="hero-glow hero-glow--peach" />
          <div className="hero-copy">
            <div className="eyebrow">
              <span className="eyebrow-line" />
              {content.hero.eyebrow}
            </div>
            <h1 id="hero-title">
              {content.hero.headline} <em>{content.hero.emphasis}</em>
            </h1>
            <p className="hero-intro">{content.hero.intro}</p>

            <div
              className="beehiiv-embed"
              id="subscribe"
              ref={beehiivEmbedRef}
              aria-label="Subscribe to Career Weekly"
              data-signup-provider="beehiiv"
            >
              <a
                className="beehiiv-embed__fallback"
                href="https://signalweeklyhq.beehiiv.com/subscribe"
                data-submit-label={content.navigation.subscribeLabel}
              >
                {content.navigation.fallbackSubscribeLabel}
              </a>
            </div>
            <p className="form-note">
              {content.hero.formNote}{" "}
              <a href="/privacy">{content.hero.formPrivacyLinkLabel}</a>
            </p>

            <div className="hero-meta">
              <div className="meta-capsule">
                <Sparkles size={15} /> {content.hero.frequency}
              </div>
              <div className="meta-divider" />
              <span>{content.hero.audience}</span>
            </div>
          </div>

          <div className="hero-visual" aria-label={content.hero.imageAlt}>
            <div className="hero-image-frame">
              <img src={content.hero.imageUrl} alt={content.hero.imageAlt} />
              <div className="hero-image-wash" />
            </div>
            <a
              className="hero-issue-card"
              href={sampleIssues[0].completeUrl}
              target="_blank"
              rel="noreferrer"
              aria-label="Read the complete Evidence Before Adjectives working page"
            >
              <div className="issue-card-topline">
                <span>{content.hero.issueNumber}</span>
                <span>{content.hero.issueReadTime}</span>
              </div>
              <p className="issue-card-kicker">{content.hero.issueKicker}</p>
              <h2>{content.hero.issueTitle}</h2>
              <div className="issue-card-footer">
                <span>{content.hero.issueOpenLabel}</span>
                <MoveUpRight size={16} />
              </div>
            </a>
          </div>
        </section>

        <section className="faq-section" aria-labelledby="faq-title">
          <div className="faq-intro">
            <div className="eyebrow">
              <span className="eyebrow-line" />
              CLEAR ANSWERS
            </div>
            <h2 id="faq-title">Career guidance for the decision in front of you.</h2>
          </div>
          <div className="faq-grid">
            <article>
              <h3>What is Career Weekly?</h3>
              <p>Career Weekly is a complimentary Friday briefing for working professionals who want clearer evidence and better judgment around consequential career decisions.</p>
            </article>
            <article>
              <h3>What does each briefing cover?</h3>
              <p>Each briefing focuses on a practical career situation, such as résumé positioning, executive interviews, role negotiation, or evaluating a new opportunity.</p>
            </article>
            <article>
              <h3>Who is Career Weekly for?</h3>
              <p>It is designed for mid-career and executive professionals who want useful context, examples, and working prompts rather than generic career advice.</p>
            </article>
          </div>
        </section>

        <section
          className="quiet-statement"
          aria-label="Career Weekly positioning"
        >
          <div className="quiet-statement-line" />
          <p>
            {content.quiet.prefix} <strong>{content.quiet.emphasis}</strong>
          </p>
          <div className="quiet-statement-line" />
        </section>

        <section
          className="value-section"
          id="inside"
          aria-labelledby="inside-title"
        >
          <div className="section-heading">
            <div>
              <div className="eyebrow">
                <span className="eyebrow-line" />
                {content.inside.eyebrow}
              </div>
              <h2 id="inside-title">
                {content.inside.heading}
                <br />
                <em>{content.inside.emphasis}</em>
              </h2>
            </div>
            <p>{content.inside.intro}</p>
          </div>

          <div className="value-grid">
            {valueCards.map(card => (
              <article className="value-card" key={card.index}>
                {card.image ? (
                  <div className="value-image-wrap">
                    <img src={card.image} alt="" />
                  </div>
                ) : (
                  <div
                    className={`value-artifact value-artifact--${card.artifact}`}
                    aria-hidden="true"
                  >
                    <div className="artifact-paper artifact-paper--one">
                      <span />
                      <span />
                      <span />
                      <span />
                    </div>
                    <div className="artifact-paper artifact-paper--two">
                      <span />
                      <span />
                      <span />
                    </div>
                    <div className="artifact-index">{card.index}</div>
                  </div>
                )}
                <div className="value-card-body">
                  <div className="card-meta">
                    <span>
                      <i className="card-signal" />
                      {card.label}
                    </span>
                    <span>{card.index}</span>
                  </div>
                  <h3>{card.title}</h3>
                  <p>{card.text}</p>
                  <a href={card.ctaUrl}>
                    {card.ctaLabel} <ArrowRight size={15} />
                  </a>
                </div>
              </article>
            ))}
          </div>
        </section>

        <section
          className="sample-section"
          id="sample"
          aria-labelledby="sample-title"
        >
          <div className="sample-backdrop" />
          <div className="sample-header">
            <div>
              <div className="eyebrow eyebrow--light">
                <span className="eyebrow-line" />
                {content.archive.eyebrow}
              </div>
              <h2 id="sample-title">
                {content.archive.heading}
                <br />
                <em>{content.archive.emphasis}</em>
              </h2>
            </div>
            <a
              className="text-link text-link--light"
              href="/resources#sample-issues"
            >
              {content.navigation.browseArchiveLabel} <ArrowUpRight size={16} />
            </a>
          </div>

          <p className="archive-welcome">{content.archive.welcome}</p>
          <div className="sample-layout">
            <a
              className="main-brief"
              href="/resources#sample-issues"
              aria-label="Open the Career Evidence Working Page in Resources"
            >
              <div className="main-brief-header">
                <span>{content.archive.leadNumber}</span>
                <span>{content.archive.readingTime}</span>
              </div>
              <div className="main-brief-copy">
                <p className="brief-label">{content.archive.leadLabel}</p>
                <h3>{content.archive.leadTitle}</h3>
                <p>{content.archive.leadDescription}</p>
              </div>
              <div className="brief-annotation">
                <span>01</span>
                <p>{content.archive.annotationLabel}</p>
                <ArrowUpRight size={18} />
              </div>
            </a>
            <div className="brief-side-stack">
              <a
                className="side-brief side-brief--top"
                href="/resources#sample-issues"
                aria-label="Open The ATS Translation Layer in Resources"
              >
                <span className="side-brief-index">02</span>
                <p>{content.archive.sideBriefs[0].label}</p>
                <h3>{content.archive.sideBriefs[0].title}</h3>
                <ArrowUpRight size={18} />
              </a>
              <a
                className="side-brief side-brief--bottom"
                href="/resources#sample-issues"
                aria-label="Open Your Three-Story Interview Bank in Resources"
              >
                <span className="side-brief-index">03</span>
                <p>{content.archive.sideBriefs[1].label}</p>
                <h3>{content.archive.sideBriefs[1].title}</h3>
                <ArrowUpRight size={18} />
              </a>
            </div>
          </div>
        </section>

        <section className="practice-section" aria-labelledby="practice-title">
          <div className="practice-label-block">
            <div className="eyebrow">
              <span className="eyebrow-line" />
              {content.practice.eyebrow}
            </div>
            <p>{content.practice.intro}</p>
            <div
              className="practice-path"
              aria-label="Choose a career decision to explore"
            >
              <span className="practice-path-kicker">
                CHOOSE A DECISION TO EXPLORE
              </span>
              {topicSlides.map((topic, index) => (
                <button
                  className={
                    index === activeSlide
                      ? "practice-path-item practice-path-item--active"
                      : "practice-path-item"
                  }
                  key={topic.eyebrow}
                  type="button"
                  onClick={() => setActiveSlide(index)}
                  aria-pressed={index === activeSlide}
                >
                  <span>{topic.number}</span>
                  <strong>{topic.eyebrow.replace("THE ", "")}</strong>
                  <ArrowRight size={14} />
                </button>
              ))}
            </div>
          </div>
          <div className="topic-carousel">
            <div className="topic-count">
              <span>0{activeSlide + 1}</span>
              <i /> <span>0{topicSlides.length}</span>
            </div>
            <div className="topic-content" key={activeSlide}>
              <div className="topic-icon">
                <TopicIcon size={22} />
              </div>
              <p className="topic-eyebrow">{slide.eyebrow}</p>
              <h2 id="practice-title">{slide.title}</h2>
              <p className="topic-description">{slide.description}</p>
              <p className="topic-note">
                <span />
                {slide.note}
              </p>
            </div>
            <div className="carousel-controls">
              <button
                aria-label="Previous career topic"
                onClick={() =>
                  setActiveSlide(
                    value =>
                      (value - 1 + topicSlides.length) % topicSlides.length
                  )
                }
              >
                <ChevronLeft size={20} />
              </button>
              <button
                aria-label="Next career topic"
                onClick={() =>
                  setActiveSlide(value => (value + 1) % topicSlides.length)
                }
              >
                <ChevronRight size={20} />
              </button>
            </div>
          </div>
        </section>

        <section className="closing-section" aria-labelledby="closing-title">
          <div className="closing-layout">
            <div className="closing-brief-panel" aria-hidden="true">
              <div className="closing-brief-top">
                <span>YOUR FRIDAY CAREER BRIEF</span>
                <SignalMark inverse />
              </div>
              <div className="closing-brief-rule" />
              <div className="closing-signals">
                <div>
                  <span>01</span>
                  <strong>Positioning</strong>
                  <small>Make the fit clear.</small>
                </div>
                <div>
                  <span>02</span>
                  <strong>Interview</strong>
                  <small>Make judgement visible.</small>
                </div>
                <div>
                  <span>03</span>
                  <strong>Offer</strong>
                  <small>Protect the value.</small>
                </div>
              </div>
              <p>
                ONE USEFUL MOVE
                <br />
                EACH FRIDAY.
              </p>
              <div className="closing-brief-bottom">
                <span>CAREER WEEKLY</span>
                <span>WEEKLY BRIEF</span>
              </div>
            </div>
            <div className="closing-copy">
              <div className="eyebrow">
                <span className="eyebrow-line" />
                {content.closing.eyebrow}
              </div>
              <h2 id="closing-title">
                {content.closing.heading}
                <br />
                <em>{content.closing.emphasis}</em>
              </h2>
              <p>{content.closing.description}</p>
              <a
                className="closing-button"
                href="#subscribe"
                onClick={scrollToSignup}
              >
                {content.closing.ctaLabel} <ArrowRight size={18} />
              </a>
              <div className="closing-meta">
                <span>{content.closing.metaItems[0]}</span>
                <i />
                <span>{content.closing.metaItems[1]}</span>
                <i />
                <span>{content.closing.metaItems[2]}</span>
              </div>
            </div>
          </div>
        </section>


      </main>

      <footer className="footer" id="archive">
        <div className="footer-main">
          <a className="brand brand--footer" href="#top">
            <SignalMark inverse />
            <span className="brand-lockup">
              <strong className="brand-name">
                {content.identity.brandName}
              </strong>
              <small>{content.identity.endorsement}</small>
            </span>
          </a>
          <p>{content.identity.footerTagline}</p>
        </div>
        <div className="footer-links">
          <div>
            <p>{content.footer.exploreLabel}</p>
            <a href="/resources">
              {content.navigation.resourcesLabel} <ArrowRight size={13} />
            </a>
            {content.links.liveTrainingUrl ? (
              <a
                href={content.links.liveTrainingUrl}
                target="_blank"
                rel="noreferrer"
              >
                {content.footer.liveTrainingLabel} <ArrowUpRight size={13} />
              </a>
            ) : null}
          </div>
          <div>
            <p>{content.footer.elsewhereLabel}</p>
            <a
              href={content.links.linkedinUrl}
              target="_blank"
              rel="noreferrer"
            >
              {content.footer.linkedinLinkLabel} <Linkedin size={13} />
            </a>
            <a href={`mailto:${content.identity.contactEmail}`}>
              {content.footer.contactLinkLabel} <ArrowUpRight size={13} />
            </a>
          </div>
          <div>
            <p>{content.footer.legalLabel}</p>
            <a href="/privacy">
              {content.footer.privacyLinkLabel} <ArrowRight size={13} />
            </a>
          </div>
        </div>
        <div className="footer-bottom">
          <span>{content.identity.copyrightLabel}</span>
          <span>{content.identity.footerMeta}</span>
          <a href="#top">
            {content.footer.backToTopLabel} <ArrowUp size={13} />
          </a>
        </div>
      </footer>
    </div>
  );
}
