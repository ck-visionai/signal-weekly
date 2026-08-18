/**
 * Signal Weekly / Executive Signal Desk
 * Contemporary editorial minimalism: warm ivory, graphite, Signal Cobalt, and paper briefing artifacts.
 */
import { useState } from "react";
import {
  ArrowRight,
  ArrowUpRight,
  Check,
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

const topicSlides = [
  {
    number: "01",
    eyebrow: "THE POSITIONING PROBLEM",
    title: "Your résumé is not a biography. It is a business case.",
    description:
      "Turn a nonlinear career into a clear executive narrative that a recruiter can understand in a first scan.",
    note: "The issue: translating scope into a signal.",
    icon: FileSearch,
  },
  {
    number: "02",
    eyebrow: "THE CONVERSATION PROBLEM",
    title: "Difficult questions are often invitations to lead.",
    description:
      "Prepare the executive-level answers that communicate judgment, self-awareness, and operating range under pressure.",
    note: "The issue: making a credible pivot in the room.",
    icon: MessageSquareText,
  },
  {
    number: "03",
    eyebrow: "THE DECISION PROBLEM",
    title: "Compensation is one part of a larger mandate.",
    description:
      "Negotiate salary, equity, scope, and the conditions that make the next role genuinely worth accepting.",
    note: "The issue: asking with precision, not apology.",
    icon: Target,
  },
];

const valueCards = [
  {
    index: "01",
    title: "Make the first scan count.",
    text: "Build an ATS-ready résumé that tells a recruiter what changed because you were in the room.",
    image: "/manus-storage/signal-resume-artifact_02fde95d.jpg",
    artifact: "resume",
    label: "RÉSUMÉ SIGNAL",
  },
  {
    index: "02",
    title: "Answer like a leader.",
    text: "Translate your experience into decisive stories for questions that are built to test your judgment.",
    image: null,
    artifact: "interview",
    label: "INTERVIEW PRACTICE",
  },
  {
    index: "03",
    title: "Negotiate the whole role.",
    text: "Frame a confident conversation about pay, benefits, scope, and the platform you need to do your best work.",
    image: null,
    artifact: "offer",
    label: "OFFER STRATEGY",
  },
];

function SignalMark({ inverse = false }: { inverse?: boolean }) {
  return (
    <img
      className={`signal-mark ${inverse ? "signal-mark--inverse" : ""}`}
      src="/manus-storage/signal-weekly-glyph_774af2b6.png"
      alt=""
      aria-hidden="true"
    />
  );
}

export default function Home() {
  const [email, setEmail] = useState("");
  const [signedUp, setSignedUp] = useState(false);
  const [activeSlide, setActiveSlide] = useState(0);
  const [menuOpen, setMenuOpen] = useState(false);

  const handleSubscribe = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    if (email.trim() && email.includes("@")) setSignedUp(true);
  };

  const slide = topicSlides[activeSlide];
  const TopicIcon = slide.icon;

  return (
    <div className="site-shell">
      <header className="topbar">
        <a className="brand" href="#top" aria-label="Signal Weekly home">
          <SignalMark />
          <span>Signal Weekly<span className="brand-dot">.</span></span>
        </a>

        <nav className={`nav-links ${menuOpen ? "nav-links--open" : ""}`} aria-label="Primary navigation">
          <a href="#inside" onClick={() => setMenuOpen(false)}>Inside the brief</a>
          <a href="#sample" onClick={() => setMenuOpen(false)}>Sample issue</a>
          <a href="#archive" onClick={() => setMenuOpen(false)}>Archive</a>
        </nav>

        <a className="topbar-cta" href="#subscribe">
          Get the briefing <ArrowUpRight size={15} strokeWidth={2.25} />
        </a>
        <button
          className="menu-button"
          aria-label={menuOpen ? "Close navigation" : "Open navigation"}
          aria-expanded={menuOpen}
          onClick={() => setMenuOpen((open) => !open)}
        >
          {menuOpen ? <X size={20} /> : <Menu size={20} />}
        </button>
      </header>

      <main id="top">
        <section className="hero-section" aria-labelledby="hero-title">
          <div className="hero-glow hero-glow--blue" />
          <div className="hero-glow hero-glow--peach" />
          <div className="hero-copy">
            <div className="eyebrow"><span className="eyebrow-line" />WEEKLY CAREER INTELLIGENCE</div>
            <h1 id="hero-title">A sharper search starts with a better <em>signal.</em></h1>
            <p className="hero-intro">
              One concise weekly briefing for mid-career and executive professionals navigating their next consequential move.
            </p>

            <form className="signup-form" id="subscribe" onSubmit={handleSubscribe}>
              {signedUp ? (
                <div className="signup-success" role="status">
                  <span><Check size={16} strokeWidth={3} /></span>
                  <div><strong>You’re on the list.</strong><br />Friday’s briefing will arrive in your inbox.</div>
                </div>
              ) : (
                <>
                  <label className="sr-only" htmlFor="email">Your work email</label>
                  <input
                    id="email"
                    type="email"
                    value={email}
                    onChange={(event) => setEmail(event.target.value)}
                    placeholder="Your work email"
                    required
                  />
                  <button type="submit">Send me Friday’s briefing <ArrowRight size={17} /></button>
                </>
              )}
            </form>
            <p className="form-note">Free, once a week. No noise. Unsubscribe whenever you need.</p>

            <div className="hero-meta">
              <div className="meta-capsule"><Sparkles size={15} /> New issue every Friday</div>
              <div className="meta-divider" />
              <span>For leaders in motion</span>
            </div>
          </div>

          <div className="hero-visual" aria-label="A Signal Weekly editorial desk scene">
            <div className="hero-image-frame">
              <img src="/manus-storage/signal-weekly-hero_0edf6640.jpg" alt="Elegant executive desk with layered papers and cobalt pen" />
              <div className="hero-image-wash" />
            </div>
            <article className="hero-issue-card">
              <div className="issue-card-topline"><span>ISSUE 014</span><span>06 MIN READ</span></div>
              <p className="issue-card-kicker">THIS WEEK’S SIGNAL</p>
              <h2>What an ATS actually sees before a human ever does.</h2>
              <div className="issue-card-footer"><span>Open the briefing</span><MoveUpRight size={16} /></div>
            </article>
            <aside className="lead-magnet-card">
              <span className="lead-magnet-icon"><FileSearch size={16} /></span>
              <div><strong>Bonus field guide</strong><span>The Executive Résumé Audit</span></div>
              <ArrowUpRight size={16} />
            </aside>
          </div>
        </section>

        <section className="quiet-statement" aria-label="Signal Weekly positioning">
          <div className="quiet-statement-line" />
          <p>Not another job board. <strong>A point of view on the decisions that change your career.</strong></p>
          <div className="quiet-statement-line" />
        </section>

        <section className="value-section" id="inside" aria-labelledby="inside-title">
          <div className="section-heading">
            <div>
              <div className="eyebrow"><span className="eyebrow-line" />INSIDE THE BRIEFING</div>
              <h2 id="inside-title">The search is complex.<br /><em>The guidance shouldn’t be.</em></h2>
            </div>
            <p>Every issue turns a high-stakes career moment into a small set of clear, usable moves.</p>
          </div>

          <div className="value-grid">
            {valueCards.map((card) => (
              <article className="value-card" key={card.index}>
                {card.image ? (
                  <div className="value-image-wrap"><img src={card.image} alt="" /></div>
                ) : (
                  <div className={`value-artifact value-artifact--${card.artifact}`} aria-hidden="true">
                    <div className="artifact-paper artifact-paper--one"><span /><span /><span /><span /></div>
                    <div className="artifact-paper artifact-paper--two"><span /><span /><span /></div>
                    <div className="artifact-index">{card.index}</div>
                  </div>
                )}
                <div className="value-card-body">
                  <div className="card-meta"><span>{card.label}</span><span>{card.index}</span></div>
                  <h3>{card.title}</h3>
                  <p>{card.text}</p>
                  <a href="#subscribe">Explore the signal <ArrowRight size={15} /></a>
                </div>
              </article>
            ))}
          </div>
        </section>

        <section className="sample-section" id="sample" aria-labelledby="sample-title">
          <div className="sample-backdrop" />
          <div className="sample-header">
            <div>
              <div className="eyebrow eyebrow--light"><span className="eyebrow-line" />FROM THE ARCHIVE</div>
              <h2 id="sample-title">A six-minute briefing.<br /><em>Built to stay with you.</em></h2>
            </div>
            <a className="text-link text-link--light" href="#archive">Browse sample issues <ArrowUpRight size={16} /></a>
          </div>

          <div className="sample-layout">
            <article className="main-brief">
              <div className="main-brief-header"><span>SIGNAL WEEKLY / 012</span><span>READING TIME 06:14</span></div>
              <div className="main-brief-copy">
                <p className="brief-label">THE INTERVIEW EDITION</p>
                <h3>When “why now?” is really asking whether you can lead change.</h3>
                <p>Three ways to make a career transition sound intentional, confident, and useful to the organisation across the table.</p>
              </div>
              <div className="brief-annotation"><span>01</span><p>THE REFRAME</p><ArrowUpRight size={18} /></div>
            </article>
            <div className="brief-side-stack">
              <article className="side-brief side-brief--top">
                <span className="side-brief-index">02</span>
                <p>COMPENSATION NOTE</p>
                <h3>The question to ask before you name a number.</h3>
                <ArrowUpRight size={18} />
              </article>
              <article className="side-brief side-brief--bottom">
                <span className="side-brief-index">03</span>
                <p>RÉSUMÉ NOTE</p>
                <h3>Where quantified outcomes actually earn their space.</h3>
                <ArrowUpRight size={18} />
              </article>
            </div>
          </div>
        </section>

        <section className="practice-section" aria-labelledby="practice-title">
          <div className="practice-label-block">
            <div className="eyebrow"><span className="eyebrow-line" />THE BRIEFING, IN PRACTICE</div>
            <p>Thoughtful prompts for the moments that deserve more than a template answer.</p>
          </div>
          <div className="topic-carousel">
            <div className="topic-count"><span>0{activeSlide + 1}</span><i /> <span>0{topicSlides.length}</span></div>
            <div className="topic-content" key={activeSlide}>
              <div className="topic-icon"><TopicIcon size={22} /></div>
              <p className="topic-eyebrow">{slide.eyebrow}</p>
              <h2 id="practice-title">{slide.title}</h2>
              <p className="topic-description">{slide.description}</p>
              <p className="topic-note"><span />{slide.note}</p>
            </div>
            <div className="carousel-controls">
              <button
                aria-label="Previous career topic"
                onClick={() => setActiveSlide((value) => (value - 1 + topicSlides.length) % topicSlides.length)}
              ><ChevronLeft size={20} /></button>
              <button
                aria-label="Next career topic"
                onClick={() => setActiveSlide((value) => (value + 1) % topicSlides.length)}
              ><ChevronRight size={20} /></button>
            </div>
          </div>
        </section>

        <section className="closing-section" aria-labelledby="closing-title">
          <div className="closing-layout">
            <div className="closing-artifact" aria-hidden="true">
              <div className="closing-artifact-top"><span>SIGNAL WEEKLY</span><span>FRIDAY / 08:00</span></div>
              <div className="closing-artifact-rule" />
              <p>CAREER<br />INTELLIGENCE<br /><em>BRIEFING.</em></p>
              <div className="closing-artifact-bottom"><span>EXECUTIVE EDITION</span><SignalMark /></div>
            </div>
            <div className="closing-copy">
              <div className="eyebrow"><span className="eyebrow-line" />YOUR FRIDAY DESK NOTE</div>
              <h2 id="closing-title">Make your next move<br /><em>with more signal.</em></h2>
              <p>Short, useful intelligence for the career decision in front of you.</p>
              <a className="closing-button" href="#subscribe">Get Signal Weekly <ArrowRight size={18} /></a>
              <div className="closing-meta"><span>NO COST</span><i /><span>ONE ISSUE / WEEK</span><i /><span>LEAVE ANYTIME</span></div>
            </div>
          </div>
        </section>
      </main>

      <footer className="footer" id="archive">
        <div className="footer-main">
          <a className="brand brand--footer" href="#top"><SignalMark inverse /><span>Signal Weekly<span className="brand-dot">.</span></span></a>
          <p>Useful intelligence for your next consequential career decision.</p>
        </div>
        <div className="footer-links">
          <div><p>EXPLORE</p><a href="#sample">Sample issues</a><a href="#inside">What you’ll get</a><a href="#subscribe">Subscribe</a></div>
          <div><p>ELSEWHERE</p><a href="https://www.linkedin.com" target="_blank" rel="noreferrer">LinkedIn <Linkedin size={13} /></a><a href="mailto:hello@signalweekly.co">Contact <ArrowUpRight size={13} /></a></div>
        </div>
        <div className="footer-bottom"><span>© 2026 SIGNAL WEEKLY</span><span>Made for career momentum</span><a href="#top">Back to top <ArrowUpRight size={13} /></a></div>
      </footer>
    </div>
  );
}
