import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";

const homeSource = readFileSync(new URL("../client/src/pages/Home.tsx", import.meta.url), "utf8");

describe("Career Weekly homepage navigation and card artwork", () => {
  it("routes the footer free-working-page link through the reliable signup scroll handler", () => {
    expect(homeSource).toContain('const signupTarget = document.getElementById("subscribe") ?? beehiivEmbedRef.current;');
    expect(homeSource).toContain('<a href="#subscribe" onClick={scrollToSignup}>{content.navigation.subscribeLabel} <ArrowDown size={13} /></a>');
  });

  it("uses a distinct offer-strategy visual instead of repeating the interview paper-stack artifact", () => {
    expect(homeSource).toContain('const OFFER_STRATEGY_IMAGE = "/manus-storage/career-signal-offer-brief_0ee33e08.jpg";');
    expect(homeSource).toContain('image: pillar.imageUrl || (index === 2 ? OFFER_STRATEGY_IMAGE : null)');
  });

  it("uses rightward arrows for internal pages and reserves up-right arrows for external or download links", () => {
    expect(homeSource).toContain('<a href="/resources">{content.navigation.resourcesLabel} <ArrowRight size={13} /></a>');
    expect(homeSource).toContain('<a href="/privacy">{content.footer.privacyLinkLabel} <ArrowRight size={13} /></a>');
    expect(homeSource).toContain('<ArrowUpRight size={13} />');
  });

  it("keeps the footer Explore list focused on the approved Resources, audit and signup actions", () => {
    expect(homeSource).not.toContain('<a href="#sample">{content.footer.sampleLinkLabel} <ArrowDown size={13} /></a>');
    expect(homeSource).not.toContain('<a href="#inside">{content.footer.insideLinkLabel} <ArrowDown size={13} /></a>');
  });

  it("routes the Practice section to the same concise free-page conversion action", () => {
    expect(homeSource).toContain('>Get my free page <ArrowRight size={14} /></a>');
  });

  it("uses a distinct three-signal Friday-brief panel instead of a third Evidence Before Adjectives cover", () => {
    expect(homeSource).toContain("YOUR FRIDAY CAREER BRIEF");
    expect(homeSource).toContain("Make the fit clear.");
    expect(homeSource).toContain("Make judgement visible.");
    expect(homeSource).toContain("Protect the value.");
    expect(homeSource).not.toContain("content.closing.artifactTitle");
  });
});
