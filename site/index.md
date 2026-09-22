<p class="eyebrow" id="top">A SHORT GUIDE FOR RESEARCHERS</p>

# Git in five minutes

<p class="intro">Record the first version of a research manuscript. Five commands are enough to begin.</p>

<section class="lesson-section" id="why" markdown="1">

## <span class="number">01 / THE PROBLEM</span> Why version control?

You revise your manuscript, send a draft to your supervisor, and keep working. Soon your folder looks like this:

<pre class="filenames"><code>thesis.tex
thesis_final.tex
thesis_final_v2.tex
thesis_final_really.tex</code></pre>

> Which version did I send my supervisor?

Filenames alone do not reliably explain what changed or why. Version control keeps a history of recorded versions as your project develops. The same idea applies to a Python analysis script.

</section>

<section class="lesson-section" id="how" markdown="1">

## <span class="number">02 / THE IDEA</span> How Git helps

**Git** is a version control tool. A **repository** is your project together with its Git history. A **commit** records a snapshot of the tracked project, with an author, date, and message.

Keep working on `manuscript.tex`. Record meaningful versions instead of inventing another “final” filename.

<ol class="workflow">
  <li><strong>Edit and save.</strong> Your editor changes the file on disk, in your working directory.</li>
  <li><strong>Select with <code>git add</code>.</strong> Put the file’s current content in the staging area, ready for the next commit.</li>
  <li><strong>Record with <code>git commit</code>.</strong> Create a snapshot using the staged content and give it a useful message.</li>
</ol>

<div class="note" markdown="1">
**Saving a file does not create a commit.** If you edit it after `git add`, run `git add` again to include those later edits.
</div>

Git works locally, without a network connection. A local commit does not automatically create an external backup.

</section>

<section class="lesson-section" id="first-commit" markdown="1">

## <span class="number">03 / THE PRACTICE</span> The first commit

Begin in a new folder containing only `manuscript.tex`, outside any existing repository. Git is installed and your author identity is already configured. Keep generated LaTeX files out of this exercise by compiling elsewhere.

Save this small document as `manuscript.tex`:

```latex
\documentclass{article}
\title{A Research Manuscript}
\author{Example Researcher}
\date{}
\begin{document}
\maketitle
\section{Introduction}
This manuscript will describe our experiment and its results.
\end{document}
```

### Create the repository and inspect it

```bash
git init
git status
```

`init` creates the hidden `.git` directory that stores the repository's history and metadata. It does not create a commit. `status` lists `manuscript.tex` as **untracked**: Git has not yet started tracking it.

### Select the manuscript

```bash
git add manuscript.tex
git status
```

`add` stages the current content of the file. `status` now lists it under **Changes to be committed**. The first snapshot has not been recorded yet.

### Record the first version

```bash
git commit -m "Record initial manuscript draft"
git status
```

`commit` records the staged content. `-m` supplies the commit message directly, so no editor opens. `status` now reports **nothing to commit, working tree clean**: there are no pending changes in this example.

### Read the history

```bash
git log
```

Find the commit's identifier, author, date, and message. Your history now contains one recorded version. If a pager opens, press **q** to return to the terminal.

<div class="note" markdown="1">
**Next time:** edit and save the manuscript, select the new content with `git add`, then record another meaningful version with `git commit`. `git init` is only needed once for this project.
</div>

</section>

<section class="lesson-section" id="five-commands" markdown="1">

## The five commands

| Command | What it does |
| --- | --- |
| `git init` | Creates a repository in the current folder. |
| `git status` | Shows the current state: untracked files, staged content, and unstaged changes. |
| `git add manuscript.tex` | Selects this file's current content for the next commit. |
| `git commit -m "Message"` | Records a snapshot using the staged content and the supplied message. |
| `git log` | Shows the recorded commit history, newest first. |

**Remember:** `status` shows where you are now. `log` shows what you have recorded.

</section>

<section class="lesson-section" id="beyond" markdown="1">

## Beyond the five-minute lesson

This supplementary cheat sheet is for later practice. None of these commands is required for your first commit.

<details markdown="1">
<summary>Open the supplementary command cheat sheet</summary>

### Inspect and compare

| Command | Brief explanation |
| --- | --- |
| `git diff` | Shows tracked-file changes that have not been staged. Untracked files are not included. |
| `git diff --staged` | Shows staged changes relative to the last commit. |
| `git show` | Shows the latest commit's details and changes. |
| `git log --oneline` | Shows a compact history, one commit per line. |
| `git help status` | Opens the manual for `status`, if Git's manual pages are installed. |

### Correct the selection

| Command | Brief explanation |
| --- | --- |
| `git restore --staged manuscript.tex` | After a first commit exists, removes this file's staged changes from the next commit while keeping your working file edits. |

### Separate lines of work

A **branch** names a line of development. A **merge** combines development histories.

| Command | Brief explanation |
| --- | --- |
| `git branch` | Lists local branches and marks the current one. |
| `git switch -c revision` | Creates and switches to a branch named `revision`. |
| `git switch main` | Switches to an existing branch named `main`; your original branch may have another name. |
| `git merge revision` | Merges `revision` into the current branch. Conflicting edits may need manual resolution. |

### Work with a hosted repository

A **remote** is a named connection to another repository. GitHub is one service that can host repositories. The website you are reading can be hosted there, but the five lesson commands work locally.

| Command | Brief explanation |
| --- | --- |
| `git clone <url>` | Copies an existing repository and its history into a new local folder. |
| `git remote -v` | Lists configured remotes and their URLs. |
| `git fetch origin` | Downloads history from the remote named `origin` without integrating it into your current branch. |
| `git pull --ff-only` | Fetches and updates the current branch only if no divergent history must be combined. Requires a configured upstream. |
| `git push` | Sends local commits to a remote, subject to permissions and the configured destination. |

Replace `<url>` with an actual repository URL. Hosting and authentication require separate setup. Practise branching and sharing in a disposable project before using them on ongoing research.

</details>

</section>

<section class="lesson-section" id="downloads" markdown="1">

## Downloads and sources

<ul class="download-links">
  <li><a href="downloads/git-in-five-minutes.pdf">A Brief Introduction slide</a></li>
</ul>

<div class="sources" markdown="1">
Continue with the official [Git tutorial](https://git-scm.com/docs/gittutorial). Command references: [init](https://git-scm.com/docs/git-init), [status](https://git-scm.com/docs/git-status), [add](https://git-scm.com/docs/git-add), [commit](https://git-scm.com/docs/git-commit), and [log](https://git-scm.com/docs/git-log). The [Git reference](https://git-scm.com/docs) covers the supplementary commands.
</div>

</section>
