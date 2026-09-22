# Git in five minutes

An introduction to Git for researchers with a cover and three lesson slides, a live LaTeX manuscript demonstration and a Markdown companion website. The teaching material uses `git init`, `git add`, `git commit`, `git status`, and plain `git log`. Extra commands appear only in the website's optional supplement.

## Open the delivered material

- **Slides:** `slides/git-in-five-minutes.pdf` (a cover and three lesson slides).
- **Editable slides:** `slides/git-in-five-minutes.tex` (LaTeX Beamer).
- **Website, already built:** open `public/index.html` directly in your browser. Its styles and downloads work offline; external reference links require internet access.
- **Speaking script:** `presenter/speaker-notes.md`.
- **Preparation and fallback:** `presenter/setup.md` and `presenter/demo-transcript.txt`.
- **Fresh terminal rehearsal:** run `bash presenter/start-demo.sh` from this folder.

The `public/` directory is included in the delivered ZIP for offline use but is ignored by Git because CI rebuilds it. Keep the supplied PDF tracked: the website build copies it into the downloads directory.

## Edit and rebuild the website

Requires Python 3.10 or later. From this folder:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
python build.py
python -m http.server 8000 --directory public
```

Visit `http://localhost:8000`. Installing the pinned dependency needs a network connection initially; subsequent builds work offline.

Edit lesson content in `site/index.md`, layout in `site/template.html`, and styles in `site/style.css`. The build renders Markdown at build time; the published site needs no Python server, JavaScript, CDN, web fonts, or external assets. All local links are relative, so both a project URL and an account-level Pages URL work.

## Edit and compile the slides

Requires a LaTeX distribution with Beamer, Latin Modern, listings, and latexmk. The slide source requires `slides/assets/manuscript-drafts.png`. Keep the `assets/` directory beside the `.tex` file when uploading to Overleaf. The complete project ZIP includes the source and illustration; the public website offers only the slide PDF. From this folder:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error \
  -outdir=slides slides/git-in-five-minutes.tex
python build.py
```

After changing the slides, **commit both the `.tex` and the regenerated `.pdf`**. CI builds the website using that PDF; it does not recompile LaTeX. This keeps the publishing workflow small and predictable.

## Publish on GitHub Pages

These are maintainer instructions, outside the five-minute lesson. No account access or deployment has been performed for you.

1. Create a public GitHub repository, for example `git-in-five-minutes`. Public repositories support GitHub Pages on GitHub Free. Private-repository availability depends on your plan.
2. Upload the **contents** of this project folder to the repository root, including `build.py`, `requirements.txt`, `site/`, `slides/`, `example/`, `presenter/`, `.gitignore`, and `.github/workflows/pages.yml`. Do not upload the ZIP itself or nest everything inside another `git-in-five-minutes/` directory. The prebuilt `public/` folder need not be uploaded.
3. If using GitHub's browser uploader, hidden files may be omitted by your file picker. Use **Add file → Create new file** to add `.github/workflows/pages.yml` with the exact supplied contents if it did not upload. Also preserve `.gitignore`. A normal local Git workflow can upload the same source files instead.
4. In the repository, open **Settings → Pages**. Under **Build and deployment**, choose **GitHub Actions** as the source. Do not select deployment from a folder on a branch.
5. Open **Actions → Publish companion website → Run workflow**, selecting the repository's default branch. If the initial upload ran before Pages was enabled, rerun the workflow now. Future pushes to the default branch publish automatically; jobs skip other branches.
6. Wait for both the `build` and `deploy` jobs to succeed. The workflow renders into `public/`, uploads only that directory, and deploys it using the `github-pages` environment.
7. Open the actual site URL shown by the deployment or **Settings → Pages**. A typical project URL is `https://YOUR-USERNAME.github.io/git-in-five-minutes/`, but use the URL GitHub reports rather than assuming it. Test the slide PDF download, then share that URL with the panel.

If your organisation enforces Actions or environment restrictions, allow the supplied official GitHub actions and deployment from the default branch. The workflow grants the deployment job `pages: write` and `id-token: write`, as required by GitHub Pages; source access is read-only.

The workflow uses the repository's configured default branch, rather than assuming its name is `main`. The build publishes only the supplied slide PDF. Editable slide source, the illustration, manuscript, transcript, speaker notes, and presenter setup remain in the project ZIP and repository, outside the published site.

Official guidance: [Using custom workflows with GitHub Pages](https://docs.github.com/en/pages/getting-started-with-github-pages/using-custom-workflows-with-github-pages) and [Configuring a publishing source](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

## Files at a glance

```text
.github/workflows/pages.yml    GitHub Pages build and deployment
build.py                      Markdown-to-HTML build
requirements.txt              Pinned Markdown renderer
site/                         Markdown, HTML template, and local CSS
slides/                       Editable Beamer source and compiled PDF
example/manuscript.tex         Small fictional research manuscript
presenter/                    Script, setup, launcher, and captured transcript
public/                       Ready-to-open offline website
```

The cover identifies Qing-Long Liu and the position IT Specialist for Linux System Administration and HPC. The material uses no institutional logo or affiliation claim. The author shown during the prepared Git demonstration remains fictional. The illustration on slide 2 is AI-generated; its prompt is recorded in `slides/assets/README.md`.
