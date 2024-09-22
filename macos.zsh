is_macos || return 1
ICLOUD="$HOME/Library/Mobile Documents/com~apple~CloudDocs"
EDITOR=cursor

alias o='open .'

tabs -3

com.which(){
	local app_name="$*"  # src https://unix.stackexchange.com/a/197794/77873
	osascript -e "id of app \"$app_name\""  # src https://robservatory.com/easily-see-any-apps-bundle-identifier/
}

# Merge one folder into another.
merge() {
	echo "Merging $(basename $1) into $(basename $2)"
	ditto $@
	trash $1
}

screens() {
	defaults write com.apple.screencapture location $@
	killall SystemUIServer
}

sms() {open "sms://open?addresses=$1/&body=$2" }

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"