alias py=python3

# virtualenv / virtualenvwrapper
mkvenv() { mkvirtualenv --python=/usr/local/bin/python3 $* }
rmvenv() { rmvirtualenv $* }
cdvenv() { cdvirtualenv $* }
lsvenv() { lsvirtualenv $* }
showvenv() { showvirtualenv $* }


export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
