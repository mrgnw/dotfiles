#!/bin/zsh
alias gits='git status'
alias gd='cd ~/.config/git'
alias ged='code ~/.config/git'
alias gedl='git config --edit'

rsa() {
  if [[ ! -e ~/.ssh/id_rsa.pub ]]; then
    ssh-keygen -t rsa -b 4096 -C morganfwilliams@gmail.com
  else
    pbcopy <~/.ssh/id_rsa.pub
  fi
  echo "rsa copied"
}
