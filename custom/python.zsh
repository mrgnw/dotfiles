# zinit ice OMZ::davidparsson/zsh-pyenv-lazy silent wait"0b"
# zinit load davidparsson/zsh-pyenv-lazy
alias python=python3.11

p+() {pip install "$@"}
p-() {pip uninstall "$@"}

alias jupy='jupyter notebook'

# activate env
»py() {
    # activate .venv or create venv
    if [[ -d .venv ]];
    then source .venv/bin/activate
    else
        python3.11 -m venv .venv
        source .venv/bin/activate
    fi
}
«(){ deactivate }
-v() { trash .venv}

# allows pip install x[y]
set +o nomatch