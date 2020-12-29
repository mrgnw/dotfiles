#!/bin/zsh
function is_macos() { [[ "$OSTYPE" =~ ^darwin ]] || return 1 }
function is_m1(){ [[ "Apple M1" == $(sysctl -n machdep.cpu.brand_string) ]] || return 1 }

setopt autocd
setopt auto_list
setopt auto_menu
setopt correct
setopt auto_param_keys
setopt hist_ignore_dups
setopt interactive_comments

.install(){
  for f in $Z/init/**/*.sh; do
    echo "init $f";
    source "$f";
  done
}