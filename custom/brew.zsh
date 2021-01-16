#!/bin/zsh
alias cask='brew cask'

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_AUTO_UPDATE_SECS=300
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_NO_GITHUB_API=1  # exclude issues in brew search

# list installed homebrews name & desc
brews() {
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}

# parallel brew/cask
b-(){ echo "${@}" | xargs -n 1 -P 9 -I '{}' zsh -c 'brew uninstall {}' }
b»(){ echo "${@}" | xargs -n 1 -P 9 -I '{}' zsh -c 'brew reinstall {}' }
b^(){ echo "${@}" | xargs -n 1 -P 9 -I '{}' zsh -c 'brew upgrade {}' }
c+(){ echo "${@}" | xargs -n 1 -P 9 -I '{}' zsh -c 'brew install --cask {}'}
caskun(){ echo "${@}" | xargs -n 1 -P 9 -I '{}' zsh -c 'brew cask uninstall {}' }

# install @ 10x parallel download
b+() {
	# downloads start with dependencies 💣
	for INSTALL in "$@"; do
		# todo: fix error when you try b+ user/repotap. Still works, but shows error
		brew deps $INSTALL |
			xargs -n 1 -P 10 -I -r '{}' zsh -c 'brew fetch {}'
	done \
	&
	for INSTALL in "$@"; do
		brew install $INSTALL
	done
}
