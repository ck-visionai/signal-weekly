import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";

const homeSource = readFileSync(new URL("../client/src/pages/Home.tsx", import.meta.url), "utf8");

describe("Career Weekly homepage navigation and card artwork", () => {
  it("keeps the primary complimentary-issue flow in the hero and closing sections", () => {
    expect(homeSource).toContain('document.getElementById("subscribe")');
    expect(homeSource).toContain("beehiivEmbedRef.current");
    expect(homeSource).toContain("content.navigation.subscribeLabel");
    expect(homeSource).toContain("<ArrowRight size={18} />");
  });

  it("uses a distinct offer-strategy visual instead of repeating the interview paper-stack artifact", () => {
    expect(homeSource).toContain("career-signal-offer-brief_0ee33e08.jpg");
    expect(homeSource).toContain('image: pillar.imageUrl || (index === 2 ? OFFER_STRATEGY_IMAGE : null)');
  });

  it("uses rightward arrows for internal pages and reserves up-right arrows for external or download links", () => {
    expect(homeSource).toContain('href="/resources"');
    expect(homeSource).toContain("content.navigation.resourcesLabel");
    expect(homeSource).toContain("content.footer.privacyLinkLabel");
    expect(homeSource).toContain('<ArrowRight size={13} />');
    expect(homeSource).toContain('<ArrowUpRight size={13} />');
  });

  it("keeps the footer Explore list focused on the approved Resources, audit and signup actions", () => {
    expect(homeSource).not.toContain('<a href="#sample">{content.footer.sampleLinkLabel} <ArrowDown size={13} /></a>');
    expect(homeSource).not.toContain('<a href="#inside">{content.footer.insideLinkLabel} <ArrowDown size={13} /></a>');
  });

  it("removes redundant complimentary-issue links from Practice and the footer", () => {
    expect(homeSource).not.toContain('className="practice-cta"');
    expect(homeSource).not.toContain('{content.navigation.subscribeLabel} <ArrowDown size={13} />');
  });

  it("uses a distinct three-signal Friday-brief panel instead of a third Evidence Before Adjectives cover", () => {
    expect(homeSource).toContain("YOUR FRIDAY CAREER BRIEF");
    expect(homeSource).toContain("Make the fit clear.");
    expect(homeSource).toContain("Make judgement visible.");
    expect(homeSource).toContain("Protect the value.");
    expect(homeSource).not.toContain("content.closing.artifactTitle");
  });
});
