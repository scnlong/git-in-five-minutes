# Presenter setup

## Before the interview

1. Open `slides/git-in-five-minutes.pdf` in a PDF viewer and enter presentation mode. There are four pages: a cover followed by three lesson slides, with no animations.
2. Open a terminal with a large monospace font, about 24-28 pt, and at least 80 columns. Rehearse switching between the PDF and terminal.
3. From the project root, run `bash presenter/start-demo.sh`. It creates a fresh temporary folder containing only `manuscript.tex` and starts a clean interactive Bash session there. **No repository exists yet.**
4. The launcher uses a fictional author and temporary Git configuration for this session only. It leaves your personal Git settings unchanged, disables the log pager, and hides optional status hints to keep the output focused. The text `On branch main` can still appear; it is not part of this lesson.
5. Run through the commands below once, then type `exit` and launch a fresh session for the actual talk. Leave the fresh terminal ready at its prompt; do not run `git init` before the demonstration begins.
6. Keep `presenter/demo-transcript.txt` open in a second window as a fallback. Open `public/index.html` for the companion site; it works without a network connection.

The launcher requires Bash, Git, and standard Linux utilities. The temporary folder is retained so you can inspect it afterward. Each run creates a separate folder; it never clears an existing project.

## Exact live sequence

```bash
git init
git status
git add manuscript.tex
git status
git commit -m "Record initial manuscript draft"
git status
git log
```

There are seven command invocations but only five different Git commands.

Watch for these states:

- After `init`: a repository exists, but no commit has been recorded.
- First `status`: `manuscript.tex` is untracked.
- After `add`: `status` lists the manuscript under “Changes to be committed”.
- After `commit`: the working tree is clean, and `log` contains one commit.

Point to the author, date, message, and identifier in `git log`. Do not read the identifier aloud. The launcher disables the pager; outside this prepared session, press `q` if a pager opens.

## Manual preparation instead of the launcher

Use an empty directory outside any existing repository and copy only `example/manuscript.tex` into it. Do not compile the manuscript there: generated `.aux`, `.log`, and `.pdf` files would distract from the exercise. Verify your Git identity before the interview. For a temporary shell session, set it without changing global configuration:

```bash
export GIT_AUTHOR_NAME='Example Researcher'
export GIT_AUTHOR_EMAIL='researcher@example.org'
export GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
export GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
export GIT_PAGER=cat
```

These are preparation commands, outside the lesson. For real work, use your own appropriate author identity. Your normal Git configuration may enable signing, hooks, or other behaviour; the supplied launcher avoids those personal configuration dependencies.

## Timing and fallback

Aim to finish at 4:30, keeping 30 seconds in reserve. Spend about 10 seconds on the cover. Show slide four at 1:50 and switch to the terminal by 2:05. Start the recap no later than 4:20.

If a command fails, switch immediately to the captured transcript and explain the same states. Avoid live troubleshooting. If running late, shorten the narration; retain the staging explanation and the final `git log`.

The website footer contains no invented deployment URL. Once you publish, share the real URL from GitHub's Pages settings with the interview panel. You can keep the companion open locally during rehearsal and point to it at the close.
