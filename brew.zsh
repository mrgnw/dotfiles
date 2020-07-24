# homebrew, etc.

export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_AUTO_UPDATE_SECS=300
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=30
export HOMEBREW_DISPLAY_INSTALL_TIMES=1
export HOMEBREW_NO_GITHUB_API=1  # exclude issues in brew search
# or run after every session loads; only displays errors
# brew update > /dev/null;

alias y='youtube-dl'
alias cask='brew cask'

# list installed homebrews name & desc
brews() {
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}

# install @ 10x parallel download
b+() {
	# TODO: check if it's installed before fetching
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

# cask install @ 10x parallel download
c+() {
	# TODO: check if it's installed before fetching
	# fetch casks
	echo "${@}" | xargs -n 1 -P 8 -I '{}' zsh -c 'brew cask fetch {}' \
	&
	for INSTALL in "$@"; do
		brew cask install $INSTALL
	done
}

b-(){ echo "${@}" | xargs -n 1 -P 4 -I '{}' zsh -c 'brew uninstall {}' }
b^(){ echo "${@}" | xargs -n 1 -P 8 -I '{}' zsh -c 'brew reinstall {}' }
b»(){ echo "${@}" | xargs -n 1 -P 8 -I '{}' zsh -c 'brew upgrade {}' }
caskun(){ echo "${@}" | xargs -n 1 -P 4 -I '{}' zsh -c 'brew cask uninstall {}' }
caskre(){ echo "${@}" | xargs -n 1 -P 8 -I '{}' zsh -c 'brew cask reinstall {}'}