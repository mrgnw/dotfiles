# zinit ice OMZ::davidparsson/zsh-pyenv-lazy silent wait"0b"
# zinit load davidparsson/zsh-pyenv-lazy

p+() {pip install "$@"}
p-() {pip uninstall "$@"}

pf(){
	ruff format --config ~/.config/ruff.toml "$@"	
}
alias jupy='jupyter notebook'

# activate env
»py() {
    # activate .venv or create venv
    if [[ -d .venv ]];
    then source .venv/bin/activate
    else
        python -m venv .venv
        source .venv/bin/activate
    fi
}
«(){ deactivate }
-v() { trash .venv}

# allows pip install x[y]
set +o nomatch