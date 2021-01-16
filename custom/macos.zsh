is_macos || return 1
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
_dev="$ICLOUD/dev"
bgdir="$ICLOUD/Images/background"}

alias o='open .'

# icloud folder for syncing custom device scripts
_device="$ICLOUD/.devices/$(sysctl -n hw.model)"
mkdir -p $_device
for f in $_device_cfg/*.zsh; do source "$f"; done

ip() {curl -sS ipinfo.io | jq --sort-keys}
mic() {SwitchAudioSource -t input -s "MacBook Pro Microphone"}

screendir() {defaults write com.apple.screencapture location $@
killall SystemUIServer}

sms() {
    open "sms://open?addresses=$1/&body=$2"
}
osa() {osascript}
js() {osascript -il JavaScript}

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
    ramdisksize=$(($1 * 2048 * 1024))
    echo $ramdisksize
    diskutil erasevolume HFS+ "RAM Disk $1gb" $(hdiutil attach -nobrowse -nomount ram://$ramdisksize)
}
