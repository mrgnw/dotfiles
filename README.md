# mzsh
My zsh customizations - aliases, functions, and themes.

## config
I use [ohmyzsh](http://ohmyz.sh), so `~/.zshrc` has only two lines:

    export ZSH=/Users/mw/.oh-my-zsh
    source $ZSH/oh-my-zsh.sh

Everything else is contained in .zsh files in `~/.oh-my-zsh/custom/` (this repository).

I believe separate files make it easier to navigate, even if the files are extremely short. My

## Installing / reinstalling
This will remove the `custom` directory and replace it with this repo, so make sure it doesn't contain anything you don't want to lose. The default example files are also included in this repository, so it won't break the git repo for oh-my-zsh.

     cd ~/.oh-my-zsh
     rm -rf custom
     git clone git@github.com:mrgnw/mzsh.git custom
