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

# list installed homebrews
brews() {
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}

caskin() {
	# only fetch if there are multiple
	([[ "$#" -gt 1 ]] && (brew cask fetch ${@:2}) ) &
	(
		for INSTALL in "$@"
		do
			brew cask install $INSTALL
		done
	)
	brew update
}

fetchdeps(){
	for dep in $(brew deps $1); do
		coproc brew fetch $dep; sleep .4;
	done
}


brewin() {
	# only fetch if there are multiple
	([[ "$#" -gt 1 ]] && (brew fetch ${@:2}) ) &
	(
		for INSTALL in "$@"
		do
			brew install $INSTALL
		done
	)
	brew update
}
