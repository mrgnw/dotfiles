
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

    handbrake -i "$1" -o "${1%.*}_$quality.mp4" --preset "Apple $quality Surround" --all-subtitles --all-audio
    # ensure format will play in macos quicklook using handbrake
    # ffmpeg -i input.mp4 -c:v h264_videotoolbox -b:v 2M -hwaccel videotoolbox output.mp4
    # ffmpeg -i "${1%.*}.mp4" -c copy -movflags faststart "${1%.*}.mp4"
}
 
 atvs(){
    # apply profile 'Apple 1080p60 HEVC Surround' to all files in current directory
    # local quality=${2:-"1080p30"}
    for f in *; 
        # before applying profile, check if file is already Apple-optimized
        if [[ $(mediainfo --Inform="Video;%Format%" "$f") != "HEVC" ]]; then
            atv "$f"
        else
            echo " - $f is already optimized"
        fi
 }


 ff(){
    # encode with hevc and move english audio track to first
    ffmpeg -i $1 -c:v hevc_videotoolbox -b:v 1M -c:a aac -b:a 128k -ac 2 -ar 44100 -movflags +faststart "${1%.*}.mp4"
    # swap audio tracks
    # ffmpeg -i $1.mp4 -map 0:0 -map 0:2 -map 0:1 -c copy $1.mp4
 }

 ffs(){
    # run ffmpeg on all files in current directory if they're not already hevc
    for f in *; do
        # before applying profile, check if file is already Apple-optimized
        local codec=$(mediainfo --Inform="Video;%Format%" "$f")
        if [[ $codec != "HEVC" ]]; then
            ff "$f"
        else
            # if extension is not mp4, convert to mp4
            echo " - $f is already optimized to $codec."
            if [[ $f != *.mp4 ]]; then
                echo "Moving to mp4" &&
                mv "$f" "${f%.*}.mp4"
            fi
        fi
        done
 }