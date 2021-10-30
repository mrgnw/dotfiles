#!/usr/bin/env zsh
is_macos || return 1

# install/update homebrew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask

CASKS=(
	1password
	aerial
	bartender
	beekeeper-studio
	docker
	github
	iina
	insomnia
	istat-menus
	keycastr
	macmediakeyforwarder
	pastebot
	spotify
	sublime-text
	typora
	visual-studio-code
	workflowy
)

BREWS=(
	docker
	diskonaut
	ffmpeg
	fzf
	zoxide
	git-delta
	git-extras
	gotop
	httpie
	curlie
	gping
	jq
	node
	pyenv
	pyenv-virtualenv
	tree
	youtube-dl
	federico-terzi/espanso/espanso
	jesseduffield/lazydocker/lazydocker
	cloudflare/cloudflare/cloudflared
	choose-rust
	procs
	zoxide
)
echo "  🍻 Installing casks & brews in parallel! 🍻"
echo "  🍺 brew install" $BREWS
echo "  🍺 brew install --cask" $CASKS
c+ $CASKS & b+ $BREWS

espanso install mac-symbols

# 1password extensions
open -gj -a Safari https://1password.com/downloads/mac/#browsers

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
brew install mas
export MAS_APPS=(
	1438243180 # Dark Reader safari
	411643860  # Daisy Disk
	# 413857545  # Divvy
	975890633  # HotKey App (1.3.1)
	# 441258766  # Magnet window manager
	1510445899 # Meeter for Zoom, Teams & Co
	1153157709 # Speedtest by Ookla
	# 727593140  # VPN Unlimited
)
mas install $MAS_APPS


espanso install mac-symbols

quicklooks=(
	qlcolorcode
	qlstephen
	qlmarkdown
	quicklook-json
	qlimagesize
	suspicious-package
	apparency
	qlvideo
)
b+ $quicklooks

brew cleanup

# interactive 🗝
brew cask install zoomus
