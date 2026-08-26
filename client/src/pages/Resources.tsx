/**
 * Career Signal / Executive Signal Desk Resources
 * Editorial resource-library page: warm paper, graphite document panels and navy-to-ice actions.
 */
import { useEffect } from "react";
import { ArrowLeft, ArrowRight, ArrowUpRight, CheckCircle2, Clock3, Download, FileText, Sparkles } from "lucide-react";
import { trpc } from "@/lib/trpc";
import { defaultSiteContent } from "@shared/siteContent";
import { sampleIssues } from "@shared/sampleIssues";
import { getResourcesAnchorTarget } from "@shared/resourcesNavigation";

const CAREER_SIGNAL_LOGO = "/career-signal-updated-mark-bluebar-v2.png";

function SignalMark({ inverse = false }: { inverse?: boolean }) {
  return (
    <span className={`signal-logo-wrap ${inverse ? "signal-logo-wrap--on-dark" : ""}`} aria-hidden="true">
      <img className="signal-logo" src={CAREER_SIGNAL_LOGO} alt="" />
    </span>
  );
}

export default function Resources() {
  const contentQuery = trpc.content.public.useQuery(undefined, { retry: false, refetchOnWindowFocus: false });
  const content = contentQuery.data ?? defaultSiteContent;
  const resource = content.resources;
  const featured = resource.featured;

  useEffect(() => {
    const scrollToRequestedSection = () => {
      const targetId = getResourcesAnchorTarget(window.location.hash);
      if (!targetId) return;

      window.requestAnimationFrame(() => {
        document.getElementById(targetId)?.scrollIntoView({ block: "start" });
      });
    };

    scrollToRequestedSection();
    window.addEventListener("hashchange", scrollToRequestedSection);
    return () => window.removeEventListener("hashchange", scrollToRequestedSection);
  }, []);

  return (
    <div className="resources-page">
      <header className="resources-nav">
        <a className="brand" href="/" aria-label="Career Signal home">
          <SignalMark />
          <span className="brand-lockup"><strong className="brand-name">{content.identity.brandName}</strong><small>{content.identity.endorsement}</small></span>
        </a>
        <a className="resources-nav-return" href="/"><ArrowLeft size={15} /> Back to the briefing</a>
      </header>

      <main>
        <section className="resources-hero" aria-labelledby="resources-title">
          <div className="resources-hero-copy">
            <div className="eyebrow"><span className="eyebrow-line" />{resource.eyebrow}</div>
            <h1 id="resources-title">{resource.title} <em>{resource.emphasis}</em></h1>
            <p>{resource.intro}</p>
          </div>
          <aside className="resources-index" aria-label="Resource library index"><span>RESOURCE LIBRARY</span><strong>01</strong><p>Published guides, tools and working notes for professionals and leaders in motion.</p></aside>
        </section>

        <section className="resource-feature" aria-labelledby="ats-audit-title">
          <div className="resource-feature-document" aria-hidden="true">
            <div className="resource-document-topline"><span>CAREER SIGNAL / {featured.number}</span><span>PDF</span></div>
            <div className="resource-document-body"><p>{featured.category}</p><h2>{featured.title}</h2><div className="resource-document-lines"><i /><i /><i /><i /></div></div>
            <div className="resource-document-footer"><span>{featured.reviewTime.toUpperCase()}</span><span>01</span></div>
          </div>
          <div className="resource-feature-copy">
            <div className="resource-status"><Sparkles size={14} /> {featured.status}</div>
            <p className="resource-number">{featured.number}</p>
            <h2 id="ats-audit-title">{featured.title}</h2>
            <p className="resource-lede">{featured.description}</p>
            <div className="resource-facts" aria-label="Guide details"><span><Clock3 size={15} /> {featured.reviewTime}</span><span><FileText size={15} /> {featured.format}</span><span><CheckCircle2 size={15} /> {featured.proofPoint}</span></div>
            <ul className="resource-includes">{featured.bullets.map((bullet) => <li key={bullet}>{bullet}</li>)}</ul>
            <div className="resource-actions"><a className="resource-download" href={featured.downloadUrl} target="_blank" rel="noreferrer">{featured.downloadLabel} <Download size={17} /></a><a className="resource-subscribe" href="/#subscribe">Get the weekly briefing <ArrowRight size={16} /></a></div>
            <p className="resource-note">{featured.note}</p>
          </div>
        </section>

        <section className="resource-method" aria-labelledby="method-title">
          <div><div className="eyebrow"><span className="eyebrow-line" />WHAT MAKES A CAREER SIGNAL RESOURCE</div><h2 id="method-title">Less noise.<br /><em>More usable signal.</em></h2></div>
          <div className="resource-method-list"><article><span>01</span><h3><span>Specific</span></h3><p>Each guide focuses on one high-stakes career moment rather than attempting to solve your whole search at once.</p></article><article><span>02</span><h3><span>Evidence-led</span></h3><p>The practical advice is designed to help you make the strongest honest case for the work you have done.</p></article><article><span>03</span><h3><span>Built to use</span></h3><p>Every resource includes a checklist, prompt or working tool you can return to before your next decision.</p></article></div>
        </section>

        <section className="resource-next" aria-labelledby="next-title">
          <div><p className="resource-number">THE NEXT FILES</p><h2 id="next-title">The library will grow<br /><em>when a new decision deserves it.</em></h2></div>
          <div className="resource-next-stack">{resource.upcoming.map((upcoming) => upcoming.downloadUrl ? <a className="resource-library-download" href={upcoming.downloadUrl} target="_blank" rel="noreferrer" key={upcoming.title}><span>{upcoming.status}</span><strong>{upcoming.title}</strong><small>{upcoming.summary} <b>Download guide <Download size={12} /></b></small></a> : <article key={upcoming.title}><span>{upcoming.status}</span><strong>{upcoming.title}</strong><small>{upcoming.summary}</small></article>)}</div>
        </section>

        <section className="sample-library" id="sample-issues" aria-labelledby="sample-issues-title">
          <div className="sample-library-intro"><div className="eyebrow"><span className="eyebrow-line" />SAMPLE BRIEFING LIBRARY</div><h2 id="sample-issues-title">Browse the preview.<br /><em>Build the next move.</em></h2><p>Sample 01 is a complete free working page. Every later item is a one-page preview; its fuller edition arrives one at a time in a future weekly email.</p><div className="sample-library-actions"><a href={sampleIssues[0].completeUrl} target="_blank" rel="noreferrer">Read the complete free sample <Download size={15} /></a><a href="/#subscribe">Subscribe for future full editions <ArrowRight size={15} /></a></div></div>
          <div className="sample-library-grid">{sampleIssues.map((issue) => <article className="sample-library-card" key={issue.number}><span>SAMPLE {issue.number}</span><h3>{issue.title}</h3><p>{issue.subtitle}</p><div><a href={issue.previewUrl} target="_blank" rel="noreferrer">Read preview <ArrowUpRight size={14} /></a>{issue.freeComplete ? <a href={issue.completeUrl} target="_blank" rel="noreferrer">Complete edition <Download size={13} /></a> : <span className="sample-library-delivery"><Clock3 size={13} /> {issue.deliveryLabel}</span>}</div></article>)}</div>
          <p className="sample-library-note">Sample briefings are prepared for educational reading. They are preview editions, not historic newsletter sends, and do not guarantee a career outcome.</p>
        </section>
      </main>

      <footer className="resources-footer">
        <div><a className="brand brand--footer" href="/"><SignalMark inverse /><span className="brand-lockup"><strong className="brand-name">{content.identity.brandName}</strong><small>{content.identity.endorsement}</small></span></a><p>{content.identity.footerTagline}</p></div>
        <div className="resources-footer-links"><a href="/">The briefing <ArrowUpRight size={13} /></a><a href="/privacy">Privacy Policy <ArrowUpRight size={13} /></a><a href={`mailto:${content.identity.contactEmail}`}>Contact <ArrowUpRight size={13} /></a></div>
        <span>{content.identity.copyrightLabel}</span>
      </footer>
    </div>
  );
}
