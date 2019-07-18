# brewin & caskin download packages concurrently as apps install
CASKS=(
    1password
    pastebot
    spotify
    vscodium  # visual-studio-code built from source
    typora
    slack
    firefox
    github
    iina
    istat-menus
    
    bartender
    brave-browser
    zoomus
    
    nightowl

    docker
    kitematic
    insomnia

    alfred
    keycastr
    macmediakeyforwarder
    
    sublime-text
    fork
)
echo "  🍺 installing " $CASKS
caskin $CASKS

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
export MAS_APPS=(
    975890633   # HotKey App (1.3.1)
    441258766   # Magnet window manager
    1055511498  # Day One
    1006087419  # SnippetsLab
    727593140   # VPN Unlimited
)
brew install mas && mas install $MAS_APPS


BREWS=(
    git
    node
    pyenv
    pyenv-virtualenv

    coreutils
    docker
    ffmpeg
    httpie
    hub
    jq
    tree
    youtube-dl
)
echo "  🍺 installing " $BREWS
brewin $BREWS

# source code pro
brew tap homebrew/cask-fonts && brew cask install font-source-code-pro

# github.com/sindresorhus/quick-look-plugins
QUICKLOOKS=(
    # quicklookase
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlstephen
    qlvideo
    quicklook-csv
    quicklook-json
    webpquicklook
)
caskin $QUICKLOOKS
# restart quicklook manager
qlmanage -r
brew cleanup
