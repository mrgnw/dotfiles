ffp(){
	ffprobe -print_format json -show_format -show_streams -show_chapters -show_private_data "$@" | jq '.streams'
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
# mp4s() - simply converts all non mp4 files in cwd to mp4 using ffmpeg.
#  If the codec is already h264 or hevc, it just remuxes to mp4 container.
#  if not, it converts to h264
# also, don't overwrite existing mp4 files; skip if the mp4 already exists
mp4s(){
    emulate -L zsh -o extendedglob
    for f in (#i)*.(mp4|mov|mkv|avi|webm|m4v|flv|wmv|mpg|mpeg|ts|m2ts|3gp|vob)(.N); do
        # get file extension (case-insensitive check)
        local ext=${f##*.}
        local target_mp4="${f%.*}.mp4"
        # before applying profile, check if file is already mp4
        if [[ ${ext:l} != "mp4" ]]; then
            # skip if target mp4 already exists
            if [[ -e "$target_mp4" ]]; then
                echo " - $target_mp4 already exists, skipping $f"
            else
                # detect codec via ffprobe to decide remux vs transcode
                local vcodec
                vcodec=$(ffprobe -v error -select_streams v:0 -show_entries stream=codec_name -of default=nk=1:nw=1 "$f" 2>/dev/null)
                if [[ "$vcodec" == "h264" || "$vcodec" == "hevc" || "$vcodec" == "h265" ]]; then
                    echo " - $f is already h264 or hevc, remuxing to mp4"
                    ffmpeg -i "$f" -c copy -movflags faststart "$target_mp4" && trash "$f"
                else
                    echo " - converting $f to mp4"
                    ffmpeg -i "$f" -c:v libx264 -crf 23 -preset medium -c:a aac -b:a 192k -movflags +faststart "$target_mp4" && trash "$f"
                fi
            fi
        else
            echo " - $f is already mp4, skipping"
        fi
    done
 }

 
 atvs(){
    # apply profile 'Apple 1080p60 HEVC Surround' to all files in current directory
    local quality=${2:-"1080p30"}
    emulate -L zsh -o extendedglob
    for f in (#i)*.(mp4|mov|mkv|avi|webm|m4v|flv|wmv|mpg|mpeg|ts|m2ts|3gp|vob)(.N); do
        atv "$f" "$quality"
    done
 }

# muxs() - batch remux all matching video files to mp4
# - copies video stream, encodes audio to AAC
# - skips when target .mp4 already exists
# - case-insensitive extension match via zsh extended globs
muxs(){
    emulate -L zsh -o extendedglob
    for f in (#i)*.(mp4|mov|mkv|avi|webm|m4v|flv|wmv|mpg|mpeg|ts|m2ts|3gp|vob)(.N); do
        local base=${f%.*}
        local ext=${f##*.}
        # For mp4 inputs, add -compressed suffix; for others, convert to .mp4
        if [[ ${ext:l} == "mp4" ]]; then
            local out="${base}-compressed.mp4"
        else
            local out="${base}.mp4"
        fi
        echo " - converting $f -> $out"
        ffmpeg -y -i "$f" -movflags +faststart "$out" \
            && echo "   ✔ done"
    done
}
