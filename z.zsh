setopt autocd

nukez(){
  rm -rf ~/.zplugin;
  degit https://github.com/zdharma/zplugin.git ~/.zplugin/bin;
}

alias ..='cd ..'
alias lsl='ls -l --block-size=M'

alias ❯=""
export ZDIR="$HOME/.zsh"
alias zd="cd $ZDIR"
alias zed="edit $ZDIR"

+d() { mkdir -p $1; cd $1 }

alias dev="mcd $HOME/dev"
z(){zplg update}  # ; source $HOME/.zshrc

# highlighters
zplugin ice silent wait"0";
zplugin load zdharma/fast-syntax-highlighting

HISTFILE=~/.zsh_history
HISTSIZE=5555
SAVEHIST=5555
setopt appendhistory

# simple ping function
simpleping() {
  ping $1 | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";
};

sp() { simpleping $1 }
sping() { simpleping $1 }
spg() { sp google.com }
sp8() { sp 8.8.8.8 }

