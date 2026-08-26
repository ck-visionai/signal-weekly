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
    title: "Career Resources | Career Weekly",
    description: "Practical career resources from Career Weekly, including The Career Evidence Working Page and future career decision briefings.",
    socialTitle: "Career Resources | Career Weekly",
    socialDescription: "Practical field guides for consequential career decisions, including ATS résumé and executive interview preparation.",
  },
  {
    path: "privacy",
    title: "Privacy Policy | Career Weekly",
    description: "Read the Career Weekly Privacy Policy and understand how newsletter subscription information is handled.",
    socialTitle: "Privacy Policy | Career Weekly",
    socialDescription: "The privacy policy for Career Weekly, a Signrl publication.",
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
