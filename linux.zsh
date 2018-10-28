# BASH script, not yet converted to ZSH

if [[ $(uname) == "Linux" ]]; then
	echo "Setting $(uname) aliases & functions"

	# alias rm="trash-rm"

	# Linux Gnome workspace mgmt >> False = Multiple spaces in 2nd display
	alias lock-spaces="gsettings set org.gnome.shell.overrides workspaces-only-on-primary"

	function show-installs {
		( zcat $( ls -tr /var/log/apt/history.log*.gz ) ; \
		cat /var/log/apt/history.log ) | egrep '^(Start-Date:|Commandline:)' \
		| grep -v aptdaemon | egrep '^Commandline:'
	}

	# Switch back to us keyboard from DVORAK
	function aoeu {
		#o.yqtxmal go <-- US keys on Dvorak layout
		 setxkbmap us # = US
	}

	function dvorak {
		setxkbmap dvorak
	}

fi # end if $(uname) is Linux
