# pipenv


# NVM
zplugin ice silent wait'!0'; zplugin light "lukechilds/zsh-nvm"
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

# RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then
  source "$HOME/.rvm/scripts/rvm"

  if [[ "$(type rvm | head -n 1)" == "rvm is a shell function" ]]; then
    # Add RVM to PATH for scripting
    case ":$PATH:" in
      *":$HOME/.rvm/bin:"*)
        ;;
      *)
        export PATH="$PATH:$HOME/.rvm/bin"
    esac
    export rvmsudo_secure_path=1

    # Use right RVM gemset when using tmux
    if [ -n "$TMUX" ]; then
      rvm use default
      pushd -q ..
      popd -q
    fi
  fi
fi