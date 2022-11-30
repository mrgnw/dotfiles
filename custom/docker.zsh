#!/bin/zsh
alias dkrun='docker run -it $(docker build -q .)'

export containers="$HOME/.containers"

comp(){ composerize "$@" | pbcopy }
dc(){ docker-compose "${1:-up}" "$@" }

dc(){
    # usage: dc (file or folder) and/or command
    # examples:
    # - `dc` ▸ `docker-compose up`
    # - `dc dev-docker-compose.yml` ▸ `docker-compose -f dev-docker-compose.yml up`
    # - `dc a_project1` ▸ `docker-compose -f a_project/docker-compose.yml up`
    if [[ -f "$1" ]]; then
        docker-compose -f "$1" "${2:-up}" "${@:2}"
    elif [[ -d "$1" ]]; then
        docker-compose -f "$1/docker-compose.yml" "${2:-up}" "${@:2}"
    else
        docker-compose "${1:-up}" "$@"
    fi
}


# Run a docker command on multiple items in parallel
# e.g. `dkdk pull a b` = docker pull a; docker pull b;
dkdk(){
	docker_command=$1
	shift
	for i in "$@"
	do
		docker $docker_command "$i"
	done
}

# docker-compose auto-completion
fpath=(~/.zsh/completion $fpath)
