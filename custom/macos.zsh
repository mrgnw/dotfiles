is_macos || return 1

alias o='open .'
ip(){curl -sS ipinfo.io | jq --sort-keys}
mic(){SwitchAudioSource -t input -s "MacBook Pro Microphone"}

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

icloud(){cd "$ICLOUD"}
bgdir(){cd "$ICLOUD/Images/background"}
dev(){cd "$ICLOUD/dev/"}

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

corner() {
  # args: corner action modifier
  # ex: `corner tl launchpad`
  
  # $1 corners: 
  #   tl, tr, bl, br = topleft, topright, bottomleft, bottomright
  
  # $2 action from this array
  actions=(
    -  # Nothing
    mission_control
    app_windows
    desktop
    start_screen_saver
    disable_screen_saver
    dashboard
    8  # placeholder
    9  # placeholder
    sleep_display
    launchpad
    notification_center
    lock_screen
  )
  action_input=$2
  # get index of action
  action_value="${actions[(ie)${action_input:-0}]}"
  
  
  set_cmd='defaults write com.apple.dock wvous-'
  # set corner
  "$set_cmd-$1-corner -int $action_value"
  # set modifier (shift/control/option/cmd)
  "$set_cmd-$1-modifier -int ${3:-0}"  
  
  # $3 modifier default 0
  #   131072  # shift
  #   262144  # control
  #   524288  # option
  #   1048576 # cmd
}
