export PATH="$PATH:/Users/m1/Library/Python/3.9/bin"

export ZDIR="$HOME/.zsh"
alias zd="cd $ZDIR"
alias zed="code $ZDIR"
alias spanso='espanso edit'

alias ❯=''
alias ..='cd ..'
alias cdd='cd ~/Downloads'
alias copylast="!-1 | pbcopy"
alias ls='ls -h'
alias la='ls -lah'

h(){ tldr "$1" | man "$1" | "$1" --help | "$1" -h }
alias disks='duf -only local,fuse'

+d() { mkdir -p $1; cd $1 }
+line(){ grep -qF -- "$2" "$1" || echo "$2" >> "$1"}
rand(){ python -c "from random import randrange; print(randrange(0, ${1:-10}))" }
word(){ sed `perl -e "print int rand(99999)"`"q;d" /usr/share/dict/words }

oy(){ echo "${@:-Oy!}" }

scr() {
	if [ "$#" -eq "0" ];
        then screen -ls;
	    else screen -D -R -S $1 $@;
	fi
}

# CONF
HISTFILE="$HOME/.zsh_history"
HISTSIZE=1_000_000
SAVEHIST=1_000_000
setopt hist_ignore_all_dups
setopt hist_ignore_space
# setopt SHARE_HISTORY        # Share history between all sessions.
# setopt INC_APPEND_HISTORY   # Write to the history file immediately, not when shell exits.

denest(){
	# default assuems nested_dir is same as the current directory name
	# nested_dir is $1 or the folder name of $PWD
	nested_dir="${1:-$(basename $(pwd))}"
	mv "$nested_dir"/* .
	echo "$nested_dir"
	rm -rf "$nested_dir"
}

