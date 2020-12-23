# shortcuts determine whether to run on one file or directory
ym4(){
  youtube-dl https://www.youtube.com/watch?v=8B340ZkHU4Y $@
}
xv(){
  case $# in
    0) x265-dir;;
    # `xmv $1` transcodes all in dir to $1
    1) x265 "$1";;
    2) xmov "$1" "$2";;
  esac
}

xmv(){
  case $# in
    1) xmov-dir "$1";;
    2) xmov "$1" "$2";;
  esac
}

hvc(){
    case $# in
    0) tagvc-dir;;
    1) taghvc "$1";;
  esac
}

# perform on individual file
x265(){
  local filename=$1:t:r

  if ffmpeg -i "$1" -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "$filename"_x265.mp4; then
    trash "$1"
  else
    trash "$filename"_x265.mp4
  fi
}

xmov(){
  local filename=$1:t:r
  if ffmpeg -i "$1" -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "$2/$filename"_x265.mp4; then
    trash "$1"
  else
    trash "$2/$filename"_x265.mp4
  fi
}

# loop through directory
x265-dir(){
  # ignore mp4's
  setopt extended_glob
  for vid in **/*.(avi|mkv|wmv);
  hevc "$vid";
}
unblack(){
	for vid in **/*.(avi|mkv|wmv);
	ffmpeg -i "$vid"  -bsf:v mpeg4_unpack_bframes -vcodec copy "$vid"_unpack.mp4;
}

xmov-dir(){
  # ignore mp4's
  local dest=$1
  setopt extended_glob
  for vid in **/*.(avi|mkv|wmv);
  xmov "$vid" $dest;
}

# make videos quicklook-compatible
taghvc(){
  local filename=$1:t:r
  ffmpeg -i $1 -c:v copy -c:a copy -tag:v hvc1 "$filename"_ql.mp4
}

taghvc-dir(){
  setopt extended_glob
  for vid in *.*;
  taghvc "$vid";
}