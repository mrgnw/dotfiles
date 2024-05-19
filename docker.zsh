#!/bin/zsh
alias dkrun='docker run -it $(docker build -q .)'
alias lz='lazy docker'

export containers="$HOME/.containers"

dc(){
    # usage: dc (file or folder) and/or command
    # examples:
    # - `dc` ▸ `docker-compose up`
    # - `dc dev-docker-compose.yml` ▸ `docker-compose -f dev-docker-compose.yml up`
    # - `dc a_project1` ▸ `docker-compose -f a_project/docker-compose.yml up`
		open -a "OrbStack"

    if [[ -f "$1" ]]; then
        docker-compose -f "$1" "${2:-up}" "${@:2}" 
    elif [[ -d "$1" ]]; then
        docker-compose -f "$1/docker-compose.yml" "${2:-up}" "${@:2}"
    else
        docker-compose "${1:-up}" "$@"
    fi
}

comp(){ composerize "$@" | pbcopy }

# docker-compose auto-completion
fpath=(~/.zsh/completion $fpath)
