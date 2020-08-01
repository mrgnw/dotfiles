#!/bin/zsh
alias dockerrun='docker run -it $(docker build -q .)'

# Run a docker command on multiple items
# e.g. `dkr pull a b` = docker pull a; docker pull b;
dkr(){
	docker_command=$1
	shift
	for i in "$@"
	do
		docker $docker_command "$i"
	done
}
