const GA4_MEASUREMENT_ID = import.meta.env.VITE_GA4_MEASUREMENT_ID?.trim();
const GOOGLE_SITE_VERIFICATION =
  import.meta.env.VITE_GOOGLE_SITE_VERIFICATION?.trim();

type Gtag = (...args: unknown[]) => void;

declare global {
  interface Window {
    dataLayer?: unknown[];
    gtag?: Gtag;
    __careerWeeklyGa4Initialized?: boolean;
  }
}

function addScript(src: string, id: string) {
  if (document.getElementById(id)) return;
  const script = document.createElement("script");
  script.id = id;
  script.async = true;
  script.src = src;
  document.head.appendChild(script);
}

export function initializeOptionalMeasurement() {
  if (GA4_MEASUREMENT_ID && !window.__careerWeeklyGa4Initialized) {
    window.dataLayer = window.dataLayer || [];
    window.gtag =
      window.gtag || ((...args: unknown[]) => window.dataLayer?.push(args));
    window.gtag("js", new Date());
    window.gtag("config", GA4_MEASUREMENT_ID, { anonymize_ip: true });
    addScript(
      `https://www.googletagmanager.com/gtag/js?id=${encodeURIComponent(GA4_MEASUREMENT_ID)}`,
      "career-weekly-ga4"
    );
  }

  if (GOOGLE_SITE_VERIFICATION) {
    let tag = document.querySelector(
      'meta[name="google-site-verification"]'
    ) as HTMLMetaElement | null;
    if (!tag) {
      tag = document.createElement("meta");
      tag.name = "google-site-verification";
      document.head.appendChild(tag);
    }
    tag.content = GOOGLE_SITE_VERIFICATION;
  }
}

export function trackEvent(
  name: string,
  parameters: Record<string, string | number | boolean> = {}
) {
  window.gtag?.("event", name, parameters);
}

export const measurementConfig = {
  ga4Configured: Boolean(GA4_MEASUREMENT_ID),
  searchConsoleConfigured: Boolean(GOOGLE_SITE_VERIFICATION),
};
