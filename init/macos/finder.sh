#!/usr/bin/env zsh
is_macos || return 1

echo ""
	echo "📁  FINDER & Dock"
	# echo "🌒  Dark mode"

	echo "Start with a completely fresh dock"
	defaults write com.apple.dock persistent-apps -array

	echo "System - Disable the 'Are you sure you want to open this application?' dialog\n"
	defaults write com.apple.LaunchServices LSQuarantine -bool false

	# https://github.com/austinsonger/HandyScripts/blob/9893ed47bfee3905114d8e6d6567ba22775ed74b/MacOS/MacOS.Setup/default.settings.sh
	printf "System - Require password immediately after sleep or screen saver begins\n"
	defaults write com.apple.screensaver askForPassword -int 1
	defaults write com.apple.screensaver askForPasswordDelay -int 0

	printf "Finder - Allow quitting via COMMAND+Q -- Doing so will also hide desktop icons\n"
	defaults write com.apple.finder QuitMenuItem -bool true

	printf "Trackpad - Enable tap to click for current user and the login screen\n"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int

	printf "Trackpad - Use CONTROL (^) with scroll to zoom\n"
	defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
	defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

	printf "Bluetooth - Increase sound quality for headphones/headsets\n"
	defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

	echo "  📂  New window = home"
	defaults write com.apple.finder NewWindowTarget -string "PfHm"

	echo "  🐭  Mouse prefs"
	echo "   👉  tap to click"
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

	echo "   🔍  ctrl+scroll to zoom"
	defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
	defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
	# Follow the keyboard focus while zoomed in
	defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true



	echo "   ♨️  Hot corners"
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
	echo "     ↙️ 💤  Sleep display"
	defaults write com.apple.dock wvous-bl-corner -int 10
	defaults write com.apple.dock wvous-bl-modifier -int 0
	echo "     ↘️ 🖥  Desktop "
	defaults write com.apple.dock wvous-br-corner -int 4
	defaults write com.apple.dock wvous-br-modifier -int 0
	echo "     ↖️ 🚀  Mission control"
	defaults write com.apple.dock wvous-tl-corner -int 2
	defaults write com.apple.dock wvous-tl-modifier -int 0

	echo " - autohide dock"
	defaults write com.apple.dock autohide -bool true

	# enable select in QuickLook
	echo " 🔍 QuickLook"
	quicklookApps # tested alone in Terminal, but not as part of this script
	defaults write com.apple.finder QLEnableTextSelection TRUE

	echo " - status & path bar"
	defaults write com.apple.finder ShowStatusBar -bool true
	defaults write com.apple.finder ShowPathbar -bool true

	echo " 📁 sort with folders on top"
	defaults write com.apple.finder _FXSortFoldersFirst -bool true

	echo " 🚫  change extension warning"
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	echo " 🚫  empty trash warning"
	defaults write com.apple.finder WarnOnEmptyTrash -bool false

	echo " 🚫  .DS_Store on network or USB volumes"
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

	echo " 🚫  Time Machine prompt to use new hard drives as backup volume"
	defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

	echo " 🚫  Dashboard"
	defaults write com.apple.dashboard mcx-disabled -bool true
	defaults write com.apple.dock dashboard-in-overlay -bool true

	echo " 🚫  Auto-rearranging spaces"
	defaults write com.apple.dock mru-spaces -bool false

	echo " 🚫  Opening photos app automatically 📷"
	defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

	# Add iOS simulator to launch pad
	sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"

	killall Finder
	killall Dock

	echo "✅  Finder & Dock"