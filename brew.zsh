# homebrew, etc.

HOMEBREW_NO_AUTO_UPDATE=1
# or run after every session loads; only displays errors
# brew update > /dev/null;

alias y='youtube-dl'

# list installed homebrews
brews() {	
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}

alias cask='brew cask'

# fetch packages concurrently as others install
brewin() {
	case $# in
		0) brew install;;
		1) brew install $1;;
		2) (brew install $@) & (brew fetch ${@:2});;
	esac
	brew update
}
caskin() {
	case $# in
		0) cask install;;
		1) cask install $1;;
		2) (cask install $@) & (cask fetch ${@:2});;
	esac
	brew update
}