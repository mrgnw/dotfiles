setopt autocd

zplugin ice OMZ::zsh-users/zsh-autosuggestions silent wait"0";
zplugin load zsh-users/zsh-autosuggestions

# zplugin ice OMZ::zsh-users/zsh-history-substring-search silent wait"0";
# zplugin load zsh-users/zsh-history-substring-search

mzsh(){
  for f in $Z/init/**/*.sh; do
    echo "init $f";
    source "$f";
  done
}

alias cdd='cd ~/Downloads'
alias ..='cd ..'
alias lsl='ls -l --block-size=M'

alias ❯=""
export ZDIR="$HOME/.zsh"
alias zd="cd $ZDIR"
alias zed="edit $ZDIR"

+d() { mkdir -p $1; cd $1 }

z(){zplg update}  # ; source $HOME/.zshrc

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

daily(){
  RAND_MIN=$(rand 30)
  echo "10 $RAND_MIN * * 1-5"
  (crontab -l ; echo "SHELL=/bin/zsh; 10 $RAND_MIN * * 1-5 $@") | crontab
  crontab -l
}

rand(){
  python -c "from random import randrange; print(randrange(0, $1))"
}

ksh() {(klist -s || kinit) && ssh $@}

killport(){
  lsof -ti:$1 | xargs kill
}