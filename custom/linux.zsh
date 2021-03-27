function is_linux() { [[ "$OSTYPE" = "linux"* ]] || return 1 }
is_linux || return 1

open() { xdg-open ${1:-.} }
alias o='open .'

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# lazy load
nvm(){
    export NVM_DIR="$HOME/.nvm"
    [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
    [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
    nvm
}
