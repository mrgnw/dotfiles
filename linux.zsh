is_linux || return 1

export EDITOR='nano'

alias a+="sudo apt -y install "
alias a»="sudo apt -y upgrade "
alias a-="sudo apt -y remove "

# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'

distro() {
	source /etc/os-release && echo $PRETTY_NAME
	# head /etc/os-release -n 1
}

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
