#!/bin/sh
# Link this overlay's pieces where the public dotfiles read them. `up` runs it
# after every pull, so it is safe to run again, and it never replaces a real file.
set -eu
here=$(cd "$(dirname "$0")" && pwd)

link() {  # link SOURCE TARGET; SOURCE is relative to this repo, skipped when absent
  [ -e "$here/$1" ] || return 0
  if [ -e "$2" ] && [ ! -L "$2" ]; then
    echo "install.sh: $2 is a real file, left as it is" >&2
    return 0
  fi
  mkdir -p "$(dirname "$2")"
  ln -sfn "$here/$1" "$2"
}

link git/gitconfig.local "$HOME/.gitconfig.local"
link packages.toml       "$HOME/.config/dotfiles/packages.toml"
link Brewfile.local      "$HOME/.Brewfile.local"
for pair in zsh:.config/zsh/local.d mise/conf.d:.config/mise/conf.d \
            ssh/config.d:.ssh/config.d bin:.local/bin; do
  for f in "$here/${pair%%:*}"/*; do
    link "${pair%%:*}/${f##*/}" "$HOME/${pair#*:}/${f##*/}"
  done
done
