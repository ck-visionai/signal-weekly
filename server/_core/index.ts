import "dotenv/config";
import express from "express";
import { createServer } from "http";
import net from "net";
import { createExpressMiddleware } from "@trpc/server/adapters/express";
import { registerOAuthRoutes } from "./oauth";
import { registerStorageProxy } from "./storageProxy";
import { appRouter } from "../routers";
import { getEditionById, getReleaseControlByTaskUid, publishDueEditions } from "../editionDb";
import { getPublishedSiteContent } from "../siteContentDb";
import { storageGetSignedUrl } from "../storage";
import { sdk } from "./sdk";
import { createContext } from "./context";
import { serveStatic, setupVite } from "./vite";

function isPortAvailable(port: number): Promise<boolean> {
  return new Promise(resolve => {
    const server = net.createServer();
    server.listen(port, () => {
      server.close(() => resolve(true));
    });
    server.on("error", () => resolve(false));
  });
}

async function findAvailablePort(startPort: number = 3000): Promise<number> {
  for (let port = startPort; port < startPort + 20; port++) {
    if (await isPortAvailable(port)) {
      return port;
    }
  }
  throw new Error(`No available port found starting from ${startPort}`);
}

async function handleScheduledRelease(req: express.Request, res: express.Response) {
  try {
    const user = await sdk.authenticateRequest(req);
    if (!user.isCron || !user.taskUid) {
      return res.status(403).json({ error: "cron-only" });
    }
    const releaseControl = await getReleaseControlByTaskUid(user.taskUid);
    if (!releaseControl) {
      return res.json({ ok: true, skipped: "orphan" });
    }
    const published = await publishDueEditions(new Date());
    return res.json({ ok: true, releaseControlId: releaseControl.id, publishedIssueNumbers: published.map(edition => edition.issueNumber) });
  } catch (error) {
    return res.status(500).json({ error: String(error), timestamp: new Date().toISOString() });
  }
}

async function deliverPublishedLandingPageContent(_req: express.Request, res: express.Response) {
  const content = await getPublishedSiteContent();
  res.setHeader("Cache-Control", "public, max-age=60, stale-while-revalidate=300");
  return res.json({
    schemaVersion: "career-weekly.site-content.v1",
    contentKey: "signal-weekly-site",
    content,
  });
}

async function deliverPublishedPdf(req: express.Request, res: express.Response) {
  const editionId = Number(req.params.id);
  const variant = req.params.variant;
  if (!Number.isInteger(editionId) || !["preview", "complete"].includes(variant)) return res.status(400).json({ error: "invalid-edition-request" });
  const edition = await getEditionById(editionId);
  if (!edition || edition.status !== "published") return res.status(404).json({ error: "edition-not-published" });
  const key = variant === "preview" ? edition.previewKey : edition.completeKey;
  const directUrl = variant === "preview" ? edition.previewUrl : edition.completeUrl;
  if (key) return res.redirect(await storageGetSignedUrl(key));
  if (directUrl) return res.redirect(directUrl);
  return res.status(404).json({ error: "pdf-not-available" });
}

async function startServer() {
  const app = express();
  const server = createServer(app);
  // Configure body parser with larger size limit for file uploads
  app.use(express.json({ limit: "50mb" }));
  app.use(express.urlencoded({ limit: "50mb", extended: true }));
  registerStorageProxy(app);
  registerOAuthRoutes(app);
  app.post("/api/scheduled/release-friday-edition", handleScheduledRelease);
  app.get("/api/content/landing-page", deliverPublishedLandingPageContent);
  app.get("/api/editions/:id/:variant", deliverPublishedPdf);
  // tRPC API
  app.use(
    "/api/trpc",
    createExpressMiddleware({
      router: appRouter,
      createContext,
    })
  );
  // development mode uses Vite, production mode uses static files
  if (process.env.NODE_ENV === "development") {
    await setupVite(app, server);
  } else {
    serveStatic(app);
  }

  const preferredPort = parseInt(process.env.PORT || "3000");
  const port = await findAvailablePort(preferredPort);

  if (port !== preferredPort) {
    console.log(`Port ${preferredPort} is busy, using port ${port} instead`);
  }

  server.listen(port, () => {
    console.log(`Server running on http://localhost:${port}/`);
  });
}

startServer().catch(console.error);
