import { readFileSync } from "node:fs";
import { describe, expect, it } from "vitest";

function readJsonLd() {
  const html = readFileSync(new URL("../client/index.html", import.meta.url), "utf8");
  const match = html.match(/<script type="application\/ld\+json">\s*([\s\S]*?)\s*<\/script>/);
  if (!match) throw new Error("Landing page JSON-LD is missing");
  return JSON.parse(match[1]) as { "@graph": Array<Record<string, unknown>> };
}

describe("Career Weekly landing-page SEO/AEO metadata", () => {
  it("keeps crawlable page, publisher, and visible FAQ entities", () => {
    const graph = readJsonLd()["@graph"];
    const types = graph.map((item) => item["@type"]);
    expect(types).toEqual(expect.arrayContaining(["Organization", "WebSite", "WebPage", "FAQPage"]));
    const faq = graph.find((item) => item["@type"] === "FAQPage");
    expect(Array.isArray(faq?.mainEntity)).toBe(true);
    expect((faq?.mainEntity as Array<Record<string, unknown>>).length).toBe(3);
  });
});
