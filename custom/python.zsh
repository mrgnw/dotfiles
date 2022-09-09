# zinit ice OMZ::davidparsson/zsh-pyenv-lazy silent wait"0b"
# zinit load davidparsson/zsh-pyenv-lazy

alias jupy='jupyter notebook'
p+() {'pip install'}
pu() {'pip uninstall'}
pf() {'pip freeze'}
# alias python="python3"

# allows pip install x[y]
setopt +o nomatch

# find latest python3 version on pyenv
PYTHON3_VERSION() {
	pyenv install -l | grep -e '3.[0-9].[0-9]$' | grep -v - | tail -1 | awk '{$1=$1};1'
}

py() {
	if [ "$#" -eq "0" ];
    then python
	else python -m $@
	fi
}

# activate env
»(){ pyenv activate ${1:-} }
«(){ pyenv deactivate }
+v() { 
    (
        pdm init --non-interactive --skip pre_publish,post_publish & 
          curl https://www.gitignore.io/api/python >.gitignore
    ) && 
      pdm add --dev darker pytest "$@"
}
-v() { pyenv uninstall ${1:-${PWD##*/}} }

+py() {pdm add --dev darker pytest "$@"}

# fastapi starter
+fast() {
	+py $1
	pdm add fastapi uvicorn
}
