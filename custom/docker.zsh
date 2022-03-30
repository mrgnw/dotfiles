#!/bin/zsh
alias dkrun='docker run -it $(docker build -q .)'

export containers="$HOME/.containers"

# Run a docker command on multiple items
# e.g. `dkr pull a b` = docker pull a; docker pull b;
dkdk(){
	docker_command=$1
	shift
	for i in "$@"
	do
		docker $docker_command "$i"
	done
}
