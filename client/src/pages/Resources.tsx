/**
 * Signal Weekly / Executive Signal Desk Resources
 * Editorial resource-library page: warm paper, graphite document panels and Signal Cobalt actions.
 */
import { ArrowLeft, ArrowRight, ArrowUpRight, CheckCircle2, Clock3, Download, FileText, Sparkles } from "lucide-react";

const ATS_AUDIT_URL = "https://files.manuscdn.com/user_upload_by_module/session_file/310519663899346819/RHWORFZPTcCpUqFY.pdf";

function SignalMark({ inverse = false }: { inverse?: boolean }) {
  return (
    <img
      className={`signal-mark ${inverse ? "signal-mark--inverse" : ""}`}
      src="https://files.manuscdn.com/user_upload_by_module/session_file/310519663899346819/SqONCjkhpoZAPMjE.png"
      alt=""
      aria-hidden="true"
    />
  );
}

export default function Resources() {
  return (
    <div className="resources-page">
      <header className="resources-nav">
        <a className="brand" href="/" aria-label="Signal Weekly home">
          <SignalMark />
          <span className="brand-lockup"><strong className="brand-name">Signal Weekly</strong><small>A Signrl publication</small></span>
        </a>
        <a className="resources-nav-return" href="/">
          <ArrowLeft size={15} /> Back to the briefing
        </a>
      </header>

      <main>
        <section className="resources-hero" aria-labelledby="resources-title">
          <div className="resources-hero-copy">
            <div className="eyebrow"><span className="eyebrow-line" />THE SIGNAL WEEKLY LIBRARY</div>
            <h1 id="resources-title">Practical documents for a more deliberate <em>next move.</em></h1>
            <p>Short, useful guides for the career decisions that deserve more than generic advice. Start with the document in front of you, then build from there.</p>
          </div>
          <aside className="resources-index" aria-label="Resource library index">
            <span>RESOURCE LIBRARY</span>
            <strong>01</strong>
            <p>Published guides, tools and working notes for professionals and leaders in motion.</p>
          </aside>
        </section>

        <section className="resource-feature" aria-labelledby="ats-audit-title">
          <div className="resource-feature-document" aria-hidden="true">
            <div className="resource-document-topline"><span>SIGNAL WEEKLY / RESOURCE 001</span><span>PDF</span></div>
            <div className="resource-document-body">
              <p>CAREER INTELLIGENCE</p>
              <h2>The Executive<br />ATS Résumé<br /><em>Audit.</em></h2>
              <div className="resource-document-lines"><i /><i /><i /><i /></div>
            </div>
            <div className="resource-document-footer"><span>15-MINUTE CHECKLIST</span><span>01</span></div>
          </div>

          <div className="resource-feature-copy">
            <div className="resource-status"><Sparkles size={14} /> AVAILABLE NOW</div>
            <p className="resource-number">RESOURCE 001</p>
            <h2 id="ats-audit-title">The Executive ATS Résumé Audit</h2>
            <p className="resource-lede">A pre-submission checklist for making your real experience easier to read, search and verify—without turning your résumé into a keyword list.</p>
            <div className="resource-facts" aria-label="Guide details">
              <span><Clock3 size={15} /> 15-minute review</span>
              <span><FileText size={15} /> 6-page PDF</span>
              <span><CheckCircle2 size={15} /> Evidence-led guidance</span>
            </div>
            <ul className="resource-includes">
              <li>Make a portal-ready version that preserves the important text.</li>
              <li>Map role language to experience you can credibly explain.</li>
              <li>Use a 30-second executive scan and reusable application log.</li>
            </ul>
            <div className="resource-actions">
              <a className="resource-download" href={ATS_AUDIT_URL} target="_blank" rel="noreferrer">
                Download the free audit <Download size={17} />
              </a>
              <a className="resource-subscribe" href="/#subscribe">Get the weekly briefing <ArrowRight size={16} /></a>
            </div>
            <p className="resource-note">Educational guidance only. It cannot guarantee an interview or outcome.</p>
          </div>
        </section>

        <section className="resource-method" aria-labelledby="method-title">
          <div>
            <div className="eyebrow"><span className="eyebrow-line" />WHAT MAKES A SIGNAL WEEKLY RESOURCE</div>
            <h2 id="method-title">Less noise.<br /><em>More usable signal.</em></h2>
          </div>
          <div className="resource-method-list">
            <article><span>01</span><h3>Specific</h3><p>Each guide focuses on one high-stakes career moment rather than attempting to solve your whole search at once.</p></article>
            <article><span>02</span><h3>Evidence-led</h3><p>The practical advice is designed to help you make the strongest honest case for the work you have done.</p></article>
            <article><span>03</span><h3>Built to use</h3><p>Every resource includes a checklist, prompt or working tool you can return to before your next decision.</p></article>
          </div>
        </section>

        <section className="resource-next" aria-labelledby="next-title">
          <div>
            <p className="resource-number">THE NEXT FILES</p>
            <h2 id="next-title">The library will grow<br /><em>when a new decision deserves it.</em></h2>
          </div>
          <div className="resource-next-stack">
            <article><span>IN DEVELOPMENT</span><strong>Executive Interview<br />Preparation Brief</strong><small>Structured stories for difficult questions and consequential conversations.</small></article>
            <article><span>IN DEVELOPMENT</span><strong>The Whole-Role<br />Negotiation Map</strong><small>A framework for thinking beyond the headline number.</small></article>
          </div>
        </section>
      </main>

      <footer className="resources-footer">
        <div><a className="brand brand--footer" href="/"><SignalMark inverse /><span className="brand-lockup"><strong className="brand-name">Signal Weekly</strong><small>A Signrl publication</small></span></a><p>Useful intelligence for your next consequential career decision.</p></div>
        <div className="resources-footer-links"><a href="/">The briefing <ArrowUpRight size={13} /></a><a href="/privacy">Privacy Policy <ArrowUpRight size={13} /></a><a href="mailto:signalweeklyhq@gmail.com">Contact <ArrowUpRight size={13} /></a></div>
        <span>© 2026 SIGNAL WEEKLY</span>
      </footer>
    </div>
  );
}
