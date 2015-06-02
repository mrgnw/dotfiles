#!/bin/zsh
alias terminalcheat='open http://bit.ly/osxterminalcheatsheet'

if [[ $(uname) == "Darwin" ]]; then

  alias f='open .'
  alias editHosts='sudo $EDITOR /etc/hosts'
  alias cdicloud="cd /Users/mw/Library/Mobile\ Documents/com\~apple\~CloudDocs"
  alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE; killall Finder'
  alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE; killall Finder'

  # Merge one folder into another.
  # Like clicking & dragging it in, except it merges files
  merge() {
    echo "Merging $(basename $1) into $(basename $2)"
    ditto $@
    trash $1
  }


  # this should already be loading from oh-my-zsh
  trash() {
    local trash_dir="${HOME}/.Trash"
    local temp_ifs="$IFS"
    IFS=$'\n'
    for item in "$@"; do
      if [[ -e "$item" ]]; then
        item_name="$(basename $item)"
        if [[ -e "${trash_dir}/${item_name}" ]]; then
          mv -f "$item" "${trash_dir}/${item_name} $(date "+%H-%M-%S")"
        else
          mv -f "$item" "${trash_dir}/"
        fi
      fi
    done
    IFS=$temp_ifs
  }

fi
