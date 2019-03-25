#!/bin/zsh
# Convert to h265 without changing resolution.

x265(){
  local filename=$1:t:r
  ffmpeg -i $1 -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "$filename"_x265.mp4
}


xmov(){
  local filename=$1:t:r
  ffmpeg -i $1 -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "$2/$filename"_x265.mp4
}

# 2>&1 >/dev/null | grep 'video'   
# filter output

xmov-dir(){
  setopt extended_glob
  # todo: select a filetype to target, default ignore mp4
  for vid in *.m*;
  xmov "$vid" "$1";
  # trash "$vid"

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
