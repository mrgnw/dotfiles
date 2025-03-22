export YT_OUTPUT_DIR=$ICLOUD/Downloads

# Prefer MP4 format with best quality
export YT_DLP_DEFAULT_OPTS="--format 'bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]/bv*+ba/b'"

# Download subtitles, embed them, and set language preferences
export YT_DLP_DEFAULT_OPTS="$YT_DLP_DEFAULT_OPTS --sub-langs 'en.*,-live_chat' --embed-subs"

# Additional useful defaults
export YT_DLP_DEFAULT_OPTS="$YT_DLP_DEFAULT_OPTS --embed-thumbnail --add-metadata"

