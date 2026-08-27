/**
 * Career Weekly / Executive Signal Desk
 * Ground-truth import from ck-visionai/signal-weekly: editorial minimalism, warm paper, graphite, teal/cobalt accents, and briefing-card composition.
 */
import { Toaster } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { useEffect } from "react";
import NotFound from "@/pages/NotFound";
import { Route, Switch, useLocation } from "wouter";
import ErrorBoundary from "./components/ErrorBoundary";
import { ThemeProvider } from "./contexts/ThemeContext";
import Home from "./pages/Home";
import Privacy from "./pages/Privacy";
import Resources from "./pages/Resources";
import Editor from "@/pages/Editor";
import LandingPageEditor from "@/pages/LandingPageEditor";
import { trpc } from "@/lib/trpc";

const SITE_URL = "https://www.signrl.com";

function setMeta(selector: string, attribute: "name" | "property", key: string, content: string) {
  let tag = document.head.querySelector<HTMLMetaElement>(selector);
  if (!tag) {
    tag = document.createElement("meta");
    tag.setAttribute(attribute, key);
    document.head.appendChild(tag);
  }
  tag.content = content;
}

function setCanonical(path: string) {
  let tag = document.head.querySelector<HTMLLinkElement>('link[rel="canonical"]');
  if (!tag) {
    tag = document.createElement("link");
    tag.rel = "canonical";
    document.head.appendChild(tag);
  }
  tag.href = `${SITE_URL}${path}`;
}

function RouteSeo() {
  const [location] = useLocation();
  const contentQuery = trpc.siteContent.useQuery();

  useEffect(() => {
    const isPrivacy = location === "/privacy";
    const isResources = location === "/resources";
    const structuredSeo = contentQuery.data?.seo;
    const title = isPrivacy
      ? "Privacy Policy | Career Weekly"
      : isResources
        ? "Resources | Career Weekly"
        : structuredSeo?.title ?? "Career Weekly | Career Intelligence for Leaders";
    const description = isPrivacy
      ? "Read the Career Weekly Privacy Policy and learn how subscription information is handled."
      : isResources
        ? "Download practical Career Weekly guides for ATS résumés, executive interviews and career decisions."
        : structuredSeo?.description ?? "Career Weekly is a complimentary career-intelligence briefing with practical ATS résumé, executive interview and salary-negotiation guidance for mid-career and senior professionals.";
    const path = isPrivacy ? "/privacy" : isResources ? "/resources" : "/";
    const canonical = path === "/" ? structuredSeo?.canonicalUrl ?? `${SITE_URL}/` : `${SITE_URL}${path}`;

    document.title = title;
    setCanonical(path);
    if (path === "/" && canonical !== `${SITE_URL}/`) {
      const tag = document.head.querySelector<HTMLLinkElement>('link[rel="canonical"]');
      if (tag) tag.href = canonical;
    }
    setMeta('meta[name="description"]', "name", "description", description);
    setMeta('meta[property="og:title"]', "property", "og:title", path === "/" ? structuredSeo?.ogTitle ?? title : title);
    setMeta('meta[property="og:description"]', "property", "og:description", path === "/" ? structuredSeo?.ogDescription ?? description : description);
    setMeta('meta[property="og:url"]', "property", "og:url", canonical);
    if (path === "/" && structuredSeo?.ogImage) setMeta('meta[property="og:image"]', "property", "og:image", structuredSeo.ogImage);
  }, [location, contentQuery.data?.seo]);

  return null;
}
function Router() {
  // make sure to consider if you need authentication for certain routes
  return (
    <Switch>
      <Route path="/" component={Home} />
      <Route path="/privacy" component={Privacy} />
      <Route path="/resources" component={Resources} />
      <Route path="/editor" component={Editor} />
      <Route path="/editor/landing" component={LandingPageEditor} />
      <Route path="/404" component={NotFound} />
      <Route component={NotFound} />
    </Switch>
  );
}

function App() {
  return (
    <ErrorBoundary>
      <ThemeProvider defaultTheme="light">
        <TooltipProvider>
          <Toaster />
          <RouteSeo />
          <Router />
        </TooltipProvider>
      </ThemeProvider>
    </ErrorBoundary>
  );
}

export default App;
