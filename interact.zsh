#/bin/zsh
source "$Z/theme";
alias e=edit
ze(){
	z $1 &&
	edit
}

edit(){
	$EDITOR ${1:-.}
}

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1_000_000
SAVEHIST=1_000_000

alias gits='git status'

alias '$'=''
alias ❯=''

alias ..='cd ..'

alias ls='ls -h'
alias la='ls -lah'

alias disks='duf -only local,fuse'

alias spanso='espanso edit'

h(){ tldr "$1" || man "$1" || "$1" --help || "$1" -h }
+d() { mkdir -p $1; cd $1 }

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
	# default assumes nested_dir is same as the current directory name
	# nested_dir is $1 or the folder name of $PWD
	nested_dir="${1:-$(basename $(pwd))}"
	ditto "$nested_dir"/* .
	echo "$nested_dir"
	trash "$nested_dir"
}

paths() {
    # display $PATH as a readable list
    echo $PATH | tr ':' '\n' | uniq | sed 's/^/\t/'
}

folder(){ basename "$PWD"}
parent(){ basename "$(dirname $PWD)"}

# completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"