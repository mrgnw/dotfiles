is_linux || return 1

# dnf
sudo dnf install -y snapd gnome-tweaks
 extra_apps=(
 	obs-studio  
	lutris
 )
 sudo dnf install -y $extra_apps

# flatpak
flatpaks=(
    Discord
    Visual Studio Code
    Tangram
)

# snap
snap install --edge 1password
snaps=(
    snap-store
    typora
    spotify
    whitesur-gtk-theme
)
sudo snap install $snaps