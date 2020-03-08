#!/usr/bin/env zsh

# install homebrew if necessary
which brew ||  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# brewin & caskin download packages concurrently as apps install
CASKS=(
    1password
    pastebot
    spotify
    vscodium
    typora
    notion
    slack
    firefox
    github
    iina
    istat-menus
    
    bartender
    brave-browser
    docker
    kitematic
    insomnia

    alfred
    keycastr
    macmediakeyforwarder
    
    sublime-text
    aerial
)
echo "  🍺 installing " $CASKS
caskin $CASKS

# MAS
# requires manual sign in first. https://github.com/mas-cli/mas/issues/164
brew install mas
export MAS_APPS=(
    975890633   # HotKey App (1.3.1)
    441258766   # Magnet window manager
    413857545   # divvy
    419330170   # moom
    1438243180  # dark reader
    1055511498  # Day One
    # 1006087419  # SnippetsLab
    727593140   # VPN Unlimited
)
 mas install $MAS_APPS


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
    spoof-mac
    tree
    youtube-dl
    switchaudio-osx
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
