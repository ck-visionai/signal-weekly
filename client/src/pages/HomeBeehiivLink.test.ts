import { describe, expect, it } from "vitest";
import { readFileSync } from "node:fs";
import { fileURLToPath } from "node:url";
import path from "node:path";

describe("homepage Beehiiv subscribe destination", () => {
  it("uses the confirmed Career Weekly publication URL", () => {
    const source = readFileSync(
      path.resolve(path.dirname(fileURLToPath(import.meta.url)), "Home.tsx"),
      "utf8"
    );

    expect(source).toContain(
      'href="https://careerweekly.beehiiv.com/subscribe"'
    );
    expect(source).not.toContain("signalweeklyhq.beehiiv.com/subscribe");
  });
});

