# node defaults






# MacOS customizations
# --------------------------------------
if [[ $(uname) == "Darwin" ]]; then

  # todo: add safari custom css https://gist.github.com/pat/fcc36b1663f71b325fcf
  # todo: + my own css

  # change screenshot directory
  screenshotDir () {
    # todo: see if directory exists & create if it doesn't
    defaults write com.apple.screencapture location $@; killall SystemUIServer
  }

  screenshotName () {
    defaults write com.apple.screencapture name $1; killall SystemUIServer
  }

  standardNode () {

    nodeApps=(
      degit
      now
      pnpm
      spoof
      surge
    )
    npm install --global ${nodeApps[@]}

  }

  quicklookApps () {
    # github.com/sindresorhus/quick-look-plugins
    qlList=(
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

    brew cask install ${qlList[@]}


    # restart quicklook manager
    qlmanage -r
  }

  standardBrews() {
    brews=(
      coreutils
      docker
      ffmpeg
      git
      httpie
      hub
      jq
      mas
      node
      # thefuck
      tree
      youtube-dl
    )
    echo "  🍺 brew installing " ${brews[@]}
    brew install ${brews[@]}
    brew cleanup
  }

  standardApps() {
    casks=(
      1password
      1password-cli
      # alfred
      bartender
      brave-browser
      # chrome-remote-desktop-host
      firefox
      fork
      google-chrome
      # handbrake
      github
      iina
      iterm2
      keycastr
      lepton
      macmediakeyforwarder
      mpv
      istat-menus
      slack
      spotify
      sublime-text
      # transmission
      typora
      vscodium # visual-studio-code built from source
      # webtorrent

    )
    echo "  🍺 installing " ${casks[@]}
    brew cask install ${casks[@]}

    brew tap homebrew/cask-fonts && brew cask install font-source-code-pro

    appstore=(
      727593140   # VPN Unlimited
      1065907486  # CiderTV - AppleTV remote!
      1179623856  # Pastebot
      975890633   # HotKey App (1.3.1)
      441258766   # Magnet window manager (alternative: [Spectacle](https://www.spectacleapp.com))
      1055511498  # Day One
      # 443987910 # 1password
    )
    mas install ${appstore[@]}

    brew cleanup
  }


  # untested
  terminalThemes() {
    # todo: make a variable for this directory
    mcd ~/Downloads/macos-terminal-themes
    curl -L https://github.com/mrgnw/macos-terminal/zipball/master > ~/Downloads/macos-terminal-themes/macos_terminal_themes.zip
    unzip ~/Downloads/macos-terminal-themes/macos_terminal_themes -d ~/Downloads/macos-terminal-themes
    open ~/Downloads/macos-terminal-themes/**/*.terminal
    rm -rf ~/Downloads/macos-terminal-themes

  }

  # Move the apps you never use to /Applications/Utilities
  # ex: TextEdit || TextEdit.app || /Applications/TextEdit.app
  buryApp() {
    for x in $@; do
      app=$(basename "$x")
      app="${app%.*}"

      if [ -e /Applications/$app.app ]
      then
        sudo mv /Applications/$app.app /Applications/Utilities/$app.app
      else if [ -e /Applications/Utilities/$app.app ]
        then # It's already in Utilities
          # echo " ➡️  Utilities $app"
        else # It's not in Applications or Utilities
          # echo "$app not in Applications or Utilities"
        fi
      fi
    done
  }


  #   mas install ${appstore[@]}

  initMac() {
    # Many prefs taken from github.com/mathiasbynens/dotfiles/blob/master/.macos

    echo "🌌 Screenshots"
    echo "   📂 ~/Pictures/Screenshots "
    mkdir ~/Pictures/Screenshots
    screenshotDir ~/Pictures/Screenshots
    echo "   🏷 Name =  {date & time}.png"
    screenshotName 

    # Move apps that I rarely use into the Utilities folder
    buryThese=(
     'Automator'
     'Chess'
     'DVD Player'
     'Font Book'
     'Image Capture'
     'Launchpad'
     'Mail'
     'Mission Control'
     'Photo Booth'
     'Stickies'
     'TextEdit'
     'Time Machine'
     )
    echo "Burying rarely used apps to Utilities"
    sudo buryApp ${buryThese[@]}

    # Enable apps from everywhere - makes getting set up easier
    openGate

    finderDefaults
    safariDefaults

    # set global gitignore to this file
    git config --global core.excludesfile '~/.oh-my-zsh/custom/.gitignore_global'
    ln -s ~/.oh-my-zsh/custom/.gitignore_global ~/.config/git/ignore

    echo "standardBrews"
    standardBrews
    echo "standardApps"
    standardApps
    echo "standardNode"
    standardNode

    configApps

    # Disable smart quotes. Ain't nobody need those
    defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

    echo "🎯 performance"
    echo "  🚫 Sudden motion sensor (SSD don't need that)"
    sudo pmset -a sms 0
    echo "  🚫 Hibernation. No hibernation = faster sleep"
    sudo pmset -a hibernatemode 0

    echo "📡  App store"
    echo "  🔄 Auto-check for updates, daily"
    defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
    defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
    echo "  ⬇️ Auto-download updates"
    defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
    # Turn on app auto-update
    defaults write com.apple.commerce AutoUpdate -bool true


  }

  finderDefaults() {

    echo ""
    echo "📁  FINDER & Dock"
    echo "Start with a completely fresh dock"
    defaults write com.apple.dock persistent-apps -array

    echo "  📂  New window = home"
    defaults write com.apple.finder NewWindowTarget -string "PfHm"

    echo "  🐭  Mouse prefs"
    echo "   👉  tap to click"
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
    defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
    defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

    echo "   🔍  ctrl+scroll to zoom"
    defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
    defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
    # Follow the keyboard focus while zoomed in
    defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

    echo "   ♨️  Hot corners"
    # Possible values:
    # tl, tr, bl, br = topleft, topright, bottomleft, bottomright
    #  0: nothing
    #  2: Mission Control
    #  3: Show application windows
    #  4: Desktop
    #  5: Start screen saver
    #  6: Disable screen saver
    #  7: Dashboard
    # 10: Sleep display
    # 11: Launchpad
    # 12: Notification Center
    # 13: Lock screen
    echo "     ↙️ 💤  Sleep display"
    defaults write com.apple.dock wvous-bl-corner -int 10
    defaults write com.apple.dock wvous-bl-modifier -int 0
    echo "     ↘️ 🖥  Desktop "
    defaults write com.apple.dock wvous-br-corner -int 4
    defaults write com.apple.dock wvous-br-modifier -int 0
    echo "     ↖️ 🚀  Mission control"
    defaults write com.apple.dock wvous-tl-corner -int 2
    defaults write com.apple.dock wvous-tl-modifier -int 0

    echo " - autohide dock"
    defaults write com.apple.dock autohide -bool true

    # enable select in QuickLook
    echo " 🔍 QuickLook"
    quicklookApps # tested alone in Terminal, but not as part of this script
    defaults write com.apple.finder QLEnableTextSelection TRUE

    echo " - status & path bar"
    defaults write com.apple.finder ShowStatusBar -bool true
    defaults write com.apple.finder ShowPathbar -bool true

    echo " 📁 sort with folders on top"
    defaults write com.apple.finder _FXSortFoldersFirst -bool true

    echo " 🚫  change extension warning"
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    echo " 🚫  empty trash warning"
    defaults write com.apple.finder WarnOnEmptyTrash -bool false

    echo " 🚫  .DS_Store on network or USB volumes"
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

    echo " 🚫  Time Machine prompt to use new hard drives as backup volume"
    defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

    echo " 🚫  Dashboard"
    defaults write com.apple.dashboard mcx-disabled -bool true
    defaults write com.apple.dock dashboard-in-overlay -bool true

    echo " 🚫  Auto-rearranging spaces"
    defaults write com.apple.dock mru-spaces -bool false

    echo " 🚫  Opening photos app automatically 📷"
    defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

    # Add iOS simulator to launch pad
    sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"

    killall Finder
    killall Dock

    echo "✅  Finder & Dock"
  }

  safariDefaults() {
    echo ""
    echo "🗺 Safari Dev tools"
    defaults write com.apple.Safari IncludeDevelopMenu -bool true
    defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

    echo "   🕵   Privacy"
    echo "      🚫  Don't track searches"
    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true
    echo "      🚫  Tell sites not to track"
    defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true

    # Warn about fraudulent websites
    defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true

    echo "   ⇥ Tab highlights next item on page"
    defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
    defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true

    echo "🚫  auto-open files"
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

    # Set Safari’s home page to `about:blank` for faster loading
    defaults write com.apple.Safari HomePage -string "about:blank"

    # Hide Safari’s bookmarks bar by default
    defaults write com.apple.Safari ShowFavoritesBar -bool false

    # Update extensions automatically
    defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
  }

  configApps () {

    echo "📈  CPU usage shows in Activity Monitor Dock icon"
    defaults write com.apple.ActivityMonitor IconType -int 5

    # Transmission
    echo "🚚  Transmission app initializing"
    # Don’t prompt for confirmation before downloading
    defaults write org.m0k.transmission DownloadAsk -bool false
    defaults write org.m0k.transmission MagnetOpenAsk -bool false
    # Hide the donate message
    defaults write org.m0k.transmission WarningDonate -bool false
    # Hide the legal disclaimer
    defaults write org.m0k.transmission WarningLegal -bool false

    echo "✉️ Mail"
    echo "   📤 Send with ⌘ + Enter"
    defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\U21a9"
    # echo "Display emails in threads" # oldest at top
    # defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
    # defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortedDescending" -string "yes"
    # defaults write com.apple.mail DraftsViewerAttributes -dict-add "SortOrder" -string "received-date"
  }


  # turn on tab completion for brew
  brewTab() {
    ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh"\
    /usr/local/share/zsh/site-functions
  }
fi
# end OSX customizations


# Git: Make rsa key & copy to clipboard
make_rsa(){
  GIT_EMAIL=$(git config --global user.email)
  echo "\nJust push enter on these\n"
  # todo: Config email if doesn't exist
  # todo: return to original directory when done
  # cd ~/.ssh/
  ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL"

  # copy clipboard
  pbcopy < ~/.ssh/id_rsa.pub  # only works if you use default rsa
  echo "Copied key to clipboard."
  echo "Opening browser"
  open https://github.com/settings/ssh

}
