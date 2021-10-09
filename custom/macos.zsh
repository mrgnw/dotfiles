[[ "$OSTYPE" = "darwin"* ]] || return 1
export EDITOR=subl

# icloud + synced private configs
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"

# assumes folders don't conflict with $(pcname)
pcname() { scutil --get ComputerName }
icfg="$ICLOUD/.config"
device="$icfg/$(pcname)"

for f in $icfg/*.zsh; do source "$f"; done
for f in $device/*.zsh; do source "$f"; done

icloud() { cd $ICLOUD }
bgdir="$ICLOUD/Images/background"
bgs() {cd $bgdir }

alias o='open .'

mic() {SwitchAudioSource -t input -s "MacBook Pro Microphone"}

screens() {
	defaults write com.apple.screencapture location $@
	killall SystemUIServer
}

sms() {
	open "sms://open?addresses=$1/&body=$2"
}

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

com.which(){
	local app_name="$*"  # src https://unix.stackexchange.com/a/197794/77873
	osascript -e "id of app \"$app_name\""  # src https://robservatory.com/easily-see-any-apps-bundle-identifier/
}