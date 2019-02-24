# Convert to h264 without changing resolution.

# ffmpeg -i "Never say no to Panda-15396293.mp4" -c:v copy -c:a copy output.mp4 -y 2>&1 >/dev/null | grep -E -o '(from .*)|((frame=).*)'

x265(){
  ffmpeg -i $1 -c:v libx265 -c:a copy -crf 25 -maxrate 25M -tag:v hvc1 "${1%.*}"_h264.mp4
      
  # # tag hvc1 makes it work with quicklook on Mac

  # "${your_variable%.*}" is parameter expansion
  # https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
}



# 2>&1 >/dev/null | grep 'video'   
# filter output


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
