#!/usr/bin/env zsh

# install/update homebrew
which brew ||  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# brewin & caskin download packages concurrently as apps install
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
caskin $CASKS

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
brew install mas
export MAS_APPS=(
    1438243180 # Dark Reader safari
    1055511498 # Day One
    413857545  # Divvy
    975890633  # HotKey App (1.3.1)
    441258766  # Magnet window manager
    419330170  # Moom
    727593140  # VPN Unlimited
)
 mas install $MAS_APPS


BREWS=(
    coreutils
    docker
    ffmpeg
    git
    httpie
    hub
    jq
    node
    pyenv
    pyenv-virtualenv
    spoof-mac
    switchaudio-osx
    tree
    youtube-dl
)
echo "  🍺 installing " $BREWS
brewin $BREWS

# `brew install user/repo/formula_name` does both `brew tap` & `brew install`
TAPS=(
    homebrew/cask-fonts/font-source-code-pro
    federico-terzi/espanso/espanso
)
brewin $TAPS


# github.com/sindresorhus/quick-look-plugins
QUICKLOOKS=(
    qlcolorcode
    qlimagesize
    qlmarkdown
    qlstephen
    qlvideo
    quicklook-json
    webpquicklook
)
caskin $QUICKLOOKS
# restart quicklook manager
qlmanage -r
brew cleanup
