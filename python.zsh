# zplugin ice pick"zsh-pyenv-lazy-load"
# zplugin snippet \
#   https://raw.githubusercontent.com/erikced/zsh-pyenv-lazy-load/master/zsh-pyenv-lazy-load.zsh
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"


jupy(){'jupyter notebook'}
pi(){'pip install'}
pu(){'pip uninstall'}
pf(){'pip freeze'}

# allows pip install x[y]
setopt +o nomatch

py(){
  if [ "$#" -eq  "0" ]
    then python
  else
    python -m $@
  fi
}

+py() {
  mkdir $1;
  cd $1;
  +v & (curl https://www.gitignore.io/api/python > .gitignore)
}

-v() {
  pyenv uninstall ${1:-${PWD##*/}}
}
