#!/bin/zsh
export Z="$HOME/.zsh"

function is_macos() { [[ "$OSTYPE" = "darwin"* ]] || return 1 }
function is_linux() { [[ "$OSTYPE" = "linux"* ]] || return 1 }
function is_apple(){ is_macos && [[ $(sysctl -n machdep.cpu.brand_string)  == 'Apple'* ]] || return 1 }

export LANG=en_US.utf8
export LC_ALL=en_US.UTF-8

# Languages & frameworks
alias python="$(which python3)"
export PY_BASE="$(python3 -m site --user-base)"
export DENO_INSTALL="$HOME/.deno"
export BUN_INSTALL="$HOME/.bun"
export GOPATH="$HOME/.golang"
export PNPM_HOME="$HOME/Library/pnpm"

PATH_DIRS=(
		"$HOME/.scripts"
		"$HOME/.binaries"
		"$HOME/.local/bin"
		"$GOPATH/bin"
		"$DENO_INSTALL/bin"
		"$BUN_INSTALL/bin"
		"$PY_BASE/bin"
		"$PNPM_HOME"
		"$HOME/.orbstack/bin"
)
PATH="$PATH:${(j.:.)PATH_DIRS}"

# https://zsh.sourceforge.io/Doc/Release/Options.html
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
