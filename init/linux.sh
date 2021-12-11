is_linux || return 1

apps=(
	bat   # pretty cat
	curl
	delta
	dust
	gping
	openssh-server
	flatpak
	docker-compose
	diskonaut
	ripgrep
)

sudo apt update
sudo apt install --ignore-missing -y $apps

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brews=(
	jq
	tealdeer
	# rs/tap/curlie
	choose-rust
	zoxide
	glances
	clementtsang/bottom
)
brew install $brews

# flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpaks=(
	Discord
	spotify
	com.visualstudio.code
	typora
	tangram
	GreenWithEnvy
	Spotify
	sublimemerge
)
flatpak install $flatpaks

# ssh
sudo ufw allow ssh
# don't show login message to ssh users
touch ~/.hushlogin
