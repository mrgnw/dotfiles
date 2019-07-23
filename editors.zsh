#!/bin/zsh

export EDITOR='code'
alias edit=$EDITOR
function e() {
    edit ${1:-.}
}