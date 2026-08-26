import DashboardLayout from "@/components/DashboardLayout";
import { Button } from "@/components/ui/button";
import { useAuth } from "@/_core/hooks/useAuth";
import { startLogin } from "@/const";
import { Input } from "@/components/ui/input";
import { Textarea } from "@/components/ui/textarea";
import { trpc } from "@/lib/trpc";
import { format } from "date-fns";
import { CalendarClock, Check, FileText, Pause, Play, Plus, Save } from "lucide-react";
import { useEffect, useMemo, useState } from "react";

type FormState = {
  issueNumber: string;
  slug: string;
  title: string;
  subtitle: string;
  summary: string;
  status: "draft" | "scheduled" | "published" | "archived";
  releaseAt: string;
  previewUrl: string;
  completeUrl: string;
  previewKey: string;
  completeKey: string;
  previewContent: string;
  completeContent: string;
  previewPages: string;
  completePages: string;
  masthead: string;
  sources: string;
};

const emptyForm: FormState = {
  issueNumber: "13",
  slug: "",
  title: "",
  subtitle: "",
  summary: "",
  status: "draft",
  releaseAt: "",
  previewUrl: "",
  completeUrl: "",
  previewKey: "",
  completeKey: "",
  previewContent: "",
  completeContent: "",
  previewPages: "6",
  completePages: "11",
  masthead: "CAREER WEEKLY · A SIGNRL PUBLICATION",
  sources: "",
};

function toLocalInput(value: Date | string | null | undefined) {
  if (!value) return "";
  const date = new Date(value);
  return Number.isNaN(date.getTime()) ? "" : format(date, "yyyy-MM-dd'T'HH:mm");
}

export default function Editor() {
  const { user, loading: authLoading, isAuthenticated } = useAuth();
  const editions = trpc.editions.editorList.useQuery(undefined, { enabled: isAuthenticated });
  const control = trpc.editions.releaseControl.useQuery();
  const utils = trpc.useUtils();
  const create = trpc.editions.create.useMutation({ onSuccess: () => { utils.editions.editorList.invalidate(); setSelectedId(null); } });
  const update = trpc.editions.update.useMutation({ onSuccess: () => utils.editions.editorList.invalidate() });
  const publish = trpc.editions.publishNow.useMutation({ onSuccess: () => utils.editions.editorList.invalidate() });
  const schedule = trpc.editions.schedule.useMutation({ onSuccess: () => utils.editions.editorList.invalidate() });
  const reschedule = trpc.editions.reschedule.useMutation({ onSuccess: () => utils.editions.editorList.invalidate() });
  const pause = trpc.editions.pause.useMutation({ onSuccess: () => utils.editions.editorList.invalidate() });
  const rollback = trpc.editions.rollback.useMutation({ onSuccess: () => utils.editions.editorList.invalidate() });
  const setupSchedule = trpc.editions.setupFridaySchedule.useMutation({ onSuccess: () => utils.editions.releaseControl.invalidate() });
  const toggleSchedule = trpc.editions.setScheduleEnabled.useMutation({ onSuccess: () => utils.editions.releaseControl.invalidate() });
  const [selectedId, setSelectedId] = useState<number | null>(null);
  const [form, setForm] = useState<FormState>(emptyForm);

  const selected = useMemo(() => editions.data?.find(item => item.id === selectedId), [editions.data, selectedId]);
  const isBusy = create.isPending || update.isPending || publish.isPending || schedule.isPending || reschedule.isPending || pause.isPending || rollback.isPending;

  useEffect(() => {
    if (!selected) return;
    void (async () => {
      const sources = await utils.editions.editorSources.fetch({ editionId: selected.id });
      setForm({
        issueNumber: String(selected.issueNumber), slug: selected.slug, title: selected.title, subtitle: selected.subtitle,
        summary: selected.summary, status: selected.status, releaseAt: toLocalInput(selected.releaseAt),
        previewUrl: selected.previewUrl ?? "", completeUrl: selected.completeUrl ?? "", previewKey: selected.previewKey ?? "", completeKey: selected.completeKey ?? "", previewContent: selected.previewContent ?? "", completeContent: selected.completeContent ?? "", previewPages: String(selected.previewPages ?? ""),
        completePages: String(selected.completePages ?? ""), masthead: selected.masthead,
        sources: sources.map(source => `${source.title} | ${source.url} | ${source.publisher ?? ""}`).join("\n"),
      });
    })();
  }, [selected, utils.editions.editorSources]);

  const setField = <K extends keyof FormState>(key: K, value: FormState[K]) => setForm(current => ({ ...current, [key]: value }));
  const parseSources = () => form.sources.split("\n").map(line => line.trim()).filter(Boolean).map(line => {
    const [title, url, publisher] = line.split("|").map(part => part.trim());
    return { title: title ?? "Source", url: url ?? "", publisher: publisher || null };
  }).filter(source => source.url);
  const payload = () => ({
    issueNumber: Number(form.issueNumber), slug: form.slug || `edition-${form.issueNumber}`,
    title: form.title, subtitle: form.subtitle, summary: form.summary, status: form.status,
    releaseAt: form.releaseAt ? new Date(form.releaseAt) : null,     previewUrl: form.previewUrl || null,
    completeUrl: form.completeUrl || null, previewKey: form.previewKey || null, completeKey: form.completeKey || null, previewContent: form.previewContent || null, completeContent: form.completeContent || null, previewPages: form.previewPages ? Number(form.previewPages) : null,
    completePages: form.completePages ? Number(form.completePages) : null, masthead: form.masthead,
    sources: parseSources(),
  });
  const save = () => {
    if (selectedId) update.mutate({ id: selectedId, patch: payload(), sources: parseSources() });
    else create.mutate(payload());
  };

  if (authLoading) return <div className="min-h-screen grid place-items-center bg-slate-50 text-sm text-slate-600">Checking editor access…</div>;
  if (!isAuthenticated) return <div className="min-h-screen grid place-items-center bg-slate-50 p-6"><div className="max-w-md rounded-2xl bg-white p-8 text-center shadow-sm"><h1 className="text-2xl font-semibold">Sign in to continue</h1><p className="mt-2 text-sm text-slate-600">The Career Weekly edition editor is private to authorized team members.</p><Button className="mt-6" onClick={() => startLogin()}>Sign in</Button></div></div>;
  if (user?.role !== "admin") return <div className="min-h-screen grid place-items-center bg-slate-50 p-6"><div className="max-w-md rounded-2xl bg-white p-8 text-center shadow-sm"><h1 className="text-2xl font-semibold">Editor access restricted</h1><p className="mt-2 text-sm text-slate-600">Your account is signed in, but it does not have owner-editor permissions.</p></div></div>;

  return (
    <DashboardLayout>
      <div className="min-h-screen bg-slate-50 p-4 text-slate-950 md:p-8">
        <div className="mx-auto max-w-7xl space-y-6">
          <header className="flex flex-col justify-between gap-4 border-b border-slate-200 pb-6 md:flex-row md:items-end">
            <div><p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-900">Career Weekly / Owner Editor</p><h1 className="mt-2 text-3xl font-semibold tracking-tight">Edition desk</h1><p className="mt-2 max-w-2xl text-sm text-slate-600">Prepare future Friday briefings privately, attach the two PDF editions, record sources, and release only when ready.</p></div>
            <div className="flex gap-2"><Button variant="outline" onClick={() => { setSelectedId(null); setForm(emptyForm); }}><Plus className="mr-2 h-4 w-4" />New edition</Button><Button onClick={save} disabled={isBusy || !form.title}><Save className="mr-2 h-4 w-4" />Save edition</Button></div>
          </header>

          <section className="grid gap-6 lg:grid-cols-[280px_1fr]">
            <aside className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm"><div className="mb-3 flex items-center justify-between"><h2 className="font-semibold">Editions</h2><span className="text-xs text-slate-500">{editions.data?.length ?? 0} total</span></div><div className="space-y-2">{editions.data?.map(edition => <button key={edition.id} type="button" onClick={() => setSelectedId(edition.id)} className={`w-full rounded-xl border p-3 text-left transition ${selectedId === edition.id ? "border-indigo-900 bg-indigo-50" : "border-slate-200 hover:border-indigo-300"}`}><div className="flex items-center justify-between text-xs font-semibold uppercase tracking-wide text-slate-500"><span>Edition {String(edition.issueNumber).padStart(2, "0")}</span><span>{edition.status}</span></div><p className="mt-1 line-clamp-2 text-sm font-medium">{edition.title}</p></button>)}</div></aside>

            <div className="space-y-6">
              <div className="grid gap-4 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm md:grid-cols-2"><Field label="Issue number"><Input type="number" min="1" max="100" value={form.issueNumber} onChange={event => setField("issueNumber", event.target.value)} /></Field><Field label="Slug"><Input value={form.slug} placeholder="evidence-before-adjectives" onChange={event => setField("slug", event.target.value)} /></Field><Field label="Title" wide><Input value={form.title} onChange={event => setField("title", event.target.value)} placeholder="The Evidence Working Page" /></Field><Field label="Subtitle" wide><Textarea value={form.subtitle} onChange={event => setField("subtitle", event.target.value)} rows={2} /></Field><Field label="Summary" wide><Textarea value={form.summary} onChange={event => setField("summary", event.target.value)} rows={4} /></Field><Field label="Release status"><select className="h-10 w-full rounded-md border border-slate-300 bg-white px-3 text-sm" value={form.status} onChange={event => setField("status", event.target.value as FormState["status"])}><option value="draft">Draft / private</option><option value="scheduled">Scheduled</option><option value="published">Published</option><option value="archived">Archived</option></select></Field><Field label="Release time (UTC)"><Input type="datetime-local" value={form.releaseAt} onChange={event => setField("releaseAt", event.target.value)} /></Field><Field label="Preview PDF URL"><Input type="url" value={form.previewUrl} onChange={event => setField("previewUrl", event.target.value)} /></Field><Field label="Complete PDF URL"><Input type="url" value={form.completeUrl} onChange={event => setField("completeUrl", event.target.value)} /></Field><Field label="Private preview storage key"><Input value={form.previewKey} placeholder="career-weekly/edition-13/preview.pdf" onChange={event => setField("previewKey", event.target.value)} /></Field><Field label="Private complete storage key"><Input value={form.completeKey} placeholder="career-weekly/edition-13/complete.pdf" onChange={event => setField("completeKey", event.target.value)} /></Field><Field label="Preview pages"><Input type="number" min="1" value={form.previewPages} onChange={event => setField("previewPages", event.target.value)} /></Field><Field label="Complete pages"><Input type="number" min="1" value={form.completePages} onChange={event => setField("completePages", event.target.value)} /></Field><Field label="PDF masthead" wide><Input value={form.masthead} onChange={event => setField("masthead", event.target.value)} /></Field><Field label="Preview content (editor draft)" wide><Textarea value={form.previewContent} onChange={event => setField("previewContent", event.target.value)} rows={7} placeholder="Markdown or plain text for the 6-page preview edition." /></Field><Field label="Complete content (editor draft)" wide><Textarea value={form.completeContent} onChange={event => setField("completeContent", event.target.value)} rows={9} placeholder="Markdown or plain text for the complete edition." /></Field><Field label="Sources (one per line: Title | URL | Publisher)" wide><Textarea value={form.sources} onChange={event => setField("sources", event.target.value)} rows={5} placeholder="U.S. Department of Labor | https://www.dol.gov/ | U.S. Department of Labor" /></Field></div>

              {selectedId && <div className="flex flex-wrap gap-2 rounded-2xl border border-slate-200 bg-white p-5 shadow-sm"><Button variant="outline" onClick={() => publish.mutate({ id: selectedId })} disabled={isBusy}><Check className="mr-2 h-4 w-4" />Publish now</Button><Button variant="outline" onClick={() => form.releaseAt && schedule.mutate({ id: selectedId, releaseAt: new Date(form.releaseAt) })} disabled={isBusy || !form.releaseAt}><CalendarClock className="mr-2 h-4 w-4" />Schedule this edition</Button>{selected?.status === "scheduled" && <Button variant="outline" onClick={() => form.releaseAt && reschedule.mutate({ id: selectedId, releaseAt: new Date(form.releaseAt) })} disabled={isBusy || !form.releaseAt}><CalendarClock className="mr-2 h-4 w-4" />Reschedule</Button>}<Button variant="outline" onClick={() => pause.mutate({ id: selectedId })} disabled={isBusy}><Pause className="mr-2 h-4 w-4" />Pause / return to draft</Button><Button variant="outline" onClick={() => rollback.mutate({ id: selectedId })} disabled={isBusy}><Pause className="mr-2 h-4 w-4" />Rollback</Button></div>}

              <div className="rounded-2xl border border-indigo-200 bg-indigo-50 p-5"><div className="flex flex-col justify-between gap-4 md:flex-row md:items-center"><div><p className="text-xs font-semibold uppercase tracking-[0.2em] text-indigo-900">Friday release automation</p><h2 className="mt-1 text-lg font-semibold">08:00 UTC every Friday</h2><p className="mt-1 text-sm text-slate-600">Future editions stay private until their status and release time allow publication.</p></div><div className="flex flex-wrap gap-2">{control.data?.scheduleCronTaskUid ? <Button variant="outline" onClick={() => toggleSchedule.mutate({ enabled: !Boolean(control.data?.enabled) })}>{control.data.enabled ? <Pause className="mr-2 h-4 w-4" /> : <Play className="mr-2 h-4 w-4" />}{control.data.enabled ? "Pause schedule" : "Resume schedule"}</Button> : <Button onClick={() => setupSchedule.mutate()}><CalendarClock className="mr-2 h-4 w-4" />Create Friday schedule</Button>}</div></div><div className="mt-4 flex items-center gap-2 text-xs text-slate-600"><FileText className="h-4 w-4" />The scheduler publishes due editions; the editor remains the human override.</div></div>
            </div>
          </section>
        </div>
      </div>
    </DashboardLayout>
  );
}

function Field({ label, children, wide = false }: { label: string; children: React.ReactNode; wide?: boolean }) { return <label className={wide ? "space-y-1.5 md:col-span-2" : "space-y-1.5"}><span className="text-xs font-semibold uppercase tracking-wide text-slate-600">{label}</span>{children}</label>; }
