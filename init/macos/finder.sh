#!/usr/bin/env zsh
is_macos || return 1

echo ""
echo "📁  FINDER & Dock"
echo "Start with a fresh dock"
defaults write com.apple.dock persistent-apps -array
# todo: defaults write com.apple.dock persistent-apps ...
echo " - autohide dock"
defaults write com.apple.dock autohide -bool true

echo "  📂  New window = home"
defaults write com.apple.finder NewWindowTarget -string "PfHm"

echo "   👉  tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# todo: ctrl+scroll to zoom

echo " 📁 sort folders first"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

echo " 🚫  remove extension warning"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
echo " 🚫  empty trash warning"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

echo " 🚫  Auto-rearranging spaces"
defaults read com.apple.dock mru-spaces -bool false

echo " 🚫  Opening photos app automatically 📷"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

killall Finder
killall Dock

echo "✅  Finder & Dock"