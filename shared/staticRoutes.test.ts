import { describe, expect, it } from "vitest";
import fs from "node:fs";
import path from "node:path";

describe("GitHub Pages static route documents", () => {
  it("emits a canonical resources document with dedicated discovery metadata", () => {
    const html = fs.readFileSync(path.resolve(import.meta.dirname, "../client/resources/index.html"), "utf8");

    expect(html).toContain('href="https://www.signrl.com/resources"');
    expect(html).toContain("Career Resources | Signal Weekly");
    expect(html).toContain("Executive ATS Résumé Audit");
  });

  it("emits a canonical privacy document without retaining home-page metadata", () => {
    const html = fs.readFileSync(path.resolve(import.meta.dirname, "../client/privacy/index.html"), "utf8");

    expect(html).toContain('href="https://www.signrl.com/privacy"');
    expect(html).toContain("Privacy Policy | Signal Weekly");
    expect(html).not.toContain("Career Resources | Signal Weekly");
  });
});
