zinit ice OMZ::davidparsson/zsh-pyenv-lazy silent wait"0b"
zinit load davidparsson/zsh-pyenv-lazy

jupy() {'jupyter notebook'}
pi() {'pip install'}
pu() {'pip uninstall'}
pf() {'pip freeze'}

# allows pip install x[y]
setopt +o nomatch

# find latest python3 version on pyenv
PYTHON3_VERSION() {
	pyenv install -l | grep -e '3.[0-9].[0-9]' | grep -v - | tail -1 | awk '{$1=$1};1'
}

py() {
	if [ "$#" -eq "0" ]; then
		python
	else
		python -m $@
	fi
}

# default installs for most projects
+pips(){
	pip install cython python-dotenv black
}

# create venv, set as directory default
+v() {
	pyenv virtualenv $(PYTHON3_VERSION) ${1:-${PWD##*/}}
	pyenv local ${1:-${PWD##*/}}
	+pips
}

# activate env
»() {
	local VENVNAME=${1:-${PWD##*/}} #$1 or current dir name
	if [ ! -d ~/.pyenv/versions/$VENVNAME ]; then
		+v
	else
		pyenv activate $VENVNAME
	fi
}

# new python env with gitignore & directory
+py() {
	# only mkdir + cd if specified
	if [ "$#" -ge 1 ]; then
		+d $1
	fi
	+v &
	(curl https://www.gitignore.io/api/python >.gitignore)
}

-v() {
	pyenv uninstall ${1:-${PWD##*/}}
}

# fastapi starter
+fast() {
	+py $1
	pip install fastapi uvicorn
}
