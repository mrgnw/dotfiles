clip() {
	if [ "$4" != "" ] 
	then local LENGTH=$4
	else local LENGTH="30"
	fi

	ffmpeg -i $1 -ss $2 -t $LENGTH ~/Downloads/export\ $3.mp4 	
}
