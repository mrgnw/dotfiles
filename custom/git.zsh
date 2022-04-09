#!/bin/zsh
alias gits='git status'
alias gd='cd ~/.config/git'
alias ged='code ~/.config/git'
alias gedl='git config --edit'

deg() {
    degit $@
    cd $1
}