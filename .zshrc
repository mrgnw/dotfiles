#!/bin/zsh
export Z="$HOME/.zsh"

function is_macos() { [[ "$OSTYPE" = "darwin"* ]] || return 1 }
function is_linux() { [[ "$OSTYPE" = "linux"* ]] || return 1 }
function is_apple_silicon(){ is_macos && [[ $(sysctl -n machdep.cpu.brand_string)  == 'Apple'* ]] || return 1 }

LANG="en_US.utf8";

# Language & framework variables
export GOPATH="$HOME/.golang"
export BUN_INSTALL="$HOME/.bun"
export PY_BASE="$(python3.11 -m site --user-base)"

# completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

zsh_opts=(
    auto_list
    auto_menu
    auto_param_keys
    autocd
    correct
    hist_ignore_all_dups
    hist_ignore_dups
    hist_ignore_space
    interactive_comments
    null_glob
    share_history
)
setopt "${zsh_opts[@]}"

export ZDIR="$HOME/.zsh"
alias zed="$EDITOR $Z"

# custom scripts
for f in $Z/**/*.zsh; do
    source "$f";
done

source "$Z/theme";
