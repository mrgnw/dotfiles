#!/bin/zsh
export Z="$HOME/.zsh"

function is_macos() { [[ "$OSTYPE" = "darwin"* ]] || return 1 }
function is_linux() { [[ "$OSTYPE" = "linux"* ]] || return 1 }
function is_apple(){ is_macos && [[ $(sysctl -n machdep.cpu.brand_string)  == 'Apple'* ]] || return 1 }

export LANG="en_US.utf8";

# Languages & frameworks
export GOPATH="$HOME/.golang"

alias python="$(which python3.11)"
export PY_BASE="$(python -m site --user-base)"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"

PATH_DIRS=(
    "$HOME/.binaries"
    "$HOME.local/bin"
    "$GOPATH/bin"
    "$DENO_INSTALL/bin"
    "$BUN_INSTALL/bin"
    "$PY_BASE/bin"
)
PATH="$PATH:${(j.:.)PATH_DIRS}"

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

# custom scripts
for f in $Z/*.zsh; do
    source "$f";
done
# TODO: picky file order?
# https://linuxhint.com/bash_append_array/