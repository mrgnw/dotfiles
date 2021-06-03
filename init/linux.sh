is_linux || return 1

apps=(
    curl
    openssh-server
    flatpak
    docker-compose
)

sudo apt-get update
sudo apt-get install -y $apps

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

 apps2=(
 	obs-studio
	lutris
    latte-dock
 )
 sudo apt-get install -y $apps2

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

# snap
snap install --edge 1password
snap install whitesur-gtk-theme

# ssh
sudo ufw allow ssh
# don't show login message to ssh users
touch ~/.hushlogin
