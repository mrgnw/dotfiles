setopt autocd
setopt auto_list
setopt auto_menu
setopt correct
setopt auto_param_keys
setopt hist_ignore_dups
setopt interactive_comments

export GREP_OPTIONS='--color=always'

export EDITOR=code
edit(){ $EDITOR $@ }

# OS detection
function is_macos() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
mzsh(){
  for f in $Z/init/**/*.sh; do
    echo "init $f";
    source "$f";
  done
}

alias cdd='cd ~/Downloads'
alias ..='cd ..'
alias lsl='ls -l --block-size=M'

❯(){""}
export ZDIR="$HOME/.zsh"
alias zd="cd $ZDIR"
alias zed="edit $ZDIR"

+d() { mkdir -p $1; cd $1 }

zz(){zplg update}  # ; source $HOME/.zshrc

# highlighters
zplugin ice lucid wait"0";
zplugin load zdharma/fast-syntax-highlighting

# simple ping function
simpleping() {
  ping $1 | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";
};

sp() { simpleping $@ }
sping() { simpleping $@ }
spg() { sp google.com }
sp8() { sp 8.8.8.8 }

rand(){
  python -c "from random import randrange; print(randrange(0, $1))"
}

ksh() {(klist -s || kinit) && ssh $@}
kshtail() { ksh -t $1 "tail -f $2" }
killport(){ lsof -ti:$1 | xargs kill }