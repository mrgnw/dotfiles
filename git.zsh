# Straight copy-paste of my old git bash scripts

# ssh
# todo: function to create rsa & copy to clipboard
export SSH_KEY_PATH="~/.ssh/id_rsa"

# git: set global gitignore to the one I have in my zsh custom folder
alias setglobalgitignore='git config --global core.excludesfile ~/.oh-my-zsh/custom/.gitignore_global'

# See pre-set git
# https://github.com/robbyrussell/oh-my-zsh/wiki/Cheatsheet#git
  # gl = git pull
  #
alias gall='git add --all'
alias gp='git pull'
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

# make_rsa is in init.zsh
rsa(){
  if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
   make_rsa
 else
   pbcopy < ~/.ssh/id_rsa.pub
  fi
  echo "rsa copied"
}

