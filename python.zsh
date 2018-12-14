# alias py=python3
# alias pip='noglob pip'
# alias pip3='noglob pip3'
alias jupy='jupyter notebook'

# Create & activate in the project base folder
# env works off current directory
# Which means project folder names need to be unique
mkenv() {
  mkcd $1;
  curl https://www.gitignore.io/api/python > .gitignore
  venv;
}

venv() { 
  local THISDIR=${PWD##*/}
  if [ ! -d ~/.virtualenvs/$THISDIR ]; then
    echo "Creating $THISDIR"
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


create_env() { virtualenv -p python ~/.virtualenvs/${PWD##*/} }
activate_env() { source ~/.virtualenvs/${PWD##*/}/bin/activate }
rmenv() { rm -rf ~/.virtualenvs/${PWD##*/} }


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