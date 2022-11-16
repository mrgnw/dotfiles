#!/usr/bin/env zsh
is_macos || return 1

# install/update homebrew
which brew || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask

CASKS=(
	1password
	bartender
	bettertouchtool
	docker
	github
	iina
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
	duckdb
	dust
	duf
	zoxide
	git-delta
	git-extras
	gotop
	httpie
	curlie
	gping
	jq
	pdm
	tree
	jesseduffield/lazydocker/lazydocker
	cloudflare/cloudflare/cloudflared
	choose-rust
	procs
	sd # sed alternative
)
echo "  🍻 Installing casks & brews in parallel! 🍻"
echo "  🍺 brew install" $BREWS
echo "  🍺 brew install --cask" $CASKS
c+ $CASKS & b+ $BREWS

# github.com/dundee/gdu
brew install -f gdu
brew link --overwrite gdu  # if you have coreutils installed as well

# 1password extensions
open -gj -a Safari https://1password.com/downloads/mac/#browsers

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
brew install mas
export MAS_APPS=(
	1438243180 # Dark Reader safari
	411643860  # Daisy Disk
	975890633  # HotKey App (1.3.1)
	1153157709 # Speedtest by Ookla
	1545870783  # System Color Picker

)
mas install $MAS_APPS


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
