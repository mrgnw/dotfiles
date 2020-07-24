#!/usr/bin/env zsh

# install homebrew if necessary
which brew ||  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

CASKS=(
    1password
    aerial
    alfred
    bartender
    brave-browser
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
    pastebot
    slack
    spotify
    sublime-text
    typora
)
echo "  🍺 installing " $CASKS
# parallelized cask download + install
c+ $CASKS

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
# parallelized brew download + install
b+ $BREWS

# `brew install user/repo/formula_name` does both `brew tap` & `brew install`
TAPS=(
    homebrew/cask-fonts/font-source-code-pro
    federico-terzi/espanso/espanso
)
b+ $TAPS


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
c+ $QUICKLOOKS
# restart quicklook manager
qlmanage -r
brew cleanup
