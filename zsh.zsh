#--------------------------
# zsh basic configuration
#--------------------------

autoload -U promptinit
promptinit

# Preferred editor for local and remote sessions
export EDITOR='nano'

# More themes in ~/.oh-my-zsh/themes/
# avit, pure, avit-pure, "random" does  a random theme
ZSH_THEME="avit-pure"


# Plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git osx cp colorize vagrant python pip virtualenv atom
  jsontools zsh-syntax-highlighting colored-man themes)

alias zshedit="atom ~/.oh-my-zsh/custom/"
alias zshdir="cd ~/.oh-my-zsh/custom/"
alias ohmyzsh="atom ~/.oh-my-zsh"

#--------------------------
# Additional configuration
#--------------------------
# heroku
export PATH="/usr/local/heroku/bin:/Users/mw/mbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Cross-platform (unix)
alias ~="cd ~"
alias ..="cd .."
alias ...='cd ../..'

alias myip='curl ip.appspot.com'
alias mygeo='curl http://www.telize.com/geoip'

# simple ping function
simpleping() {
  ping $1 | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";

  # improvements
 	# Set time unit (s, ms, "way too long")
 	# Down time is an incrementing time counter ("Down 5s" turns into "Down 6s")

};

sping() { simpleping $1 }


historyHelper() {
  history | awk '{CMD[$2]++;count++;}END\
   { for (a in CMD)\
   print CMD[a] " " CMD[a]/count*100 "% " a;\
   }' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n$1
}

# Shows top x commands. Defaults to 5
hist() {
  if [ $# -eq 0 ]; then
    historyHelper 5
  else
    historyHelper $1
  fi
}
