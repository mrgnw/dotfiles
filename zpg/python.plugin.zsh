alias py2='python2'
alias py3='python3'
alias jupy='jupyter notebook'
alias pi='pip install'
alias pu='pip uninstall'
alias pf='pip freeze'
alias w='workon'

alias activate='v'
alias deactivate='pyenv deactivate'

# lazy load pyenv
# pyenv() {
#   eval "$(command pyenv init -)"
#   pyenv "$@"
# }


py(){
  if [ "$#" -eq  "0" ]
    then python
  else
    python -m $@  # `py run` runs `run` or `run.py`
  fi
}

+py() {
  mkdir $1;
  cd $1;
  (curl https://www.gitignore.io/api/python > .gitignore) & +v
}

# allows things like `pip install vibora[fast]`
setopt +o nomatch

# requires virtualenvwrapper
v() {
  local VENVNAME=${1:-${PWD##*/}}  #$1 or current dir name
  if [ ! -d ~/.pyenv/versions/$VENVNAME ]; then
    +v
  else
    pyenv activate $VENVNAME
  fi
}

+v() {
  # pyenv virtualenv 3.7.3 ${1:-${PWD##*/}}
  case $# in
    0) pyenv virtualenv 3.7.4 ${PWD##*/};;
    1) pyenv virtualenv "$1" ${PWD##*/};;
    2) pyenv virtualenv "$1" "$2";;
  esac
}

-v() {
  pyenv uninstall ${1:-${PWD##*/}}
}

alias venvs='cd ~/.virtualenvs'

# zen of python
zen(){
  echo "
  Beautiful > ugly
   Explicit > implicit
     Simple > complex
    Complex > complicated
       Flat > nested
     Sparse > dense"
}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"  # automatically init
