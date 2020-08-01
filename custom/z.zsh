# todo: show commands per file?

alias cdd='cd ~/Downloads'
alias ..='cd ..'
alias ls='ls -h'
alias la='ls -lah'
+d() { mkdir -p $1; cd $1 }

❯(){""}
export ZDIR="$HOME/.zsh"
alias zd="cd $ZDIR"
alias zed="edit $ZDIR"

export EDITOR=code
edit(){ $EDITOR $@ }

# simple ping function
simpleping() {
  ping $1 | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";
};
sping() { simpleping ${@:-"8.8.8.8"} }
alias sp='sping'

rand(){
  python -c "from random import randrange; print(randrange(0, $1))"
}

ksh() {(klist -s || kinit) && ssh $@}
kshtail() { ksh -t $1 "tail -f $2" }
killport(){ lsof -ti:$1 | xargs kill }

shtime() {
  for i in $(seq 1 ${1:-3});
    do time $SHELL -i -c exit;
  done
}
alias sht='shtime'

export GREP_OPTIONS='--color=always'
export CLICOLOR=1
