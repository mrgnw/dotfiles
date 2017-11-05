#!/bin/zsh
alias terminalcheat='open https://github.com/0nn0/terminal-mac-cheatsheet'

# Sublime stuff
echo 'export PATH=$PATH:$HOME/bin' >> ~/.zshrc
alias subl='sublime'
alias speed='speed-test' # install with npm install --global speed-test


if [[ $(uname) == "Darwin" ]]; then

  alias f='open .'
  alias editHosts='sudo $EDITOR /etc/hosts'
  alias icloud="cd /Users/mw/Library/Mobile\ Documents/com\~apple\~CloudDocs"
  alias showHiddenFiles='defaults write com.apple.finder ShowAllFiles TRUE; killall Finder'
  alias hideHiddenFiles='defaults write com.apple.finder ShowAllFiles FALSE; killall Finder'

  alias power='pmset -g'

  # Merge one folder into another.
  # Like clicking & dragging it in, except it merges files
  merge() {
    echo "Merging $(basename $1) into $(basename $2)"
    ditto $@
    trash $1
  }

  openGate() {
    echo "Opening the gates"
    sudo spctl --master-disable
    defaults write com.apple.LaunchServices LSQuarantine -bool NO
  }

  closeGate() {
    echo "Gatekeeper re-activated"
    sudo spctl --master-enable
    defaults write com.apple.LaunchServices LSQuarantine -bool YES
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

  generateMACaddress(){
    if [ "$1" != "" ]
      then I="$1"
    else
      I="en0"
    fi  
    
    echo ''
    x=$(ifconfig $I | awk '/ether/{print $2}')
    new=$(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')
    echo "old $x »"  
    echo "new $new"
    
    echo ""

    echo "sudo ifconfig $I ether $new"

  }

fi
