#!/bin/zsh
alias cask='brew cask'

export HOMEBREW_AUTO_UPDATE_SECS=300
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=15
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_NO_GITHUB_API=1  # exclude issues in brew search
export HOMEBREW_INSTALL_BADGE="🍦"

# list installed homebrews name & desc
brews() {
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}
alias b='brew'
b+(){
	if [[ $# -gt 0 ]]; then
		brew install "$@"
	else
		echo "brew update; brew upgrade"
		brew update; brew upgrade; brew cleanup;
	fi
}
b-(){
	if [[ $# -gt 0 ]]; then
		brew uninstall "$@"
	else
		echo "brew cleanup -s"
		brew cleanup -s
	fi
}
bs(){ brew search $@ }
b^(){ brew outdated $@ | column -t -s ' '; }
