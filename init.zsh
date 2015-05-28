
# turn on tab completion for brew
brewTab(){
  ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions
}
