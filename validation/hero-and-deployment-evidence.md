# Hero and Deployment Evidence

## Hero treatment

The verified public hero uses the intended asymmetric editorial composition: copy and the working-professional eyebrow occupy the left column, while the cleaned desk image and floating “Evidence Before Adjectives” brief card occupy the right visual column. The headline is the large DM Serif Display treatment with the navy emphasis word `overlook`; the supporting paragraph remains left aligned; the image is contained in the rounded `.hero-image-frame`; and the floating `.hero-issue-card` remains layered over the lower-left edge of the image.

Responsive captures were taken at 1280×720 and 375×812. At desktop width the two-column composition remains balanced. At mobile width the headline wraps without horizontal overflow, the hero image moves below the copy, and the navigation collapses to the menu control. The screenshot evidence is retained in the WebDev checkpoint preview.

The current hero asset is the project-scoped `/manus-storage/career-weekly-hero-clean_c77cf438.png` reference used by `shared/siteContent.ts` and rendered by `client/src/pages/Home.tsx`. The inspected source copy is 2176×1632 pixels and visibly contains a text-free cream desk, stacked blank paper/resume sheets, blue card stock, and fountain pens; it contains no pencil scribbles, circles, or embedded copy. This provides the requested resume/work-planning context without fabricating text inside the image. The floating brief card supplies the readable “Evidence Before Adjectives” context in the UI.

## Post-deployment Friday release

The application already exposes `POST /api/scheduled/release-friday-edition` and stores the six-field UTC cron expression `0 0 8 * * 5`, meaning Friday at 08:00 UTC. The editor exposes setup, pause/resume, reschedule, manual publish, and rollback controls. Because the scheduling service requires the production URL, the final platform activation must occur only after deployment.

After clicking Publish in the WebDev Management UI, activate the existing project-level Heartbeat job with the `manus-heartbeat` workflow using the callback path `/api/scheduled/release-friday-edition`, cron `0 0 8 * * 5`, and the description “Automatically publish due Career Weekly editions every Friday at 08:00 UTC.” Confirm the returned task UID is stored in the `releaseControls.scheduleCronTaskUid` field. Then use the editor or Heartbeat management view to verify that the job is enabled, its callback path is correct, and its next execution is a Friday at 08:00 UTC. For a safe operational check, schedule one draft edition with a test release time, use the editor’s manual publish or pause control as appropriate, and confirm the resulting edition status in the editor before relying on the first automatic run.
