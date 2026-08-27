import { describe, expect, it } from "vitest";
import { readFileSync } from "node:fs";
import { resolve } from "node:path";

const privacySource = readFileSync(resolve(process.cwd(), "client/src/pages/Privacy.tsx"), "utf8");
const styleSource = readFileSync(resolve(process.cwd(), "client/src/index.css"), "utf8");

describe("privacy policy public copy", () => {
  it("uses the approved effective date", () => {
    expect(privacySource).toContain("Effective 22 August 2026");
    expect(privacySource).not.toContain("Effective 18 August 2026");
  });

  it("keeps the subtitle on one desktop line and wraps on mobile", () => {
    expect(styleSource).toContain(".privacy-lede { max-width: none;");
    expect(styleSource).toContain("white-space: nowrap;");
    expect(styleSource).toContain("white-space: normal;");
  });

  it("keeps Contact Us unnumbered", () => {
    expect(privacySource).toContain("<h2>Contact Us</h2>");
    expect(privacySource).not.toContain("<h2>13. Contact Us</h2>");
  });
});
