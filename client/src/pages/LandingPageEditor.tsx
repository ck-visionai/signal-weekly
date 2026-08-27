import DashboardLayout from "@/components/DashboardLayout";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { useAuth } from "@/_core/hooks/useAuth";
import { startLogin } from "@/const";
import { trpc } from "@/lib/trpc";
import type { SiteContent } from "@shared/siteContent";
import { Download, Eye, FileJson, Save, Send } from "lucide-react";
import { useEffect, useState } from "react";

const previewSections = [
  ["identity", "brandName", "Brand name"],
  ["identity", "endorsement", "Endorsement"],
  ["hero", "eyebrow", "Hero eyebrow"],
  ["hero", "headline", "Hero headline"],
  ["hero", "emphasis", "Hero emphasis"],
  ["hero", "intro", "Hero introduction"],
  ["hero", "leadButtonLabel", "Hero CTA label"],
  ["hero", "leadUrl", "Hero CTA URL"],
  ["navigation", "subscribeLabel", "Navigation CTA label"],
  ["seo", "title", "SEO title"],
  ["seo", "description", "SEO description"],
  ["seo", "canonicalUrl", "Canonical URL"],
  ["seo", "ogTitle", "Social title"],
  ["seo", "ogDescription", "Social description"],
  ["seo", "ogImage", "Social image URL"],
  ["identity", "contactEmail", "Contact email"],
] as const;

type SectionName = keyof SiteContent;

export default function LandingPageEditor() {
  const { user, loading: authLoading, isAuthenticated } = useAuth();
  const query = trpc.landingPage.editor.useQuery(undefined, { enabled: isAuthenticated });
  const revisions = trpc.landingPage.revisions.useQuery(undefined, { enabled: isAuthenticated });
  const saveDraft = trpc.landingPage.saveDraft.useMutation({ onSuccess: () => { void query.refetch(); void revisions.refetch(); } });
  const publish = trpc.landingPage.publish.useMutation({ onSuccess: () => void query.refetch() });
  const restoreRevision = trpc.landingPage.restoreRevision.useMutation({ onSuccess: () => { void query.refetch(); void revisions.refetch(); } });
  const exportContent = trpc.landingPage.export.useQuery(undefined, { enabled: false });
  const [content, setContent] = useState<SiteContent | null>(null);
  const [advancedJson, setAdvancedJson] = useState("");
  const [jsonError, setJsonError] = useState("");

  useEffect(() => {
    if (!query.data?.content) return;
    setContent(query.data.content);
    setAdvancedJson(JSON.stringify(query.data.content, null, 2));
  }, [query.data?.content]);

  const setField = (section: SectionName, field: string, value: string) => {
    setContent(current => current ? ({ ...current, [section]: { ...(current[section] as Record<string, unknown>), [field]: value } } as SiteContent) : current);
    setAdvancedJson("");
    setJsonError("");
  };

  const save = () => {
    if (!content) return;
    saveDraft.mutate(content);
  };

  const applyAdvancedJson = () => {
    try {
      const parsed = JSON.parse(advancedJson) as SiteContent;
      setContent(parsed);
      setJsonError("");
    } catch {
      setJsonError("Enter valid JSON before applying the advanced record.");
    }
  };

  const downloadExport = async () => {
    const result = await exportContent.refetch();
    if (!result.data) return;
    const blob = new Blob([JSON.stringify(result.data, null, 2)], { type: "application/json" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = "career-weekly-site-content.v1.json";
    link.click();
    URL.revokeObjectURL(url);
  };

  if (authLoading) return <div className="min-h-screen grid place-items-center bg-slate-50 text-sm text-slate-600">Checking editor access…</div>;
  if (!isAuthenticated) return <div className="min-h-screen grid place-items-center bg-slate-50 p-6"><div className="max-w-md rounded-2xl bg-white p-8 text-center shadow-sm"><h1 className="text-2xl font-semibold">Sign in to continue</h1><p className="mt-2 text-sm text-slate-600">The landing-page editor is private to authorized team members.</p><Button className="mt-6" onClick={() => startLogin()}>Sign in</Button></div></div>;
  if (user?.role !== "admin") return <div className="min-h-screen grid place-items-center bg-slate-50 p-6"><div className="max-w-md rounded-2xl bg-white p-8 text-center shadow-sm"><h1 className="text-2xl font-semibold">Editor access restricted</h1><p className="mt-2 text-sm text-slate-600">Your account does not have owner-editor permissions.</p></div></div>;
  const lastEditor = query.data && "updatedBy" in query.data ? query.data.updatedBy : "system";

  return <DashboardLayout>
    <main className="min-h-screen bg-slate-50 p-4 text-slate-950 md:p-8">
      <div className="mx-auto max-w-6xl space-y-6">
        <header className="flex flex-col justify-between gap-4 border-b border-slate-200 pb-6 md:flex-row md:items-end">
          <div><p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-900">Career Weekly / Owner Editor</p><h1 className="mt-2 text-3xl font-semibold tracking-tight">Landing-page content</h1><p className="mt-2 max-w-2xl text-sm text-slate-600">Edit structured public copy without changing React code. Save creates a revision; publish moves the validated draft into the public record.</p></div>
          <div className="flex flex-wrap gap-2"><Button variant="outline" onClick={() => window.open("/", "_blank")}><Eye className="mr-2 h-4 w-4" />Preview site</Button><Button variant="outline" onClick={() => void downloadExport()} disabled={exportContent.isFetching}><Download className="mr-2 h-4 w-4" />Export JSON</Button><Button onClick={save} disabled={!content || saveDraft.isPending}><Save className="mr-2 h-4 w-4" />Save draft</Button><Button onClick={() => publish.mutate()} disabled={!content || publish.isPending}><Send className="mr-2 h-4 w-4" />Publish draft</Button></div>
        </header>

        <div className="grid gap-6 lg:grid-cols-[1fr_300px]">
          <section className="space-y-6">
            <div className="grid gap-4 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm md:grid-cols-2">
              {previewSections.map(([section, field, label]) => <label key={`${section}.${field}`} className={field === "intro" || field === "description" || field === "ogDescription" ? "space-y-1.5 md:col-span-2" : "space-y-1.5"}><span className="text-xs font-semibold uppercase tracking-wide text-slate-600">{label}</span>{field === "intro" || field === "description" || field === "ogDescription" ? <Textarea rows={4} value={String((content?.[section] as Record<string, unknown> | undefined)?.[field] ?? "")} onChange={event => setField(section, field, event.target.value)} /> : <Input value={String((content?.[section] as Record<string, unknown> | undefined)?.[field] ?? "")} onChange={event => setField(section, field, event.target.value)} />}</label>)}
            </div>

            <div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"><div className="flex items-center gap-2"><FileJson className="h-4 w-4 text-indigo-900" /><h2 className="font-semibold">Advanced structured record</h2></div><p className="mt-1 text-sm text-slate-600">Use this migration-safe JSON view for fields not shown above, including pillars, archive cards, practice slides, footer labels, and legal links. The server validates the complete record before saving.</p><Textarea className="mt-4 font-mono text-xs" rows={16} value={advancedJson || (content ? JSON.stringify(content, null, 2) : "")} onChange={event => setAdvancedJson(event.target.value)} /><div className="mt-3 flex items-center justify-between gap-3"><Button variant="outline" onClick={applyAdvancedJson}>Apply JSON to form</Button>{jsonError && <p className="text-sm text-red-700">{jsonError}</p>}</div></div>
          </section>

          <aside className="space-y-6"><div className="rounded-2xl border border-indigo-200 bg-indigo-50 p-5"><p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-900">Record status</p><p className="mt-2 text-sm text-slate-700">{query.isLoading ? "Loading structured content…" : query.data ? `Revision ${query.data.revision}. Draft and published records are separate.` : "The approved code-owned defaults will seed the first record."}</p><p className="mt-3 text-xs text-slate-600">Last editor: {lastEditor ?? "system"}</p></div><div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"><h2 className="font-semibold">Revision history</h2><div className="mt-3 space-y-2 text-sm text-slate-600">{revisions.data?.length ? revisions.data.slice(0, 8).map(item => <div key={item.id} className="flex items-center justify-between gap-2 border-b border-slate-100 pb-2"><span>Revision {item.revision}<span className="ml-2 text-xs text-slate-400">{item.savedBy ?? "system"}</span></span><Button variant="ghost" size="sm" onClick={() => restoreRevision.mutate({ revisionId: item.id })} disabled={restoreRevision.isPending}>Restore</Button></div>) : <p>No saved revisions yet.</p>}
</div></div><div className="rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"><h2 className="font-semibold">Migration contract</h2><p className="mt-2 text-sm leading-6 text-slate-600">Export uses `career-weekly.site-content.v1`, with stable section names and public URL fields. A future CMS can import this JSON while the weekly edition tables remain a separate publishing domain.</p></div></aside>
        </div>
      </div>
    </main>
  </DashboardLayout>;
}
