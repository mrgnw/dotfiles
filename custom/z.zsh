export ZDIR="$HOME/.zsh"
alias zd="cd $ZDIR"
alias zed="code $ZDIR"

alias ❯=''
alias ..='cd ..'
alias cdd='cd ~/Downloads'
alias copylast="!-1 | pbcopy"
alias ls='ls -h'
alias la='ls -lah'

+d() { mkdir -p $1; cd $1 }
+line(){ grep -qF -- "$2" "$1" || echo "$2" >> "$1"}
rand(){ python -c "from random import randrange; print(randrange(0, ${1:-10}))" }
word(){ sed `perl -e "print int rand(99999)"`"q;d" /usr/share/dict/words }

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