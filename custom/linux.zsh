function is_linux() { [[ "$OSTYPE" = "linux"* ]] || return 1 }
is_linux || return 1

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'