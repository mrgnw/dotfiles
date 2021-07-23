is_linux || return 1

apps=(
    bat   # pretty cat
    curl
    delta
    dust
    openssh-server
    flatpak
    docker-compose
    ncdu  # disk space analyzer
)

sudo apt update
sudo apt install -y $apps

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install jq tgotwig/linux-dust

 apps2=(
 	obs-studio
	lutris
    latte-dock
 )
 sudo apt install -y $apps2

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
