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

alias gp='git pull'
alias gs='git status'
alias gc='git commit -m'
alias gcnb='git checkout -b'
alias gits='git status'
alias gita='git add --all'
alias gitc='git commit -m'
alias gitglobal='git config --global --edit'

yolo(){
  git add --all;
  git commit -m 'quick update';
  git push;
}

# gitp ush
alias gitp='git push;'
alias ush=''

# find all .git directories and exec "git pull" on the parent.
# function gitrecursive {
#     find . -type d -name .git -exec sh -c "cd \"{}\"/../ && pwd && git pull" \;
# }

rsa(){
  if [[ ! -a ~/.ssh/id_rsa.pub ]]; then
   ssh-keygen -t rsa -b 4096 -C morganfwilliams@gmail.com
 else
   pbcopy < ~/.ssh/id_rsa.pub
  fi
  echo "rsa copied"
}


extract_untracked(){
  rsync -R `git ls-files --others` "$1"
  git clean -f
}