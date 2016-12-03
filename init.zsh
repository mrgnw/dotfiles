# download & run this file to install everything!


# OSX customizations
# --------------------------------------
if [[ $(uname) == "Darwin" ]]; then

  newMac() {
    # Set up screenshots
    mkdir ~/Pictures/Screenshots
    screendir ~/Pictures/Screenshots
    screenname 

    # enable select in QuickLook
    defaults write com.apple.finder QLEnableTextSelection TRUE

    # Move apps that I rarely use into the Utilities folder
    buryApps

    # Disable warning when emptying trash
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
  }


  # change screenshot directory
  screendir () {
    # todo: see if directory exists & create if it doesn't
    defaults write com.apple.screencapture location $@; killall SystemUIServer
  }


  screenname () {
    defaults write com.apple.screencapture name $1; killall SystemUIServer
  }
#

  # Move the apps you never use to /Applications/Utilities
  # ex: TextEdit || TextEdit.app || /Applications/TextEdit.app
  buryApp() {
    for x in $@; do
      app=$(basename "$x")
      app="${app%.*}"
      sudo mv /Applications/$app.app /Applications/Utilities/$app.app
    done
  }

  # Default apps to bury:
  # Automator, Chess, DVD Player, Font Book,  Image Capture, Launchpad, Mail,
  # Mission Control, Photo Booth, Stickies, TextEdit
  buryApps() {
    $(buryApp Automator Chess \ DVD\ Player Font\ Book \
    Image\ Capture Launchpad Mail Mission\ Control Photo\ Booth Stickies TextEdit \
     Time\ Machine)
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
