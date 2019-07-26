# homebrew, etc.
alias y='youtube-dl'

brew-list-info() {
	# Print summary of each brew package
	# Generally it's the second line of brew info ____
	for x in `brew list`
		do 
			printf $x;
			printf "\t";
			brew info $x | sed -n '2p' ;
		done
}

alias cask='brew cask'

# fetch packages concurrently as others install
brewin() {
	(brew install $@) &
	(brew fetch ${@:2})
}
caskin() {
	(cask install $@) & 
	(cask fetch ${@:2})
}