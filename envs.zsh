# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"  # automatically init

if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
            eval "$(command pyenv virtualenv-init -)"
        fi
        pyenv $@
    }
fi

# Only load in ~/dev?
zplugin ice wait'0' load'[[ $PWD != $HOME/dev/** ]]' unload'![[ $PWD = $HOME/dev/** ]]';
zplugin load "lukechilds/zsh-nvm"
# place this after nvm initialization!
autoload -U add-zsh-hook

# load-nvmrc() {
#   local node_version="$(nvm version)"
#   local nvmrc_path="$(nvm_find_nvmrc)"

#   if [ -n "$nvmrc_path" ]; then
#     local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

#     if [ "$nvmrc_node_version" = "N/A" ]; then
#       nvm install
#     elif [ "$nvmrc_node_version" != "$node_version" ]; then
#       nvm use
#     fi
#   elif [ "$node_version" != "$(nvm version default)" ]; then
#     echo "Reverting to nvm default version"
#     nvm use default
#   fi
# }
# add-zsh-hook chpwd load-nvmrc
# load-nvmrc



# rvm
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