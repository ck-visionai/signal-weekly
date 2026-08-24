export type StaticRouteDocument = {
  path: "resources" | "privacy";
  title: string;
  description: string;
  socialTitle: string;
  socialDescription: string;
};

export const staticRouteDocuments: StaticRouteDocument[] = [
  {
    path: "resources",
    title: "Career Resources | Career Signal",
    description: "Practical career resources from Career Signal, including the Executive ATS Résumé Audit and executive interview-preparation guide.",
    socialTitle: "Career Resources | Career Signal",
    socialDescription: "Practical field guides for consequential career decisions, including ATS résumé and executive interview preparation.",
  },
  {
    path: "privacy",
    title: "Privacy Policy | Career Signal",
    description: "Read the Career Signal Privacy Policy and understand how newsletter subscription information is handled.",
    socialTitle: "Privacy Policy | Career Signal",
    socialDescription: "The privacy policy for Career Signal, a Signrl publication.",
  },
];

const canonicalFor = (path: StaticRouteDocument["path"]) => `https://www.signrl.com/${path}`;

export function renderStaticRouteHtml(source: string, route: StaticRouteDocument) {
  const canonical = canonicalFor(route.path);
  return source
    .replace('<link rel="canonical" href="https://www.signrl.com/" />', `<link rel="canonical" href="${canonical}" />`)
    .replace(/<meta name="description" content="[^"]*" \/>/, `<meta name="description" content="${route.description}" />`)
    .replace(/<meta property="og:title" content="[^"]*" \/>/, `<meta property="og:title" content="${route.socialTitle}" />`)
    .replace(/<meta property="og:description" content="[^"]*" \/>/, `<meta property="og:description" content="${route.socialDescription}" />`)
    .replace(/<meta property="og:url" content="[^"]*" \/>/, `<meta property="og:url" content="${canonical}" />`)
    .replace(/<meta name="twitter:title" content="[^"]*" \/>/, `<meta name="twitter:title" content="${route.socialTitle}" />`)
    .replace(/<meta name="twitter:description" content="[^"]*" \/>/, `<meta name="twitter:description" content="${route.socialDescription}" />`)
    .replace(/<title>[^<]*<\/title>/, `<title>${route.title}</title>`);
}
