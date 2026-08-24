# Signal Weekly — GitHub Administrator Guide

> **Purpose:** This guide lets a non-technical administrator safely update the live Signal Weekly landing page at `signrl.com` / `www.signrl.com` using only the GitHub website. You do **not** need to install software or write code for routine text and image changes.

> **Important:** Signal Weekly is a custom React website, not a drag-and-drop website builder. You can edit it in GitHub, but a small typing mistake in code can stop a page from building. Follow the “safe workflow” in this guide every time: **create a branch → make one focused change → open a pull request → merge → check Actions → check the live site**.

## 1. Your website at a glance

| Item | Current detail |
|---|---|
| GitHub repository | [`ck-visionai/signrl`](https://github.com/ck-visionai/signrl) |
| Website | [`https://signrl.com`](https://signrl.com) and [`https://www.signrl.com`](https://www.signrl.com) |
| Publishing system | GitHub Pages, deployed by GitHub Actions |
| Primary landing-page file | `client/src/pages/Home.tsx` |
| Privacy Policy file | `client/src/pages/Privacy.tsx` |
| Visual styling file | `client/src/index.css` |
| Deployment workflow | `.github/workflows/deploy-pages.yml` |
| Newsletter form | Beehiiv embedded form — already connected |

When a change reaches the **main** branch, GitHub automatically runs the workflow named **Deploy Signal Weekly to GitHub Pages**. It installs the site’s existing dependencies, creates a static website build, then publishes the result to GitHub Pages.

## 2. The six words to know

| Word | Plain-English meaning |
|---|---|
| **Repository** | The online folder that contains the website. |
| **File** | One part of the website, such as its homepage words or styling. |
| **Branch** | A safe draft copy of the website where you make a change before it goes live. |
| **Commit** | A saved record of one change, with a short description. |
| **Pull request (PR)** | A review page that shows what would change before you publish it. |
| **Main** | The live version of the website. A merged change to `main` triggers publication. |

## 3. The safety rules — read once, follow always

1. **Change one subject at a time.** For example, update a headline *or* replace an image, rather than making many unrelated edits in one session.
2. **Use a new branch and pull request** for every change. This keeps the live version safe and gives you an easy record of what changed.
3. **Never edit these files unless a developer gives you exact instructions:**

   ```text
   .github/workflows/deploy-pages.yml
   package.json
   pnpm-lock.yaml
   vite.config.ts
   client/src/main.tsx
   client/public/404.html
   ```

4. **Do not delete files** to make a page disappear. Ask for help instead.
5. **Never put passwords, API keys, login details, payment details, or private subscriber lists into GitHub.** The repository is public, so anything committed can be seen by other people.
6. **Do not change GitHub Pages, DNS, Porkbun records, or the Beehiiv form script for ordinary content edits.** Those settings are already working.

## 4. The safe workflow for every edit

GitHub allows files to be edited directly in the browser, and its file editor gives you a **Preview** option before you commit. [1]

### Step A — Open the correct website repository

1. Sign in at [github.com](https://github.com) using the GitHub account **`ck-visionai`**.
2. Open [`https://github.com/ck-visionai/signrl`](https://github.com/ck-visionai/signrl).
3. Check that the repository title says **ck-visionai / signrl**.
4. Confirm that the branch dropdown says **main** before creating your new branch.

### Step B — Create a branch before touching a file

1. Near the top-left of the file list, click the button that says **main**.
2. In the search box, type a helpful name such as:

   ```text
   update-hero-headline
   replace-hero-image
   update-privacy-policy
   ```

3. Click **Create branch: [your branch name] from main**.
4. You are now working safely in your draft branch, not on the live website.

### Step C — Make only the planned change

Open the appropriate file from the tables later in this guide. Click the small **pencil icon** to edit it. Change only the words, image address, or line described in your plan. GitHub’s documentation recommends previewing the change before saving and using a meaningful commit message. [1]

### Step D — Save your change as a commit

At the bottom of the page:

1. Enter a short message such as `Update hero headline` or `Replace résumé card image`.
2. Confirm that GitHub is saving to **your new branch**, not directly to `main`.
3. Click **Commit changes** or **Propose changes**.

### Step E — Open a pull request

After saving, GitHub usually shows a green **Compare & pull request** button. Click it.

1. Give the pull request a clear title, such as `Update Signal Weekly headline`.
2. In the description, write one sentence explaining the change.
3. Click **Create pull request**.
4. Read the **Files changed** tab. If you see unexpected deletions or a large amount of code changed, do **not** merge. Ask for help.

### Step F — Publish the change

If the PR contains exactly the change you intended:

1. Click **Merge pull request**.
2. Click **Confirm merge**.
3. You may click **Delete branch** afterward; this only deletes the temporary draft branch, not your website.

> A merge into `main` starts the live deployment automatically. You do not need to upload the website separately.

## 5. Where to edit common content

| What you want to change | File to open | Safe for a beginner? | Notes |
|---|---|---:|---|
| Homepage headline, subheading, cards, sample issue text, footer wording | `client/src/pages/Home.tsx` | Yes, carefully | Change text only; do not remove brackets, `<` or `>` symbols. |
| Privacy Policy | `client/src/pages/Privacy.tsx` | Yes, carefully | Use factual, approved business information only. |
| Main page title shown in the browser tab | `client/index.html` | Yes, carefully | Update the `<title>` text only. |
| Homepage colour, spacing, font size, layout | `client/src/index.css` | Not recommended without help | One punctuation error can change the design widely. |
| Add/remove a whole page or menu item | `client/src/App.tsx` and page files | Ask for help | This involves routes and links. |
| Newsletter signup form | `client/src/pages/Home.tsx` | Ask for help | It is connected to Beehiiv. Do not edit the form-script ID. |
| GitHub Pages build/deployment | `.github/workflows/deploy-pages.yml` | No | Leave untouched. |

## 6. How to change homepage words safely

### Example: change the hero headline

1. In your branch, open `client` → `src` → `pages` → `Home.tsx`.
2. Click the pencil icon.
3. Press **Ctrl + F** (Windows) or **Command + F** (Mac) and search for a unique part of the current headline, for example:

   ```text
   A sharper search starts
   ```

4. You will find a line similar to:

   ```tsx
   <h1 id="hero-title">A sharper search starts with a better <em>signal.</em></h1>
   ```

5. Replace only the words between `>` and `<`. Keep `<h1 ...>`, `</h1>`, `<em>` and `</em>` exactly where they are unless you have been told otherwise.
6. Use GitHub’s **Preview** tab if available, then commit to your branch and create a PR using the safe workflow above.

### Simple text-editing rules

| Do | Do not |
|---|---|
| Replace a sentence between quotation marks or HTML tags | Remove symbols such as `{`, `}`, `<`, `>`, `/`, `(`, `)` or `;` |
| Keep the opening and closing tags paired | Copy text from Word with unusual quotation marks or hidden formatting |
| Change one section, commit, then review it | Alter several areas in one large commit |
| Use plain apostrophes (`'`) and normal quotation marks (`"`) inside code | Rename variables, import lines or image component names |

## 7. How to change visuals and images

### Before uploading an image

Prepare the file first. Use **JPG, PNG, or WebP**. Rename it using only lowercase letters, numbers and hyphens, for example:

```text
signrl-executive-desk.jpg
ats-resume-guide.png
salary-negotiation-card.webp
```

Avoid spaces, punctuation, emojis and names such as `final-final-2.jpg`. Keep a copy of the original image on your computer. For web speed, aim for a file below **2 MB** when practical. GitHub’s browser uploader permits files up to 25 MiB, but a smaller web-ready image helps visitors load the site faster. [2]

### Upload an image to the repository

1. Create your draft branch first.
2. Open `client` → `public`.
3. Click **Add file** → **Upload files**.
4. Choose your prepared image.
5. Commit it to your draft branch with a message such as `Upload new hero image`.

GitHub’s website supports uploads through **Add file → Upload files** or drag-and-drop. [2]

### Put the uploaded image onto the homepage

1. Open `client/src/pages/Home.tsx` in the **same branch**.
2. Use Ctrl/Command + F to find the section you are replacing. Helpful searches include:

   ```text
   Elegant executive desk
   The Executive Résumé Audit
   RÉSUMÉ SIGNAL
   ```

3. Find the image line. It will look similar to this:

   ```tsx
   <img src="https://files.manuscdn.com/..." alt="Elegant executive desk with layered papers and cobalt pen" />
   ```

4. Replace only the address after `src=` with the new local address. If you uploaded `signrl-executive-desk.jpg` to `client/public`, use:

   ```tsx
   <img src="/signrl-executive-desk.jpg" alt="Career documents and a cobalt pen on an executive desk" />
   ```

5. Update the text after `alt=` to describe the new image in plain English. This helps visitors using screen readers.
6. Commit this as a **separate** change if possible, then open a PR.

> **Do not delete the existing image address until the new image is uploaded.** Exact spelling matters: `/hero.jpg` and `/Hero.jpg` are different addresses on the published site.

### Use these image sizes as a starting point

| Area | Suggested shape | Practical starting size |
|---|---|---|
| Main hero desk image | Landscape | 1600 × 1000 px |
| Three-card image | Landscape | 1200 × 800 px |
| Logo/mark | Square PNG or SVG | At least 800 × 800 px |
| Social sharing image | Wide landscape | 1200 × 630 px |
| Downloadable worksheet/PDF | PDF | Keep under 10 MB where possible |

## 8. How to upload a PDF, guide, or downloadable file

Use the same upload process as images: open `client/public`, choose **Add file** → **Upload files**, then commit to your branch.

For a downloaded file called `executive-resume-audit.pdf`, its public website address becomes:

```text
https://signrl.com/executive-resume-audit.pdf
```

To make a button or link open that file, a developer must add or update a link in `Home.tsx`, for example:

```tsx
<a href="/executive-resume-audit.pdf">Download the Executive Résumé Audit</a>
```

If you are not comfortable editing the link code, upload the file and ask for help with the one-line website link. Never upload subscriber spreadsheets, client résumés, passwords, invoices, contracts or private files to this public repository.

## 9. How to check publishing after you merge

Your repository is configured to deploy automatically after a push to **main**. Follow these steps:

1. Open the repository and click the **Actions** tab.
2. Open the workflow named **Deploy Signal Weekly to GitHub Pages**.
3. The newest run should be at the top. Wait for a **green tick**.
4. Click the run to see details. The **build** and **deploy** jobs should both be successful.
5. Open `https://signrl.com` in a private/incognito browser tab and check the change.

GitHub Actions shows each workflow run as in progress, successful, failed or cancelled. If it fails, open the failed job; GitHub automatically expands the failed step and displays the relevant log. [4]

### If you need to manually republish without changing a file

The deployment workflow supports manual runs.

1. Go to **Actions**.
2. Select **Deploy Signal Weekly to GitHub Pages**.
3. Click **Run workflow**.
4. Leave **Branch** set to `main`.
5. Click **Run workflow**.

GitHub permits manual runs for workflows that include `workflow_dispatch`; the Signal Weekly deployment workflow includes this trigger. [3]

## 10. What to do if something goes wrong

| What you see | What to check first | Safe action |
|---|---|---|
| A red X in Actions | Open the newest workflow run and the failed step | Take a screenshot of the first error and ask for help; do not edit the workflow file. |
| The site has not changed after a green tick | Wait a few minutes and refresh with Ctrl/Command + Shift + R | Test in an incognito/private tab. |
| Image is missing | Check the image was uploaded to `client/public` and the spelling is identical | Correct the file address; do not delete the original image first. |
| A page shows a blank screen | The latest code may have a missing symbol or tag | Do not make additional edits. Revert the PR or ask for help immediately. |
| Beehiiv signup stops loading | The embed script may have been changed | Restore the previous `Home.tsx` version and ask for help. |
| GitHub says you cannot edit | You may be on `main`, lack permissions, or be using a protected branch | Create a branch or check that you are signed in as `ck-visionai`. |
| Domain does not open | It may be browser cache, not the website | Test `https://signrl.com` and `https://www.signrl.com` in an incognito/private window before changing DNS. |

### How to roll back a bad change

The safest rollback is to use the pull request that introduced the problem:

1. Open **Pull requests** in the repository.
2. Open the merged pull request for the bad change.
3. Click **Revert** if GitHub shows that button.
4. GitHub creates a new pull request that undoes the earlier change.
5. Review it, merge it, then check Actions and the live site again.

If the change was committed directly to `main` or you cannot see a Revert button, stop and ask for help rather than deleting content at random.

## 11. What a web administrator may safely do

| Usually safe after following this guide | Ask for technical help first |
|---|---|
| Update approved text in `Home.tsx` | Add a new interactive feature, form, login, database or payment system |
| Update approved Privacy Policy text | Change website routes or navigation structure |
| Upload a public image, PDF or media file | Change the deployment workflow, packages or Vite configuration |
| Replace an image address and update its alt text | Change Beehiiv script code or form ID |
| Merge a small, reviewed PR | Alter DNS, GitHub Pages custom-domain settings or HTTPS settings |
| Check Action status and publish a manual run | Remove files, folders or commits |

## 12. Your regular monthly checklist

| Frequency | Check |
|---|---|
| Every website change | Use a branch and PR; verify a green Actions run; check the live page in an incognito window. |
| Monthly | Review the homepage contact email, Privacy Policy, social links and Beehiiv form. |
| Before a campaign | Test the signup form with a non-important test email and make sure the welcome email links to `https://signrl.com`. |
| Before a major design change | Save screenshots of the current page and write a short list of exactly what should change. |
| When publishing a new lead magnet | Upload only a public-safe PDF; add a visible download link; test the link in an incognito window. |

## 13. A simple request template for future updates

When asking a developer, designer or AI for a website change, copy and complete this message:

> **Website:** Signal Weekly at signrl.com  
> **Page:** Home / Privacy Policy / other  
> **Goal:** [What should improve?]  
> **Exact current wording:** [Copy it here]  
> **New wording or visual:** [Paste it or attach the image]  
> **Must stay unchanged:** Beehiiv form / colours / logo / other  
> **Deadline:** [Date, if relevant]

This prevents accidental changes and makes the finished result easier to check.

## 14. Final reminder

For regular content work, GitHub is sufficient: edit the appropriate file, commit it in a branch, merge a reviewed pull request, wait for the green deployment tick, and check the live site. For technical changes—new pages, a full rebrand, an ATS platform, payment flows, customer data or a broken build—pause and get expert help before changing code.

## References

[1]: https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files "GitHub Docs — Editing files"
[2]: https://docs.github.com/en/repositories/working-with-files/managing-files/adding-a-file-to-a-repository "GitHub Docs — Adding a file to a repository"
[3]: https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow "GitHub Docs — Manually running a workflow"
[4]: https://docs.github.com/en/actions/managing-workflow-runs/using-workflow-run-logs "GitHub Docs — Using workflow run logs"
