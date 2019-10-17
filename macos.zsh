#!/bin/zsh
alias o='open .'
ip(){curl -sS ipinfo.io | jq --sort-keys}
mic(){SwitchAudioSource -t input -s "MacBook Pro Microphone"}

icloud(){cd "$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs"}
bgdir(){cd "$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs"}

screenshotDir(){defaults write com.apple.screencapture location $@; killall SystemUIServer}
showFiles(){defaults write com.apple.finder ShowAllFiles TRUE; killall Finder}
hideFiles(){defaults write com.apple.finder ShowAllFiles FALSE; killall Finder}

sms(){
  open "sms://open?addresses=$1/&body=$2"
}
osa(){osascript}
js(){osascript -il JavaScript}
# alias terminalcheat='open https://github.com/0nn0/terminal-mac-cheatsheet'
# alias chrome-rd='launchctl start org.chromium.chromoting && echo "chrome remote desktop should be running now"'

#   Update all Wallpapers
function wallpaper() {
    sqlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

# Merge one folder into another.
merge() {
  echo "Merging $(basename $1) into $(basename $2)"
  ditto $@
  trash $1
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