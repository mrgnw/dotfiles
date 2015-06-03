# Straight copy-paste of my old git bash scripts

# ssh
# todo: function to create rsa & copy to clipboard
export SSH_KEY_PATH="~/.ssh/id_rsa"

# See pre-set git
# https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#git
  # gl = git pull
  # 
alias gall='git add --all'
alias gs='git status'
alias gc='git commit -m'
alias gcd='git checkout develop'
alias gcnb='git checkout -b'
alias gits='git status'
alias gita='git add --all'
alias gitc='git commit -m'

# gitp ush
alias gitp='git push;'
alias ush=''

# for quick commits to personal projects
alias glazy="gita; gitc 'quick commit - minor changes';"

# find all .git directories and exec "git pull" on the parent.
# function gitrecursive {
#     find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;
# }
