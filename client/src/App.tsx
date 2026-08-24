import { Toaster } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { useEffect } from "react";
import NotFound from "@/pages/NotFound";
import { Route, Switch, useLocation } from "wouter";
import ErrorBoundary from "./components/ErrorBoundary";
import { ThemeProvider } from "./contexts/ThemeContext";
import Home from "./pages/Home";
import Editor from "./pages/Editor";
import Privacy from "./pages/Privacy";
import Resources from "./pages/Resources";

/**
 * Career Signal / Executive Signal Desk
 * SEO uses www.signrl.com as the single public address while preserving the editorial brand hierarchy.
 */
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

  useEffect(() => {
    if (location.startsWith("/editor")) return;
    const isPrivacy = location === "/privacy";
    const isResources = location === "/resources";
    const title = isPrivacy
      ? "Privacy Policy | Career Signal"
      : isResources
        ? "Resources | Career Signal"
        : "Career Signal | Career Intelligence for Leaders";
    const description = isPrivacy
      ? "Read the Career Signal Privacy Policy and learn how subscription information is handled."
      : isResources
        ? "Download practical Career Signal guides for ATS résumés, executive interviews and career decisions."
        : "Career Signal is a free career-intelligence briefing with practical ATS résumé, executive interview and salary-negotiation guidance for mid-career and senior professionals.";
    const path = isPrivacy ? "/privacy" : isResources ? "/resources" : "/";

    document.title = title;
    setCanonical(path);
    setMeta('meta[name="description"]', "name", "description", description);
    setMeta('meta[property="og:title"]', "property", "og:title", title);
    setMeta('meta[property="og:description"]', "property", "og:description", description);
    setMeta('meta[property="og:url"]', "property", "og:url", `${SITE_URL}${path}`);
  }, [location]);

  return null;
}
function Router() {
  // make sure to consider if you need authentication for certain routes
  return (
    <Switch>
      <Route path={"/"} component={Home} />
      <Route path={"/privacy"} component={Privacy} />
      <Route path={"/resources"} component={Resources} />
      <Route path={"/editor"} component={Editor} />
      <Route path={"/editor/:section"} component={Editor} />
      <Route path={"/404"} component={NotFound} />
      {/* Final fallback route */}
      <Route component={NotFound} />
    </Switch>
  );
}

// NOTE: About Theme
// - First choose a default theme according to your design style (dark or light bg), than change color palette in index.css
//   to keep consistent foreground/background color across components
// - If you want to make theme switchable, pass `switchable` ThemeProvider and use `useTheme` hook

function App() {
  return (
    <ErrorBoundary>
      <ThemeProvider
        defaultTheme="light"
        // switchable
      >
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
