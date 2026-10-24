# An example overlay

A private overlay for these dotfiles, laid out as the main README's
[Work overlay](../../README.md#work-overlay-keeping-employer-specific-bits-private)
section describes. It is an example only: `.chezmoiignore` keeps this folder out of
every home folder, so the dotfiles never apply it.

**Your overlay belongs in a PRIVATE repository**, on your employer's git host or a
private repository of your own. Never put it in a fork of the public dotfiles, and
never make it public: it holds your work identity, internal host names and the
names of internal tools.

## Using it

1. Copy this folder out of the dotfiles and make it a repository of its own:

   ```sh
   cp -R "$(chezmoi source-path)/examples/overlay" ~/dotfiles-overlay
   cd ~/dotfiles-overlay && git init && git add . && git commit -m "my overlay"
   ```

   Push it to a private remote.
2. Edit every file: each value here is a placeholder (`acme`, `company.example`,
   `you`). Delete the pieces you do not need; `install.sh` skips whatever is missing.
3. On the work machine, clone it where `up` looks for it and run its `install.sh`.
   On a new machine do this before the first `chezmoi init --apply` or `up`, so the
   first `~/.Brewfile` already has your package changes.

   ```sh
   git clone <your private remote> ~/.local/share/dotfiles-overlay
   ~/.local/share/dotfiles-overlay/install.sh
   ```

From then on `up` pulls the overlay and runs `install.sh` before it applies the
dotfiles.

## What each file does

| file | linked to | for |
|---|---|---|
| `install.sh` | - | links every piece below into place; `up` runs it after each pull |
| `git/gitconfig.local` | `~/.gitconfig.local` | your work name and email; `~/.gitconfig` includes it last |
| `zsh/work.zsh` | `~/.config/zsh/local.d/work.zsh` | work aliases and environment; `~/.zshrc` sources it last |
| `mise/conf.d/work.toml` | `~/.config/mise/conf.d/work.toml` | work-only command-line tools |
| `ssh/config.d/work` | `~/.ssh/config.d/work` | work hosts |
| `bin/work-hello` | `~/.local/bin/work-hello` | a work command; every file in `bin/` gets a link |
| `packages.toml` | `~/.config/dotfiles/packages.toml` | public packages this machine skips, or gets in another build |
| `Brewfile.local` | `~/.Brewfile.local` | Homebrew packages only this machine gets (Mac) |

`packages.toml` and `Brewfile.local` here are the work-Mac case: a company build
of Claude Code, from a company tap, takes the place of the public
`claude-code@latest` cask, and the same tap brings one more company app. On WSL
the public Claude Code comes from its native installer, named `claude-code`:
replace or skip that name there, and install the company build from `install.sh`
or `mise/conf.d`.
