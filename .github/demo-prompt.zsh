# The README demo's prompt: Powerlevel10k's own pure preset, loaded over the
# machine's prompt for the recording only (.github/demo.tape sources it; chezmoi
# ignores .github). Past prompts collapse to the prompt character, so the output
# keeps the room.
p10k_dir=${ZSH_PLUGIN_DIR:-$(brew --prefix)/share}/powerlevel10k
(( $+functions[p10k] )) || source $p10k_dir/powerlevel10k.zsh-theme
source $p10k_dir/config/p10k-pure.zsh
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
p10k reload
