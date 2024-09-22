t+(){ uv tool install "$@" }
t»(){ uv tool upgrade "$@" }
t-(){ uv tool remove "$@" }


alias py="uv run python"
alias uvp="uv run pip"
# uv autocomplete
eval "$(uv generate-shell-completion zsh)"

