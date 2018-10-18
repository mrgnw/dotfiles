alias py=python3
alias python=python3
alias pip=pip3

export PATH="$PATH:/Users/morgan.williams/Library/Python/3.7/bin"

alias jupy='jupyter notebook'

# virtualenv / virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
mkvenv() { mkvirtualenv --python=/usr/local/bin/python3 $* }
rmvenv() { rmvirtualenv $* }
cdvenv() { cdvirtualenv $* }
lsvenv() { lsvirtualenv $* }
showvenv() { showvirtualenv $* }



# condensed zen of python
zen(){
  echo "
  Beautiful > ugly
   Explicit > implicit
     Simple > complex
    Complex > complicated
       Flat > nested
     Sparse > dense"
}