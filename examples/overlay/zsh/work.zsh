# Work aliases and environment. install.sh links this into ~/.config/zsh/local.d/,
# which ~/.zshrc sources last, so anything here wins over the public aliases.
export COMPANY_REGISTRY=registry.company.example
alias wlogin='docker login "$COMPANY_REGISTRY"'
