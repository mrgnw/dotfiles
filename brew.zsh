# homebrew, etc.

HOMEBREW_NO_AUTO_UPDATE=1
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
