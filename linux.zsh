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

	# Random Word Generator
	# TODO: Automatically remove 's
	# TODO: Add \t in front of each displayed word
	function random-word {
		# linuxconfig.org
		ALL_NON_RANDOM_WORDS=/usr/share/dict/words

		# if [ $file != "init" ] && [[ $file != *.* ]];
		if [ $# -eq 0 ]; then
			random-word 1
		elif [[ $1 =~ ^-?[0-9]+$ ]]; then
			# Constants
			X=0

			# total number of non-random words available
			non_random_words=`cat $ALL_NON_RANDOM_WORDS | wc -l`

			# while loop to generate random words
			# number of random generated words depends on supplied argument
			while [ "$X" -lt "$1" ]
			do
			random_number=`od -N3 -An -i /dev/urandom |
			awk -v f=0 -v r="$non_random_words" '{printf "%i\n", f + r * $1 / 16777216}'`
			sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS
			  let "X = X + 1"
			done
		else
			filtered_wordlist=`cat $ALL_NON_RANDOM_WORDS | grep $1`
			echo
			echo `cat $ALL_NON_RANDOM_WORDS | grep $1`
			echo
			# pick a random result
			# X=0
			#bob_words=`cat $ALL_NON_RANDOM_WORDS | wc -l`

			# while [ "$X" -lt "$1" ]
			# do
			# random_number=`od -N3 -An -i /dev/urandom |
			# awk -v f=0 -v r="$bob_words" '{printf "%i\n", f + r * $1 / 16777216}'`
			# sed `echo $random_number`"q;d" $ALL_NON_RANDOM_WORDS
			#   let "X = X + 1"
			# done

		fi
	}

	function random-words {
		if [ $# -eq 0 ]; then
			random-word 5
		elif [[ $1 =~ ^-?[0-9]+$ ]]; then
			random-word $1
		else
			random-word $1
		fi
	}

fi # end if $(uname) is Linux
