#!/usr/bin/env bash
# Start a fresh, isolated rehearsal without changing your personal Git settings.
set -euo pipefail
presenter_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
command -v git >/dev/null || { echo 'Git is required.' >&2; exit 1; }
demo_root="$(mktemp -d "${TMPDIR:-/tmp}/git-five-minutes.XXXXXX")"
mkdir "$demo_root/manuscript"
cp "$presenter_dir/../example/manuscript.tex" "$demo_root/manuscript/"
cat > "$demo_root/gitconfig" <<'CONFIG'
[user]
    name = Example Researcher
    email = researcher@example.org
[init]
    defaultBranch = main
[advice]
    statusHints = false
[color]
    ui = false
[log]
    decorate = false
CONFIG
printf 'Fresh demo folder: %s\n' "$demo_root/manuscript"
printf 'Identity: Example Researcher <researcher@example.org> (fictional)\n'
printf 'Type the seven lesson commands. Type exit when finished.\n'
printf 'This folder is retained after exit; rerun this script for a fresh rehearsal.\n\n'
cd "$demo_root/manuscript"
unset GIT_DIR GIT_WORK_TREE GIT_INDEX_FILE GIT_CONFIG_COUNT GIT_CONFIG_PARAMETERS
unset GIT_AUTHOR_NAME GIT_AUTHOR_EMAIL GIT_COMMITTER_NAME GIT_COMMITTER_EMAIL
unset GIT_AUTHOR_DATE GIT_COMMITTER_DATE GIT_COMMON_DIR GIT_OBJECT_DIRECTORY
export GIT_CONFIG_GLOBAL="$demo_root/gitconfig"
export GIT_CONFIG_NOSYSTEM=1
export GIT_CEILING_DIRECTORIES="$demo_root"
export GIT_PAGER=cat
export LC_ALL=C
export PS1='manuscript $ '
exec bash --noprofile --norc -i
