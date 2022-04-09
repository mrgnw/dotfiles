#!/bin/zsh
alias cask='brew cask'

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_AUTO_UPDATE_SECS=300
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=15
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_NO_GITHUB_API=1  # exclude issues in brew search

# list installed homebrews name & desc
brews() {
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}
b-(){ echo "${@}" | xargs -n 1 -P 9 -I '{}' zsh -c 'brew uninstall {}' }
b?(){ brew outdated $@ | column -t -s ' '; }
b^(){ brew update; brew upgrade }
b+(){ brew install "$@" }
bs(){ brew search $@ }
