#!/bin/zsh
alias o='open .'
alias ip='curl -sS ipinfo.io | jq --sort-keys'
alias mic='SwitchAudioSource -t input -s "MacBook Pro Microphone"'

alias bgdir='cd $BG_DIR'
alias icloud="cd $ICLOUD"
export BG_DIR='$ICLOUD/Images/background'
export ICLOUD='~/Library/Mobile\ Documents/com\~apple\~CloudDocs'

alias speed='speed-test' # install with npm install --global speed-test

alias osa='osascript'
alias osajs='osascript -il JavaScript'
alias terminalcheat='open https://github.com/0nn0/terminal-mac-cheatsheet'
alias chrome-rd='launchctl start org.chromium.chromoting && echo "chrome remote desktop should be running now"'

#   Update all Wallpapers
function wallpaper() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock 
}

# todo: mass install by appname, instead of id.
# e.g. mas install lanscan = mas search lanscan » mas install 472226235

if [[ $(uname) == "Darwin" ]]; then

  # change screenshot directory
  screenshotDir() {
	# todo: see if directory exists & create if it doesn't
	defaults write com.apple.screencapture location $@; killall SystemUIServer
  }

  # alias f='open .'
  alias editHosts='sudo $EDITOR /etc/hosts'
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
  
  # Move the apps you never use to /Applications/Utilities
  # ex: TextEdit || TextEdit.app || /Applications/TextEdit.app
  buryApp() {
    for x in $@; do
      app=$(basename "$x")
      app="${app%.*}"

      if [ -e /Applications/$app.app ]
      then
      sudo mv /Applications/$app.app /Applications/Utilities/$app.app
      else if [ -e /Applications/Utilities/$app.app ]
        then # It's already in Utilities
          # echo " ➡️  Utilities $app"
        else # It's not in Applications or Utilities
          # echo "$app not in Applications or Utilities"
        fi
      fi
    done
    }

fi