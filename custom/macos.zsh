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
