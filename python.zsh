# prevent .pyc files and __pycache__
export PYTHONDONTWRITEBYTECODE=1

alias py='python'
alias py2='python2'
alias py3='python3'
alias jupy='jupyter notebook'

mkv3() {
  mkvirtualenv --python=$(which python3) $1
}

# Create & activate in the project base folder
# env works off current directory
# Which means project folder names need to be unique

create_env() {
  virtualenv -p python ~/.virtualenvs/${PWD##*/}
}
activate_env() {
  local VENVNAME=${1:-${PWD##*/}}

  source ~/.virtualenvs/${VENVNAME}/bin/activate
}
rmenv() { rm -rf ~/.virtualenvs/${PWD##*/} }
alias venvs='cd ~/.virtualenvs'

mkenv() {
  mcd $1;
  curl https://www.gitignore.io/api/python > .gitignore
  venv;
}

venv() {
  local VENVNAME=${1:-${PWD##*/}}  #$1 or current dir name
  if [ ! -d ~/.virtualenvs/$VENVNAME ]; then
    echo "Creating $VENVNAME"
    create_env
  fi

  activate_env;

}

pip_show_all() {
  for i in "$@"
  do
    local info=$(pip show ${i} | sed -n 3p)
    echo $i $info
  done
}

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
