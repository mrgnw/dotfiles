
# ffmpeg -i  -ss 00:03 ~/Downloads/x2.mp4

clip() {
	if [ "$4" != "" ] 
	then local LENGTH=$4
	else local LENGTH="30"
	fi

	ffmpeg -i $1 -ss $2 -t $LENGTH ~/Downloads/export\ $3.mp4 

	
}

# ffmpeg snippets for grabbing clipcs

# command string


# default: 

# pull time segment
	# broad: -10s, + 25s
	# precies

# export mp4 snippet


# 111.
# 32:32+11 (31:40)
# 51:57
# 53:45 you know what? I dodged a pretty big bullet today.

# knight in white satin armor
# 13:10 Any faith I had went out the window that day
# 20:15 it's a ritual. It's for the _ that's all

# 213 12?
# ?33: this is too fucked up for me
# 38:55 why don't you stick to what you know and leave your opinions wherever the fuck


# 213
# 2:28 don't listen to the manipulation you got your own life


# 303 4:40

# second opinion
# 39:39 fuck the orange juice
# 51

# 38:40 I've given my life to this thing - and this is the thanks I get??

# hh:mm:ss
# mm:ss
# mm:
# :ss


# hh:mm:ss

# don't