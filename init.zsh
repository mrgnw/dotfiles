# Git: Make rsa key & copy to clipboard
make_rsa(){
  GIT_EMAIL=$(git config --global user.email)
  echo "\nYou can just push enter on these\n"
  # todo: Config email if doesn't exist
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
buryApp(){

  # sudo mv /Applications/Automator.app /Applications/Utilities/Automator.app
  for app in $@; do
    sudo mv /Applications/$app.app /Applications/Utilities/$app.app
  done

}

buryApps(){
  $(buryApp) Mail.app TextEdit.app
}

# turn on tab completion for brew
brewTab(){
  ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions
}
fi
