# The README demo's prompt: Powerlevel10k's own pure preset, loaded over the
# machine's prompt for the recording only (.github/demo.tape sources it; chezmoi
# ignores .github). Past prompts collapse to the prompt character, so the output
# keeps the room.
p10k_dir=${ZSH_PLUGIN_DIR:-$(brew --prefix)/share}/powerlevel10k
(( $+functions[p10k] )) || source $p10k_dir/powerlevel10k.zsh-theme
source $p10k_dir/config/p10k-pure.zsh
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
# The kube context at the right of the first line while a kcx or kubectl command
# is typed, as the machine's own prompt shows it, in its profile group's colour
# (production red, lab green) as in kcx's README demo. The tape points KUBECONFIG
# at .github/demo-kubeconfig.yaml, so it is the demo's cluster, never a real one.
# The icon needs a Nerd Font.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext newline)
typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|kubecolor|kcx|kc|kcc|kn|knc'
typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=('*READ-ONLY*' RO 'prod*' PROD '*-lab*' LAB '*' DEFAULT)
typeset -g POWERLEVEL9K_KUBECONTEXT_{RO,PROD}_FOREGROUND=1
typeset -g POWERLEVEL9K_KUBECONTEXT_LAB_FOREGROUND=2
typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=5
typeset -g POWERLEVEL9K_KUBECONTEXT_{RO,PROD,LAB,DEFAULT}_VISUAL_IDENTIFIER_EXPANSION=$'\U000F10FE'
typeset -g POWERLEVEL9K_KUBECONTEXT_CONTENT_EXPANSION='${P9K_KUBECONTEXT_NAME}${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'
p10k reload
