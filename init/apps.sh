#!/usr/bin/env zsh

# install/update homebrew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask

CASKS=(
	1password
	# aerial
	bartender
	brave-browser
	discord
	docker
	firefox
	github
	golang
	iina
	insomnia
	istat-menus
	keycastr
	macmediakeyforwarder
	osxfuse
	pastebot
	slack
	spotify
	typora
	visual-studio-code
)
echo "  🍺 installing " $CASKS
# parallelized cask download + install
c+ $CASKS

# 1password extensions
open -gj -a Safari https://1password.com/downloads/mac/#browsers
open -gj -a firefox https://1password.com/browsers/firefox/
open -gj -a "Brave Browser" https://chrome.google.com/webstore/detail/1password-extension-deskt/aomjjhallfgjeglblehebfpbcfeobpgk

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
brew install mas
export MAS_APPS=(
	1438243180 # Dark Reader safari
	1055511498 # Day One
	411643860  # Daisy Disk
	413857545  # Divvy
	975890633  # HotKey App (1.3.1)
	441258766  # Magnet window manager
	1510445899 # Meeter for Zoom, Teams & Co
	1153157709 # Speedtest by Ookla
	727593140  # VPN Unlimited
)
mas install $MAS_APPS

BREWS=(
	docker
	ffmpeg
	fzf
	git-delta
	git-extras
	httpie
	jq
	node
	pyenv
	pyenv-virtualenv
	spoof-mac
	switchaudio-osx
	tree
	youtube-dl
	federico-terzi/espanso/espanso
)
echo "  🍺 installing " $BREWS
# parallelized brew download + install
b+ $BREWS

espanso install mac-symbols

quicklooks=(
	qlcolorcode
	qlstephen
	qlmarkdown
	quicklook-json
	qlimagesize
	suspicious-package
	apparency
	quicklookasel
	qlvideo
)
b+ $quicklooks

brew cleanup

# interactive 🗝
brew cask install zoomus
