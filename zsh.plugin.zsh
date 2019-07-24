# autoload / lazy load functions 
# http://zsh.sourceforge.net/Doc/Release/Functions.html#Autoloading-Functions

# fpath+=("$HOME/.oh-my-zsh/custom/lazy")
# autoload $HOME/.oh-my-zsh/custom/lazy/*
# source $HOME/.oh-my-zsh/custom/lazy/*
# source $HOME/.oh-my-zsh/custom/lazy/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use

timezsh() {
  for i in $(seq 1 8); 
    do /usr/bin/time $SHELL -ilc -c exit; 
  done
}

setopt autocd
alias ..='cd ..'

alias ❯=''
export ZDIR="$(PWD)/.oh-my-zsh/custom"
alias zdir="cd $ZDIR"
alias zedit="edit $ZDIR"
alias zed=zedit
alias zd=zdir

mcd() { mkdir -p $1; cd $1 }

alias cdd='cd ~/Downloads/'

alias dev='mcd ~/dev'
alias z="source $HOME/.zshrc"

alias lsl='ls -l --block-size=M'

#--------------------------
# Additional configuration
#--------------------------

# Takes a command that runs one at a time `app cmd parameter`
# Runs the command on a list of parameters. `app cmd 1 2 3 4…`
rpt() {
  local app=$1
  shift
  local cmd=$1
  shift
  for i in "$@"
  do
    $app $cmd "$i"
  done
}


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


historySummary() {
  history | awk '{CMD[$2]++;count++;}END\
   { for (a in CMD)\
   print CMD[a] " " CMD[a]/count*100 "% " a;\
   }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}

# Shows top x commands. Defaults to 5
# zsh_stats does this - but only does 20, not a flexible amount
hist() {
  if [ $# -eq 0 ]; then
    historySummary 10
  else
    historySummary $1
  fi
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
