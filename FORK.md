# Fork notes

This is a personal fork of [junior/dotfiles](https://github.com/junior/dotfiles).
Read [upstream's README](README.md) first — it explains how everything works.

## What this fork changes

Two things, kept as small as possible so upstream merges cleanly:

1. **Git identity** — `dot_gitconfig.tmpl` uses my name and GitHub noreply email.
   The real email goes in `~/.gitconfig.local` (see "Work overlay" below),
   never in this repo.

2. **Removed `junior/tap`** — the tap and its formulae (`s3tx`, `skilla`) are
   Junior's personal tools. Everything else stays.

## Setup

All Macs use `mac-personal`. The `machine` variable picks a *kind of setup*,
not a computer name — see upstream's README for the full explanation.

```bash
# 1. Install chezmoi
brew install chezmoi

# 2. Pre-create config (avoids TTY prompt issues in non-interactive shells)
mkdir -p ~/.config/chezmoi
cat > ~/.config/chezmoi/chezmoi.toml << 'EOF'
[data]
    machine = "mac-personal"
    signingkey = ""
    corp_ca_url = ""
    roles_input = ""
    roles = []
    lab_hosts = ""
EOF

# 3. Apply
chezmoi init --apply adrianosantos

# 4. Install packages
brew bundle --global
```

## Updating

```bash
up          # pulls dotfiles from GitHub, runs brew bundle, upgrades everything
```

## Pulling upstream changes

```bash
cd ~/AI/dotfiles        # or wherever chezmoi source is
git fetch upstream
git merge upstream/main
# resolve conflicts if any (usually only in dot_gitconfig.tmpl)
```

## Work overlay

Work-specific config (work email, internal tools, `apple-claude-code`) goes in
a **private overlay repo**, not here. See upstream's README section on overlays.

In short: clone a private repo to `~/.local/share/dotfiles-overlay` on the work
machine only, give it an `install.sh` that links its pieces into place:

- `~/.gitconfig.local` — work identity (included by the managed `~/.gitconfig`)
- `~/.config/zsh/local.d/*.zsh` — work aliases and environment
- `~/.local/bin/` — work scripts

The `up` command pulls the overlay automatically when its host is reachable.

## Languages

Node, Python, Terraform and OpenTofu are managed by
[mise](https://mise.jdx.dev), not Homebrew. mise installs the right version per
project and keeps them out of the system PATH. See upstream's README for details.
