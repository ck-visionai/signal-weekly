/**
 * Signal Weekly Editor
 * Owner-only operational workspace. The public site retains the Executive Signal Desk aesthetic;
 * this page prioritises clear labels, safe saves and simple content administration.
 */
import { useAuth } from "@/_core/hooks/useAuth";
import DashboardLayout from "@/components/DashboardLayout";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { startLogin } from "@/const";
import { trpc } from "@/lib/trpc";
import { type SiteContent } from "@shared/siteContent";
import { contentBackupFilename, createContentBackup } from "@shared/contentBackup";
import { BookOpenText, Download, ExternalLink, FileUp, Link2, Loader2, Monitor, PanelTop, Save, Sparkles, UploadCloud } from "lucide-react";
import { ChangeEvent, useEffect, useMemo, useState } from "react";
import { toast } from "sonner";
import { useLocation } from "wouter";

const editorNav = [
  { icon: PanelTop, label: "Landing page", path: "/editor" },
  { icon: Monitor, label: "Briefing sections", path: "/editor/briefing" },
  { icon: BookOpenText, label: "Resources", path: "/editor/resources" },
  { icon: Link2, label: "Links & uploads", path: "/editor/actions" },
];

type EditorView = "landing" | "briefing" | "resources" | "actions";

function getView(location: string): EditorView {
  if (location === "/editor/resources") return "resources";
  if (location === "/editor/actions") return "actions";
  if (location === "/editor/briefing") return "briefing";
  return "landing";
}

function EditorField({ label, value, onChange, multiline = false, hint }: { label: string; value: string; onChange: (value: string) => void; multiline?: boolean; hint?: string }) {
  return (
    <label className="editor-field">
      <span>{label}</span>
      {multiline ? <Textarea value={value} onChange={(event) => onChange(event.target.value)} rows={4} /> : <Input value={value} onChange={(event) => onChange(event.target.value)} />}
      {hint ? <small>{hint}</small> : null}
    </label>
  );
}

function EditorCard({ title, intro, children }: { title: string; intro: string; children: React.ReactNode }) {
  return <section className="editor-card"><div className="editor-card-header"><h2>{title}</h2><p>{intro}</p></div><div className="editor-card-fields">{children}</div></section>;
}

export default function Editor() {
  const [location] = useLocation();
  const view = getView(location);
  const { user, loading } = useAuth();
  const isAdmin = user?.role === "admin";
  const editorContent = trpc.content.editor.useQuery(undefined, { enabled: Boolean(isAdmin), retry: false });
  const saveContent = trpc.content.save.useMutation();
  const uploadAsset = trpc.content.uploadAsset.useMutation();
  const [content, setContent] = useState<SiteContent | null>(null);
  const [lastUploadUrl, setLastUploadUrl] = useState("");

  useEffect(() => {
    if (editorContent.data) setContent(editorContent.data);
  }, [editorContent.data]);

  const heading = useMemo(() => ({
    landing: ["Landing page", "Edit the identity, hero and closing call-to-action on the public briefing."],
    briefing: ["Briefing sections", "Update the three promise cards, archive preview and rotating career prompts."],
    resources: ["Resources library", "Manage the published guide and clearly-labelled future library items."],
    actions: ["Links & uploads", "Update ATS and training destinations, then upload approved PDFs or images."],
  } satisfies Record<EditorView, [string, string]>)[view], [view]);

  const save = async () => {
    if (!content) return;
    try {
      await saveContent.mutateAsync(content);
      toast.success("Saved. The public website will now use these changes.");
      await editorContent.refetch();
    } catch (error) {
      toast.error(error instanceof Error ? error.message : "The changes could not be saved.");
    }
  };

  const upload = async (event: ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    event.target.value = "";
    if (!file) return;
    const allowed = ["application/pdf", "image/jpeg", "image/png", "image/webp"];
    if (!allowed.includes(file.type) || file.size > 10 * 1024 * 1024) {
      toast.error("Choose a PDF, JPG, PNG or WebP image smaller than 10 MB.");
      return;
    }
    const reader = new FileReader();
    reader.onload = async () => {
      try {
        const dataUrl = String(reader.result ?? "");
        const base64 = dataUrl.split(",")[1];
        if (!base64) throw new Error("The file could not be read.");
        const result = await uploadAsset.mutateAsync({ fileName: file.name, contentType: file.type as "application/pdf" | "image/jpeg" | "image/png" | "image/webp", base64 });
        setLastUploadUrl(result.url);
        await navigator.clipboard?.writeText(result.url);
        toast.success("Upload complete. Its site URL has been copied for you.");
      } catch (error) {
        toast.error(error instanceof Error ? error.message : "The upload could not be completed.");
      }
    };
    reader.readAsDataURL(file);
  };

  const downloadBackup = () => {
    if (!content) return;
    const blob = new Blob([createContentBackup(content)], { type: "text/markdown;charset=utf-8" });
    const url = URL.createObjectURL(blob);
    const link = document.createElement("a");
    link.href = url;
    link.download = contentBackupFilename();
    document.body.appendChild(link);
    link.click();
    link.remove();
    URL.revokeObjectURL(url);
    toast.success("Content backup downloaded. Store it somewhere private.");
  };

  if (loading) return <div className="editor-loading"><Loader2 className="animate-spin" /> Loading your editor…</div>;
  if (!user) {
    return <main className="editor-gate"><div><span className="editor-kicker">SIGNAL WEEKLY / OWNER ACCESS</span><h1>Your content desk is protected.</h1><p>Sign in with the owner account to edit the landing page, downloads and public links.</p><Button onClick={() => startLogin()}><Sparkles size={16} /> Sign in to the editor</Button><a href="/">Return to the public site <ExternalLink size={14} /></a></div></main>;
  }
  if (!isAdmin) return <main className="editor-gate"><div><span className="editor-kicker">ACCESS RESTRICTED</span><h1>This workspace is for the Signal Weekly owner.</h1><p>You are signed in, but this account is not authorised to edit the site.</p><a href="/">Return to the public site <ExternalLink size={14} /></a></div></main>;
  if (editorContent.isLoading || !content) return <div className="editor-loading"><Loader2 className="animate-spin" /> Loading editable content…</div>;

  return (
    <DashboardLayout menuItems={editorNav} title="Signal Weekly Editor">
      <div className="editor-shell">
        <header className="editor-page-header"><div><span className="editor-kicker">OWNER WORKSPACE</span><h1>{heading[0]}</h1><p>{heading[1]}</p></div><div className="editor-header-actions"><a href="/" target="_blank" rel="noreferrer">View live site <ExternalLink size={14} /></a><Button variant="outline" onClick={downloadBackup}><Download size={16} /> Download backup</Button><Button onClick={save} disabled={saveContent.isPending}><Save size={16} /> {saveContent.isPending ? "Saving…" : "Save changes"}</Button></div></header>

        {view === "landing" ? <>
          <EditorCard title="Brand & contact" intro="The identity that appears in the header and footer.">
            <EditorField label="Publication name" value={content.identity.brandName} onChange={(value) => setContent({ ...content, identity: { ...content.identity, brandName: value } })} />
            <EditorField label="Endorsement" value={content.identity.endorsement} onChange={(value) => setContent({ ...content, identity: { ...content.identity, endorsement: value } })} />
            <EditorField label="Management line" value={content.identity.managementLine} multiline onChange={(value) => setContent({ ...content, identity: { ...content.identity, managementLine: value } })} />
            <EditorField label="Footer tagline" value={content.identity.footerTagline} multiline onChange={(value) => setContent({ ...content, identity: { ...content.identity, footerTagline: value } })} />
            <EditorField label="Footer microcopy" value={content.identity.footerMeta} onChange={(value) => setContent({ ...content, identity: { ...content.identity, footerMeta: value } })} />
            <EditorField label="Copyright label" value={content.identity.copyrightLabel} onChange={(value) => setContent({ ...content, identity: { ...content.identity, copyrightLabel: value } })} />
            <EditorField label="Contact email" value={content.identity.contactEmail} onChange={(value) => setContent({ ...content, identity: { ...content.identity, contactEmail: value } })} />
            <EditorField label="Publication logo URL" value={content.identity.logoUrl} onChange={(value) => setContent({ ...content, identity: { ...content.identity, logoUrl: value } })} hint="Upload a new PNG or WebP in Links & uploads, then paste its generated URL here." />
          </EditorCard>
          <EditorCard title="Hero briefing" intro="The opening section visitors see before the signup form.">
            <EditorField label="Small heading" value={content.hero.eyebrow} onChange={(value) => setContent({ ...content, hero: { ...content.hero, eyebrow: value } })} />
            <EditorField label="Main headline" value={content.hero.headline} onChange={(value) => setContent({ ...content, hero: { ...content.hero, headline: value } })} />
            <EditorField label="Blue emphasis" value={content.hero.emphasis} onChange={(value) => setContent({ ...content, hero: { ...content.hero, emphasis: value } })} />
            <EditorField label="Introductory paragraph" value={content.hero.intro} multiline onChange={(value) => setContent({ ...content, hero: { ...content.hero, intro: value } })} />
            <EditorField label="Current issue number" value={content.hero.issueNumber} onChange={(value) => setContent({ ...content, hero: { ...content.hero, issueNumber: value } })} />
            <EditorField label="Current issue reading time" value={content.hero.issueReadTime} onChange={(value) => setContent({ ...content, hero: { ...content.hero, issueReadTime: value } })} />
            <EditorField label="Current issue label" value={content.hero.issueKicker} onChange={(value) => setContent({ ...content, hero: { ...content.hero, issueKicker: value } })} />
            <EditorField label="Current issue title" value={content.hero.issueTitle} multiline onChange={(value) => setContent({ ...content, hero: { ...content.hero, issueTitle: value } })} />
            <EditorField label="Lead download title" value={content.hero.leadTitle} onChange={(value) => setContent({ ...content, hero: { ...content.hero, leadTitle: value } })} />
            <EditorField label="Lead download label" value={content.hero.leadButtonLabel} onChange={(value) => setContent({ ...content, hero: { ...content.hero, leadButtonLabel: value } })} />
            <EditorField label="Lead download URL" value={content.hero.leadUrl} onChange={(value) => setContent({ ...content, hero: { ...content.hero, leadUrl: value } })} />
            <EditorField label="Hero image URL" value={content.hero.imageUrl} onChange={(value) => setContent({ ...content, hero: { ...content.hero, imageUrl: value } })} hint="Upload an approved JPG, PNG or WebP in Links & uploads, then paste its generated URL here." />
            <EditorField label="Hero image description" value={content.hero.imageAlt} onChange={(value) => setContent({ ...content, hero: { ...content.hero, imageAlt: value } })} hint="This supports visitors who use a screen reader." />
            <EditorField label="Signup offer line" value={content.hero.signupOfferLabel} onChange={(value) => setContent({ ...content, hero: { ...content.hero, signupOfferLabel: value } })} hint="The short line immediately above the email signup form." />
            <EditorField label="Signup disclosure" value={content.hero.formNote} multiline onChange={(value) => setContent({ ...content, hero: { ...content.hero, formNote: value } })} hint="Keep the Privacy Policy statement accurate." />
            <EditorField label="Privacy Policy link label" value={content.hero.formPrivacyLinkLabel} onChange={(value) => setContent({ ...content, hero: { ...content.hero, formPrivacyLinkLabel: value } })} />
            <EditorField label="Issue card action" value={content.hero.issueOpenLabel} onChange={(value) => setContent({ ...content, hero: { ...content.hero, issueOpenLabel: value } })} />
            <EditorField label="Lead-download screen-reader label" value={content.hero.leadAriaLabel} onChange={(value) => setContent({ ...content, hero: { ...content.hero, leadAriaLabel: value } })} />
            <EditorField label="Publishing frequency" value={content.hero.frequency} onChange={(value) => setContent({ ...content, hero: { ...content.hero, frequency: value } })} />
            <EditorField label="Audience line" value={content.hero.audience} onChange={(value) => setContent({ ...content, hero: { ...content.hero, audience: value } })} />
          </EditorCard>
          <EditorCard title="Positioning line" intro="The restrained statement below the hero that explains Signal Weekly’s point of view.">
            <EditorField label="Opening phrase" value={content.quiet.prefix} onChange={(value) => setContent({ ...content, quiet: { ...content.quiet, prefix: value } })} />
            <EditorField label="Bold emphasis" value={content.quiet.emphasis} onChange={(value) => setContent({ ...content, quiet: { ...content.quiet, emphasis: value } })} />
          </EditorCard>
          <EditorCard title="What you will get" intro="The introduction shown before the three public career-guidance cards.">
            <EditorField label="Small heading" value={content.inside.eyebrow} onChange={(value) => setContent({ ...content, inside: { ...content.inside, eyebrow: value } })} />
            <EditorField label="Heading" value={content.inside.heading} onChange={(value) => setContent({ ...content, inside: { ...content.inside, heading: value } })} />
            <EditorField label="Blue emphasis" value={content.inside.emphasis} onChange={(value) => setContent({ ...content, inside: { ...content.inside, emphasis: value } })} />
            <EditorField label="Introduction" value={content.inside.intro} multiline onChange={(value) => setContent({ ...content, inside: { ...content.inside, intro: value } })} />
          </EditorCard>
          <EditorCard title="Closing invitation" intro="The final call-to-action before the footer.">
            <EditorField label="Small heading" value={content.closing.eyebrow} onChange={(value) => setContent({ ...content, closing: { ...content.closing, eyebrow: value } })} />
            <EditorField label="Heading" value={content.closing.heading} onChange={(value) => setContent({ ...content, closing: { ...content.closing, heading: value } })} />
            <EditorField label="Blue emphasis" value={content.closing.emphasis} onChange={(value) => setContent({ ...content, closing: { ...content.closing, emphasis: value } })} />
            <EditorField label="Description" value={content.closing.description} multiline onChange={(value) => setContent({ ...content, closing: { ...content.closing, description: value } })} />
            <EditorField label="Button label" value={content.closing.ctaLabel} onChange={(value) => setContent({ ...content, closing: { ...content.closing, ctaLabel: value } })} />
            <EditorField label="Briefing artifact name" value={content.closing.artifactName} onChange={(value) => setContent({ ...content, closing: { ...content.closing, artifactName: value } })} />
            <EditorField label="Briefing artifact schedule" value={content.closing.artifactSchedule} onChange={(value) => setContent({ ...content, closing: { ...content.closing, artifactSchedule: value } })} />
            <EditorField label="Briefing artifact title" value={content.closing.artifactTitle} onChange={(value) => setContent({ ...content, closing: { ...content.closing, artifactTitle: value } })} />
            <EditorField label="Briefing artifact audience" value={content.closing.artifactAudience} onChange={(value) => setContent({ ...content, closing: { ...content.closing, artifactAudience: value } })} />
            {content.closing.metaItems.map((item, index) => <EditorField key={index} label={`Closing note ${index + 1}`} value={item} onChange={(value) => setContent({ ...content, closing: { ...content.closing, metaItems: content.closing.metaItems.map((current, currentIndex) => currentIndex === index ? value : current) } })} />)}
          </EditorCard>
          <EditorCard title="Navigation & footer labels" intro="Short labels used in menus, public links and the closing footer.">
            <EditorField label="Inside navigation" value={content.navigation.insideLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, insideLabel: value } })} /><EditorField label="Sample navigation" value={content.navigation.sampleLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, sampleLabel: value } })} /><EditorField label="Resources navigation" value={content.navigation.resourcesLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, resourcesLabel: value } })} /><EditorField label="Subscribe button" value={content.navigation.subscribeLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, subscribeLabel: value } })} /><EditorField label="Archive link" value={content.navigation.browseArchiveLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, browseArchiveLabel: value } })} /><EditorField label="Value-card action" value={content.navigation.valueCtaLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, valueCtaLabel: value } })} /><EditorField label="No-script subscribe action" value={content.navigation.fallbackSubscribeLabel} onChange={(value) => setContent({ ...content, navigation: { ...content.navigation, fallbackSubscribeLabel: value } })} /><EditorField label="Footer: Explore" value={content.footer.exploreLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, exploreLabel: value } })} /><EditorField label="Footer: Elsewhere" value={content.footer.elsewhereLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, elsewhereLabel: value } })} /><EditorField label="Footer: Legal" value={content.footer.legalLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, legalLabel: value } })} /><EditorField label="Footer: Sample issues" value={content.footer.sampleLinkLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, sampleLinkLabel: value } })} /><EditorField label="Footer: What you’ll get" value={content.footer.insideLinkLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, insideLinkLabel: value } })} /><EditorField label="Footer: ATS guide" value={content.footer.atsLinkLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, atsLinkLabel: value } })} /><EditorField label="Footer: Live training" value={content.footer.liveTrainingLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, liveTrainingLabel: value } })} /><EditorField label="Footer: LinkedIn" value={content.footer.linkedinLinkLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, linkedinLinkLabel: value } })} /><EditorField label="Footer: Contact" value={content.footer.contactLinkLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, contactLinkLabel: value } })} /><EditorField label="Footer: Privacy Policy" value={content.footer.privacyLinkLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, privacyLinkLabel: value } })} /><EditorField label="Footer: Back to top" value={content.footer.backToTopLabel} onChange={(value) => setContent({ ...content, footer: { ...content.footer, backToTopLabel: value } })} />
          </EditorCard>
        </> : null}

        {view === "briefing" ? <>
          <EditorCard title="What you will get" intro="Three practical promise cards on the public landing page.">
            {content.pillars.map((pillar, index) => <div className="editor-repeater" key={pillar.index}><b>Card {index + 1}</b><EditorField label="Label" value={pillar.label} onChange={(value) => setContent({ ...content, pillars: content.pillars.map((item, itemIndex) => itemIndex === index ? { ...item, label: value } : item) })} /><EditorField label="Heading" value={pillar.title} onChange={(value) => setContent({ ...content, pillars: content.pillars.map((item, itemIndex) => itemIndex === index ? { ...item, title: value } : item) })} /><EditorField label="Description" value={pillar.text} multiline onChange={(value) => setContent({ ...content, pillars: content.pillars.map((item, itemIndex) => itemIndex === index ? { ...item, text: value } : item) })} /><EditorField label="Optional image URL" value={pillar.imageUrl} onChange={(value) => setContent({ ...content, pillars: content.pillars.map((item, itemIndex) => itemIndex === index ? { ...item, imageUrl: value } : item) })} /></div>)}
          </EditorCard>
          <EditorCard title="Archive preview" intro="The editorial sample issue shown in the dark section.">
            <EditorField label="Small heading" value={content.archive.eyebrow} onChange={(value) => setContent({ ...content, archive: { ...content.archive, eyebrow: value } })} /><EditorField label="Heading" value={content.archive.heading} onChange={(value) => setContent({ ...content, archive: { ...content.archive, heading: value } })} /><EditorField label="Blue emphasis" value={content.archive.emphasis} onChange={(value) => setContent({ ...content, archive: { ...content.archive, emphasis: value } })} /><EditorField label="Main card label" value={content.archive.leadLabel} onChange={(value) => setContent({ ...content, archive: { ...content.archive, leadLabel: value } })} /><EditorField label="Main card title" value={content.archive.leadTitle} multiline onChange={(value) => setContent({ ...content, archive: { ...content.archive, leadTitle: value } })} /><EditorField label="Main card description" value={content.archive.leadDescription} multiline onChange={(value) => setContent({ ...content, archive: { ...content.archive, leadDescription: value } })} /><EditorField label="Main card annotation" value={content.archive.annotationLabel} onChange={(value) => setContent({ ...content, archive: { ...content.archive, annotationLabel: value } })} />
            {content.archive.sideBriefs.map((brief, index) => <div className="editor-repeater" key={brief.label}><b>Side brief {index + 1}</b><EditorField label="Label" value={brief.label} onChange={(value) => setContent({ ...content, archive: { ...content.archive, sideBriefs: content.archive.sideBriefs.map((item, itemIndex) => itemIndex === index ? { ...item, label: value } : item) } })} /><EditorField label="Title" value={brief.title} onChange={(value) => setContent({ ...content, archive: { ...content.archive, sideBriefs: content.archive.sideBriefs.map((item, itemIndex) => itemIndex === index ? { ...item, title: value } : item) } })} /></div>)}
          </EditorCard>
          <EditorCard title="Career prompts" intro="The three rotating prompts beneath the archive sample.">
            <EditorField label="Small heading" value={content.practice.eyebrow} onChange={(value) => setContent({ ...content, practice: { ...content.practice, eyebrow: value } })} /><EditorField label="Section intro" value={content.practice.intro} multiline onChange={(value) => setContent({ ...content, practice: { ...content.practice, intro: value } })} />
            {content.practice.slides.map((slide, index) => <div className="editor-repeater" key={slide.eyebrow}><b>Prompt {index + 1}</b><EditorField label="Small heading" value={slide.eyebrow} onChange={(value) => setContent({ ...content, practice: { ...content.practice, slides: content.practice.slides.map((item, itemIndex) => itemIndex === index ? { ...item, eyebrow: value } : item) } })} /><EditorField label="Title" value={slide.title} multiline onChange={(value) => setContent({ ...content, practice: { ...content.practice, slides: content.practice.slides.map((item, itemIndex) => itemIndex === index ? { ...item, title: value } : item) } })} /><EditorField label="Description" value={slide.description} multiline onChange={(value) => setContent({ ...content, practice: { ...content.practice, slides: content.practice.slides.map((item, itemIndex) => itemIndex === index ? { ...item, description: value } : item) } })} /><EditorField label="Bottom note" value={slide.note} onChange={(value) => setContent({ ...content, practice: { ...content.practice, slides: content.practice.slides.map((item, itemIndex) => itemIndex === index ? { ...item, note: value } : item) } })} /></div>)}
          </EditorCard>
        </> : null}

        {view === "resources" ? <>
          <EditorCard title="Library introduction" intro="The entry point to the public Resources page.">
            <EditorField label="Small heading" value={content.resources.eyebrow} onChange={(value) => setContent({ ...content, resources: { ...content.resources, eyebrow: value } })} /><EditorField label="Heading" value={content.resources.title} onChange={(value) => setContent({ ...content, resources: { ...content.resources, title: value } })} /><EditorField label="Blue emphasis" value={content.resources.emphasis} onChange={(value) => setContent({ ...content, resources: { ...content.resources, emphasis: value } })} /><EditorField label="Introduction" value={content.resources.intro} multiline onChange={(value) => setContent({ ...content, resources: { ...content.resources, intro: value } })} />
          </EditorCard>
          <EditorCard title="Featured guide" intro="Keep the URL public and make sure the details match the actual download.">
            <EditorField label="Resource number" value={content.resources.featured.number} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, number: value } } })} /><EditorField label="Availability label" value={content.resources.featured.status} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, status: value } } })} /><EditorField label="Category" value={content.resources.featured.category} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, category: value } } })} /><EditorField label="Guide title" value={content.resources.featured.title} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, title: value } } })} /><EditorField label="Guide description" value={content.resources.featured.description} multiline onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, description: value } } })} /><EditorField label="Review time" value={content.resources.featured.reviewTime} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, reviewTime: value } } })} /><EditorField label="Format" value={content.resources.featured.format} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, format: value } } })} /><EditorField label="Proof point" value={content.resources.featured.proofPoint} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, proofPoint: value } } })} /><EditorField label="Download button label" value={content.resources.featured.downloadLabel} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, downloadLabel: value } } })} /><EditorField label="Download URL" value={content.resources.featured.downloadUrl} onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, downloadUrl: value } } })} /><EditorField label="Outcome note" value={content.resources.featured.note} multiline onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, note: value } } })} />
            {content.resources.featured.bullets.map((bullet, index) => <EditorField key={index} label={`Guide point ${index + 1}`} value={bullet} multiline onChange={(value) => setContent({ ...content, resources: { ...content.resources, featured: { ...content.resources.featured, bullets: content.resources.featured.bullets.map((item, itemIndex) => itemIndex === index ? value : item) } } })} />)}
          </EditorCard>
          <EditorCard title="Future guides" intro="Label unfinished material honestly until a real download is published.">
            {content.resources.upcoming.map((resource, index) => <div className="editor-repeater" key={resource.title}><b>Library guide {index + 1}</b><EditorField label="Status" value={resource.status} onChange={(value) => setContent({ ...content, resources: { ...content.resources, upcoming: content.resources.upcoming.map((item, itemIndex) => itemIndex === index ? { ...item, status: value } : item) } })} /><EditorField label="Title" value={resource.title} onChange={(value) => setContent({ ...content, resources: { ...content.resources, upcoming: content.resources.upcoming.map((item, itemIndex) => itemIndex === index ? { ...item, title: value } : item) } })} /><EditorField label="Summary" value={resource.summary} multiline onChange={(value) => setContent({ ...content, resources: { ...content.resources, upcoming: content.resources.upcoming.map((item, itemIndex) => itemIndex === index ? { ...item, summary: value } : item) } })} /><EditorField label="Download URL" value={resource.downloadUrl} onChange={(value) => setContent({ ...content, resources: { ...content.resources, upcoming: content.resources.upcoming.map((item, itemIndex) => itemIndex === index ? { ...item, downloadUrl: value } : item) } })} hint="Leave blank for an in-development guide. Enter a real file URL only when it is ready to download." /></div>)}
          </EditorCard>
        </> : null}

        {view === "actions" ? <>
          <EditorCard title="Redirect destinations" intro="These URLs are used for downloads and the future live-training call-to-action.">
            <EditorField label="ATS / lead download URL" value={content.links.atsUrl} onChange={(value) => setContent({ ...content, links: { ...content.links, atsUrl: value }, hero: { ...content.hero, leadUrl: value }, resources: { ...content.resources, featured: { ...content.resources.featured, downloadUrl: value } } })} hint="Changing this updates the hero download and featured guide together." /><EditorField label="Live-training URL" value={content.links.liveTrainingUrl} onChange={(value) => setContent({ ...content, links: { ...content.links, liveTrainingUrl: value } })} hint="Leave blank until a real session link is ready." /><EditorField label="LinkedIn URL" value={content.links.linkedinUrl} onChange={(value) => setContent({ ...content, links: { ...content.links, linkedinUrl: value } })} />
          </EditorCard>
          <EditorCard title="Upload a PDF or image" intro="Upload a future guide or page image, then paste the generated site URL into the relevant field and save.">
            <div className="editor-upload"><FileUp size={24} /><div><Label htmlFor="editor-upload">Choose a PDF, JPG, PNG or WebP</Label><p>Maximum file size: 10 MB. The upload is only available to the owner account.</p></div><Input id="editor-upload" type="file" accept="application/pdf,image/jpeg,image/png,image/webp" onChange={upload} disabled={uploadAsset.isPending} /></div>
            {uploadAsset.isPending ? <p className="editor-upload-state"><Loader2 className="animate-spin" size={15} /> Uploading securely…</p> : null}
            {lastUploadUrl ? <div className="editor-upload-result"><UploadCloud size={17} /><div><strong>Last upload URL</strong><code>{lastUploadUrl}</code></div></div> : null}
          </EditorCard>
          <EditorCard title="Download a content backup" intro="Save a readable copy of every editor-managed text field, public resource and redirect link before important changes.">
            <div className="editor-backup-action"><p>The backup does not contain Beehiiv subscribers, passwords or domain-account details. Keep the downloaded file in a private location such as Google Drive.</p><Button variant="outline" onClick={downloadBackup}><Download size={16} /> Download content backup</Button></div>
          </EditorCard>
        </> : null}

        <footer className="editor-save-footer"><span>Changes stay in your editor until you select <strong>Save changes</strong>.</span><Button onClick={save} disabled={saveContent.isPending}><Save size={16} /> Save changes</Button></footer>
      </div>
    </DashboardLayout>
  );
}
