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

<<<<<<< Updated upstream
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
=======
function is_macos() { [[ "$OSTYPE" =~ ^darwin ]] || return 1 }
function is_linux() { [[ "$OSTYPE" =~ ^linux ]] || return 1 }


# mrgnw/dotfiles
>>>>>>> Stashed changes
for f in $Z/**/*.zsh; do
    source "$f";
done

<<<<<<< Updated upstream
source "$Z/theme";
=======

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# pnpm
export PNPM_HOME="/home/x/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
# fnm
export PATH=/home/x/.fnm:$PATH
eval "`fnm env`"
>>>>>>> Stashed changes
