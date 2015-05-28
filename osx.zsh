#!/bin/zsh

# BASH script, not yet converted to ZSH

if [[ $(uname) == "Darwin" ]]; then
  alias f='open .'

  trash () { command mv "$@" ~/.Trash ; }

  alias editHosts='sudo edit /etc/hosts'

  alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE; killall Finder'
  alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE; killall Finder'

  # ICLOUD_DRIVE="/Users/mw/Library/Mobile\ Documents/com\~apple\~CloudDocs"
  alias cdiCloud="cd /Users/mw/Library/Mobile\ Documents/com\~apple\~CloudDocs"




fi
