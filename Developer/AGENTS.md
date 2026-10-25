# ~/Developer

The code on this Mac, and the files chats make for each other. The paths are the
same on every Mac of the fleet, because Claude Code keys memory by path. Read this
before you create, clone, move or delete anything here. The reasons, and how the
main brain works: ~/vaults/logbook/plans/developer-layout.md.

## Where things go: the first match wins

1. Anything for the employer, whatever its remote: `work/`. Read `work/AGENTS.md`.
2. A demo app, or what was recorded with it: `GitHub/demos/<name>`.
3. An interview exercise: `GitHub/interviews/<name>`.
4. A learning repository of the user's: `GitHub/playgrounds/<repo>`.
5. A fork (GitHub's fork flag): `GitHub/forks/<repo>`, origin junior/<repo>,
   upstream the original.
6. The user's own repository, or a project meant for github.com/junior:
   `GitHub/junior/<repo>`.
7. Someone else's repository: `GitHub/others/<repo>`, or
   `GitHub/others/<owner>/<repo>` when several come from one owner.
8. A file you make or receive that is not part of a project: `tmp/`, below.

Name a folder after its repository. Visibility is not a place.

These stay where they are, outside ~/Developer: the dotfiles source
(~/.local/share/chezmoi), the vaults (~/vaults/<name>), ~/.config, and the
Homebrew tap checkout.

## Never

- The only copy of a repository, or of commits pushed nowhere, in a session
  scratchpad: it is reaped about three days after its last use, git objects
  included. A throwaway clone, or a worktree of a repository that lives
  elsewhere, is fine there.
- A repository in `tmp/`, or transfer files beside a project.
- A second working checkout of a repository. A worktree is fine.
- A session started in a bucket folder: start in the project's folder, or in
  `work/` for work.

## tmp

- One item per job: a file or folder named `YYYY-MM-DD-<slug>`, the day it
  entered tmp.
- Kept 14 days from that date. The main brain's weekly sweep moves older items to
  the Trash. If something must live longer, it is not tmp: move it to its
  project, or to a vault by that vault's rules.
- `tmp/notes/<topic>/` holds shared notes: the sweep skips it, and the topic's
  brain clears it when the topic closes. Any other item without a date is listed
  by the sweep, not moved; the brain decides.
- A bundle may go as soon as its far end has fetched it and its commits are in
  its repository.
- Employer material goes in `work/tmp/`, never here.
- Never print a bundle's or a tarball's contents: they can hold credentials.
- Your session scratchpad is for files nobody else needs.

## If another session started you

- Start your last message with the outcome: the commit, the PR, the paths. Only
  its first 400 characters reach the session that started you.
- Put large findings in a file in the shared notes folder your brief names
  (`work/tmp/notes/<topic>/` for work topics), and name the file in your message.
- Agent memory: the index, MEMORY.md, is edited only by the main brain. A
  long-lived chat edits the notes that name it as their keeper; any other change
  goes to the main brain as the exact text you propose.
- Vault edits: draft outside the vault, commit on the user's go.
- Blocked: send one short question to the session that started you, then stop.

This file and CLAUDE.md come from the dotfiles, in ~/.local/share/chezmoi/Developer/:
edit them there, then run `chezmoi apply ~/Developer`.
