t+(){ uv tool install "$@" }
t»(){ uv tool upgrade "$@" }
t-(){ uv tool remove "$@" }

# uv autocomplete
eval "$(uv generate-shell-completion zsh)"

