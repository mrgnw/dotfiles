y() { youtube-dl $@ }
yy() { echo "${@}" | xargs -n 1 -P 6 -I '{}' zsh -c 'youtube-dl "{}"' }
y4(){ youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $@ }

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

xwmv(){
  local filename=$1:t:r
  ffmpeg -hwaccel videotoolbox -i $1 -c:v libx265 -crf 18 -c:a aac -q:a 100 $filename.mp4
}

wmvv(){
  for vid in */*.wmv;
  xwmv "$vid"
}

bitrate-sample(){
  ffprobe -i "$1" -select_streams v -show_entries packet=size:stream=duration -print_format compact=p=0:nk=1 \
    -read_intervals "01:23%+#999"
}

# perform on individual file
x265(){
  local filename=$1:t:r
  if ffmpeg -i "$1" -c:v libx265 -c:a copy -crf 20 -tag:v hvc1 "$filename"_x265.mp4; then
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

mux(){
  ffmpeg -i "$1" -c copy -c:s mov_text "$1".mp4
}

# loop through directory
x265-dir(){
  # ignore mp4's
  setopt extended_glob
  for vid in **/*.(avi|mkv|wmv);
  x265 "$vid";
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