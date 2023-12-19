#!/bin/zsh
alias cask='brew cask'
alias b='brew'

# list installed homebrews name & desc
brews() {
	brew info --json=v1 --installed | jq -r '. [] | "\(.name)||\(.desc)"' | column -t -s '||';
}

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
