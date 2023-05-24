yb(){
	local url="$1"
	shift 1
  yt-dlp --cookies-from-browser firefox "$url" "$@"
}

hevc(){
    local filename=$1:t:r
    ffmpeg -i $1 -c:v hevc_videotoolbox -b:v 2M $filename.mp4
    # ffmpeg -i input.mp4 -c:v h264_videotoolbox -b:v 2M -hwaccel videotoolbox output.mp4
}

atv(){                                                                 
    # Apple 1080p60 4K HEVC Surround.
    # also make sure it works with quicklook
    # $2 accepts quality - 1080p60, 1080p30, 720p60, 720p30, 480p30, 360p30, 240p30, 144p30
    local quality=${2:-"1080p30"}

    fname=$1:t:r
    input=$1
    local output_dir=$HANDBRAKE_OUTPUT_DIR
    # if HANDBRAKE_OUTPUT_DIR is not set, use current directory
    if [[ -z $HANDBRAKE_OUTPUT_DIR ]]; then
        output_dir=$(pwd)
    fi
    echo output_dir "$output_dir"

    handbrake --input "$input" -o "$output_dir/$fname-$quality.mp4" \
        --preset "Apple $quality Surround" \
        --all-subtitles --all-audio --optimize \
        && trash "$input";
    # ensure format will play in macos quicklook using handbrake
    # ffmpeg -i input.mp4 -c:v h264_videotoolbox -b:v 2M -hwaccel videotoolbox output.mp4
    # ffmpeg -i "${1%.*}.mp4" -c copy -movflags faststart "${1%.*}.mp4"
}
 
 atvs(){
    # apply profile 'Apple 1080p60 HEVC Surround' to all files in current directory
    local quality=${2:-"1080p30"}
    for f in *; 
        # ignore if $f is a directory
        # fi
        # get file extension
        # local ext=${f##*.}
        # before applying profile, check if file is already Apple-optimized
        if [[ $(mediainfo --Inform="Video;%Format%" "$f") != "HEVC" ]]; then
            if [[ -d $f ]]; then  
                echo "it's a directory"
            else
                atv "$f" "$quality"
            fi
        else
            echo " - $f is already optimized"
            atv "$f" "$quality"
        fi
 }
