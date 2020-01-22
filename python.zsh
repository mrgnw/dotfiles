zplugin ice OMZ::davidparsson/zsh-pyenv-lazy silent wait"0"
zplugin load davidparsson/zsh-pyenv-lazy

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

# create venv, set as directory default
+v() {
	pyenv virtualenv $PYTHON3_VERSION ${1:-${PWD##*/}}
	pyenv local ${1:-${PWD##*/}}
	# I basically always need cython
	pip install cython
}

v() {
	local VENVNAME=${1:-${PWD##*/}} #$1 or current dir name
	if [ ! -d ~/.pyenv/versions/$VENVNAME ]; then
		+v
	else
		pyenv activate $VENVNAME
	fi
}

+py() {
	# if no args:
	if [ "$#" -ge 1 ]; then
		mkdir $1
		cd $1
	fi
	+v &
	(curl https://www.gitignore.io/api/python >.gitignore)
}

-v() {
	pyenv uninstall ${1:-${PWD##*/}}
}