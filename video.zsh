#!/bin/zsh
# Convert to h265 without changing resolution.

x265(){
  local filename=$1:t:r
  ffmpeg -i $1 -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "$filename"_x265.mp4
      
  # # tag hvc1 makes it work with quicklook on Mac

  # "${your_variable%.*}" is parameter expansion
  # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
}


xmov(){
  local filename=$1:t:r
  ffmpeg -i $1 -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "$2/$filename"_x265.mp4
}

# 2>&1 >/dev/null | grep 'video'   
# filter output

xmov-dir(){
  # ignore mp4's 
  setopt extended_glob
  for vid in *.m*;
  xmov "$vid" "$1";

  # extended_glob
  # http://zsh.sourceforge.net/Doc/Release/Options.html#index-EXTENDED_005fGLOB
}


x265-dir(){
  # ignore mp4's 
  setopt extended_glob
  for vid in *.m*;
  x265 "$vid";

  # extended_glob
  # http://zsh.sourceforge.net/Doc/Release/Options.html#index-EXTENDED_005fGLOB
}


taghvc(){
  ffmpeg -i $1 -c:v copy -c:a copy -tag:v hvc1 "${1%.*}"-ql.mp4
}


taghvc-dir(){
  setopt extended_glob
  for vid in *.*;
  taghvc "$vid";
}
