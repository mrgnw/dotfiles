#!/bin/zsh
alias terminalcheat='open https://github.com/0nn0/terminal-mac-cheatsheet'
alias speed='speed-test' # install with npm install --global speed-test
alias o='open .'

if [[ $(uname) == "Darwin" ]]; then

  # Sublime stuff
  # alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl --new-window $@'
  # deprecated. initMac now sets up subl link to the subl binary
  export EDITOR='subl'

  # alias f='open .'
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
    echo "Gatekeeper deactivated"
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


  nocorners() {
    defaults write com.apple.dock wvous-bl-corner -int 0
    defaults write com.apple.dock wvous-br-corner -int 0
    defaults write com.apple.dock wvous-tl-corner -int 0
    defaults write com.apple.dock wvous-tl-corner -int 0
    defaults write com.apple.dock wvous-br-modifier -int 0
    defaults write com.apple.dock wvous-bl-modifier -int 0
    defaults write com.apple.dock wvous-tl-modifier -int 0
    defaults write com.apple.dock wvous-t4-modifier -int 0
  }

  corner() {
    base='defaults write com.apple.dock wvous-'

    # modifiers
    mod_none=0
    mod_shift=131072
    mod_control=262144
    mod_option=524288
    mod_cmd=1048576

    # Possible values:
    # tl, tr, bl, br = topleft, topright, bottomleft, bottomright
    #  0: nothing
    #  2: Mission Control
    #  3: Show application windows
    #  4: Desktop
    #  5: Start screen saver
    #  6: Disable screen saver
    #  7: Dashboard
    # 10: Sleep display
    # 11: Launchpad
    # 12: Notification Center
    # 13: Lock screen

    # $1 = $corner
    # $2 = $action
    # $3 = modifier

    # ex: `corner tl 11 0`
    echo "$base-$1-corner -int $2"
    echo "$base-$1-modifier -int $3"

  }

  # corner-defaults = [
  # "tl 0 0",
  # "tr 0 0",
  # "bl 0 0",
  # "tr 0 0"
  # ]

fi
