#!/bin/zsh

export EDITOR='code'
edit(){$EDITOR $@}
e() { edit ${1:-.zd} }

alias typora='open -a typora'
alias tp='typora'