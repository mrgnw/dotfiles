#!/bin/zsh
export Z="$HOME/.zsh"

export TERM=xterm-256color

function is_macos() { [[ "$OSTYPE" = "darwin"* ]] || return 1 }
function is_linux() { [[ "$OSTYPE" = "linux"* ]] || return 1 }
function is_apple(){ is_macos && [[ $(sysctl -n machdep.cpu.brand_string)  == 'Apple'* ]] || return 1 }

export LANG=en_US.utf8
export LC_ALL=en_US.UTF-8
autoload -Uz compinit
compinit

# Languages & frameworks
# alias python="$(which python3)"
export BUN_INSTALL="$HOME/.bun"
export DENO_INSTALL="$HOME/.deno"
export GOPATH="$HOME/.golang"

PATH_DIRS=(
		"$HOME/.scripts"
		"$HOME/.binaries"
		"$HOME/.local/bin"
		"$GOPATH/bin"
		"$DENO_INSTALL/bin"
		"$BUN_INSTALL/bin"
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
		extended_history
)
setopt "${zsh_opts[@]}"

export SAVEHIST=10000
export HISTSIZE=10000

# custom scripts
for f in $Z/*.zsh; do
		source "$f";
done
