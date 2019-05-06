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


function mv {
	# from https://twitter.com/captainsafia/status/1062151829067325441
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git mv "$@"
    else
        mv "$@"
    fi
}

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


extract_untracked(){
  rsync -R `git ls-files --others` "$1"
  git clean -f
}
