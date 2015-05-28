# Straight copy-paste of my old git bash scripts

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

alias g='git'
alias gd='git diff'
alias gs='git status'
alias ga='git add --all'
alias gc='git commit -m'
alias gits='git status'
alias gita='git add --all'
alias gitc='git commit -m'

alias gitlazy="gita; gitc 'quick commit - minor changes';"

function gitrecursive {
    # find all .git directories and exec "git pull" on the parent.
    find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;
}
