# homebrew, etc.

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

alias ydl='youtube-dl'

# git
# lastpass-cli
# mas
# youtube-dl
# zsh