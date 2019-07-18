init() {
	# todo: option to not do subfolders
	for f in ~/.oh-my-zsh/custom/init/**; do
		source $f
	done
 }
