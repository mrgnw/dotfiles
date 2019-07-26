# 276
py2(){'python2'}
py3(){'python3'}
jupy(){'jupyter notebook'}
pi(){'pip install'}
pu(){'pip uninstall'}
pf(){'pip freeze'}

# 279
# alias activate='v'
# alias deactivate='pyenv deactivate'

setopt +o nomatch

# lazy load pyenv
# pyenv() {
#   eval "$(command pyenv init -)"
#   pyenv "$@"
# }


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

# allows things like `pip install vibora[fast]`


# 304
# requires virtualenvwrapper
# v() {
#   local VENVNAME=${1:-${PWD##*/}}  #$1 or current dir name
#   if [ ! -d ~/.pyenv/versions/$VENVNAME ]; then
#     +v
#   else
#     pyenv activate $VENVNAME
#   fi
# }

-v() {
  pyenv uninstall ${1:-${PWD##*/}}
}

# alias venvs='cd ~/.virtualenvs'
