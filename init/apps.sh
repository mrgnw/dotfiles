#!/usr/bin/env zsh

# install/update homebrew
which brew ||  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew cask

CASKS=(
    1password
    aerial
    bartender
    brave-browser
    discord
    docker
    firefox
    github
    iina
    insomnia
    istat-menus
    keycastr
    kitematic
    macmediakeyforwarder
    notion
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

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
brew install mas
export MAS_APPS=(
    1438243180 # Dark Reader safari
    1055511498 # Day One
    413857545  # Divvy
    975890633  # HotKey App (1.3.1)
    441258766  # Magnet window manager
    1510445899 # Meeter for Zoom, Teams & Co
    727593140  # VPN Unlimited
)
 mas install $MAS_APPS


BREWS=(
    docker
    ffmpeg
    git
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

# github.com/sindresorhus/quick-look-plugins
QUICKLOOKS=(
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlstephen
    quicklook-json
    webpquicklook
)
c+ $QUICKLOOKS
# restart quicklook manager
qlmanage -r
brew cleanup

# interactive 🗝
brew cask install qlvideo zoomus
