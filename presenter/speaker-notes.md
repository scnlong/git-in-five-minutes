# Speaking notes: Git in five minutes

Audience: PhD students who know Linux and LaTeX and have never used version control. Bracketed cues are actions, not spoken text. The script allows pauses and typing; rehearse aloud to land near 4:30, with 5:00 as the hard stop.

## 0:00-0:10 · Slide 1 · Cover

“Hello, I’m Qing-Long Liu. Today I’ll introduce Git through a simple research manuscript example.”

[Advance immediately to the motivating example.]

## 0:10-0:50 · Slide 2 · Why version control?

“Imagine you are writing your thesis. You send a draft to your supervisor and carry on editing. A week later, your folder looks like this.

[Point to the filenames. Pause briefly.]

Which version did you send? And what have you changed since then?

Adding ‘final’ to a filename does not answer either question reliably. We need a history of meaningful versions, with enough context to recognise them later.

That is what version control gives us. Today we will use Git to record the first version of a manuscript. The same approach works for your Python scripts.”

## 0:50-1:50 · Slide 3 · How Git helps

“Git keeps your project together with its recorded history in a repository. A recorded snapshot is called a commit.

There are three steps. First, edit and save the file as usual. Second, use `git add` to select its current content for the next commit. Git calls this selection the staging area. Third, use `git commit` to record that snapshot with a message explaining it.

Saving a file in your editor does not create a commit. And if you change a file after adding it, add it again to include those later edits.

Each commit has an author, a date, a message, and an identifier. Git works locally, so we can do all of this offline. An external backup is still a separate step.”

## 1:50-4:20 · Slide 4 and terminal · The first commit

[Show slide 4. Switch to the prepared terminal. Aim to complete the terminal portion around 4:00.]

“I have a new folder containing one file, `manuscript.tex`. Git is installed and my author identity is already configured.”

[Run `git init`.]

“This creates the repository. It has no commits yet.”

[Run `git status`. Point to `manuscript.tex`.]

“Status tells us where we are. The file is untracked: Git has not started tracking it.”

[Run `git add manuscript.tex`, then `git status`.]

“Now the manuscript is under ‘Changes to be committed’. We have selected its current content. We have not recorded a commit yet.”

[Run `git commit -m "Record initial manuscript draft"`.]

“This records our first snapshot. The `-m` option gives it a message directly, without opening an editor.”

[Run `git status`.]

“The working tree is clean. There are no pending changes in this example.”

[Run `git log`. Point to the identifier, author, date, and message.]

“Here is the recorded version. We can recognise it by its message and identify it precisely by this commit ID.”

## By 4:20-4:30 · Recap, with room to finish by 5:00

[Return to slide 4.]

“For the next version, edit, add, and commit again. `Status` shows the current state; `log` shows the recorded history. The companion website has these commands and the example to try afterward.”

## Teaching notes, outside the spoken script

- Do not claim Git automatically knows which draft was emailed. Commit messages and identifiers help you deliberately record that context.
- A commit is a snapshot of the tracked project, not merely a saved message or a record of filenames. The first commit in this example contains one file.
- The terminal may mention `main` or `HEAD`. Do not introduce those concepts during this lesson; if asked, explain that this session is limited to recording local versions.
- No audience setup or installation takes place during the five minutes.
- Do not open the supplementary cheat sheet during the talk. It is an optional reference afterward.

## Sources supporting the slides

- Slide 1: name and position supplied by the presenter.
- Slide 2: illustrative fictional filenames and a teaching scenario, not empirical claims. The AI-generated illustration depicts a fictional researcher; its plots are decorative, not research data. The full prompt and generation method are in `slides/assets/README.md`.
- Slide 3: [Git tutorial](https://git-scm.com/docs/gittutorial), [git add](https://git-scm.com/docs/git-add), and [git commit](https://git-scm.com/docs/git-commit).
- Slide 4: [git init](https://git-scm.com/docs/git-init), [git status](https://git-scm.com/docs/git-status), and [git log](https://git-scm.com/docs/git-log). The supplied transcript comes from running the commands against the included manuscript.
