is_macos || return 1

alias o='open .'
ip(){curl -sS ipinfo.io | jq --sort-keys}
mic(){SwitchAudioSource -t input -s "MacBook Pro Microphone"}

ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

icloud(){cd "$ICLOUD"}
bgdir(){cd "$ICLOUD/Images/background"}
dev(){cd "$ICLOUD/dev/"}

screenshotDir(){defaults write com.apple.screencapture location $@; killall SystemUIServer}

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

ramdisk() {
  # 
  ramdisksize=$(($1 * 2048 * 1024))
  echo $ramdisksize
  diskutil erasevolume HFS+ "RAM Disk $1gb" `hdiutil attach -nobrowse -nomount ram://$ramdisksize`
}