
# CONF
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1_000_000
SAVEHIST=1_000_000

alias gits='git status'
# setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when shell exits.

alias zd="$HOME/.zsh"
alias zed="code $ZDIR"

alias '$'=''
alias ❯=''

alias ..='cd ..'
alias cdd='cd ~/Downloads'
alias copylast="!-1 | pbcopy"
alias clip='tee >(pbcopy)'
alias disks='duf -only local,fuse'
alias ls='ls -h'
alias la='ls -lah'
alias spanso='espanso edit'

h(){ tldr "$1" || man "$1" || "$1" --help || "$1" -h }

+d() { mkdir -p $1; cd $1 }
+line(){ grep -qF -- "$2" "$1" || echo "$2" >> "$1"}

+bin(){
    # tries to download a binary, unzip if necessary, and move to ~/.binaries when done
     (
        +d $HOME/.installs/;
        src=${1:-$(pbpaste)};

        local filename=${src##*/};  # src after last slash
        local name="${2:-${filename%%[._-]*}}" # $2 or chars before first [._-] of filename
        echo $name
        dl "$src";
        
        # unpack if it's a zip or tar.gz
        if [[ $filename == *.zip ]]; then unzip -o $filename
        elif [[ $filename == *.tar.gz ]]; then tar -xvf $filename
        fi
        
        chmod +x $name
        mv $name $HOME/.binaries/$name
        )
}
rand(){ python -c "from random import randrange; print(randrange(0, ${1:-10}))" }
word(){ sed `perl -e "print int rand(99999)"`"q;d" /usr/share/dict/words }

oy(){ echo "${@:-Oy!}" }

scr() {
	if [ "$#" -eq "0" ];
        then screen -ls;
	    else screen -D -R -S $1 $@;
	fi
}
scr-rename() {
	screen -S "$1" -X sessionname "$2"
}

denest(){
	# default assuems nested_dir is same as the current directory name
	# nested_dir is $1 or the folder name of $PWD
	nested_dir="${1:-$(basename $(pwd))}"
	ditto "$nested_dir"/* .
	echo "$nested_dir"
	trash "$nested_dir"
}

showpath() {
    # display $PATH as a readable list
    echo $PATH | tr ':' '\n' | uniq 
}

folder(){ basename "$PWD"}
parent() {basename "$(dirname $PWD)"}