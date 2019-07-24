#!/bin/zsh

export EDITOR='code'
alias edit=$EDITOR
function e() {
    edit ${1:-.}
}

alias typora='open -a typora'
alias tp='typora'