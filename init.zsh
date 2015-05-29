# Git: Make rsa key & copy to clipboard
make_rsa(){
  GIT_EMAIL=$(git config --global user.email)
  echo "\nYou can just push enter on these\n"
  # todo: Config email if doesn't exist
  # todo: cd to ~/.ssh/
  ssh-keygen -t rsa -b 4096 -C "$GIT_EMAIL"

  # copy clipboard
  pbcopy < ~/.ssh/id_rsa.pub
  echo "Copied key to clipboard."
  echo "Opening browser"
  open https://github.com/settings/ssh

}

# OSX customizations
# --------------------------------------
if [[ $(uname) == "Darwin" ]]; then
  # Move the apps you never use to /Applications/Utilities
  # ex: TextEdit || TextEdit.app || /Applications/TextEdit.app
  buryApp() {
    for x in $@; do
      app=$(basename "$x")
      # extension="${app##*.}"
      app="${app%.*}"
      # echo " Utilities/$app"

      sudo mv /Applications/$app.app /Applications/Utilities/$app.app
    done

  }

  buryApps() {
    $(buryApp Automator Chess \ Dashboard DVD\ Player Font\ Book Game\ Center \
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
