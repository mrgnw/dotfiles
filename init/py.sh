#!/usr/bin/env zsh

# pipx
b+ pyenv pyenv-virtualenv
python3 -m pip install --user pipx
python3 -m pipx ensurepath
# xxenv-latest
git clone https://github.com/momo-lab/xxenv-latest.git "$(pyenv root)"/plugins/xxenv-latest
pip install --upgrade pip
