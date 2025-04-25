alias ts='tailscale'
# check if tailscale is not in PATH
if ! command -v tailscale &>/dev/null; then
    alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
fi

y() {
	if [ $# -eq 0 ]; then
		yt-dlp "$(pbpaste)"
	else
		yt-dlp "$@"
	fi
}
yb(){
    y --cookies-from-browser firefox "$@"
}

dl(){
    # - dl {clipboard}
    # - dl {url}
    # - dl {clipboard}
    # - dl {url}
    # - dl {urls_in_file} to pwd
    # - dl {urls_in_file} to {dir}
    # - dl {url} to {output_file}
    # dl (everything passes through to aria2c)
    opts="--log-level=warn --download-result=full"
    if [[ $# -eq 0 ]]; then aria2c ${=opts} "$(pbpaste)"
    elif [[ $# -eq 1 ]] && [[ -f "$1" ]]; then aria2c ${=opts} -i "$1";
    elif [[ -f "$1" ]] && [[ -d "$2" ]]; then aria2c ${=opts} -i "$1" -d "$2" "$@";
    elif [[ $# -eq 2 ]]; then aria2c ${=opts} "$1" -o "$2";
    else aria2c ${=opts} "${=@}";
    fi
}
+bin(){
    # tries to download a binary, unzip if necessary, and move to ~/.binaries when done
     (
        +d $HOME/.installs/;
        src=${1:-$(pbpaste)};

        local filename=${src##*/};  # src after last slash
        local name="${2:-${filename%%[._-]*}}" # $2 or chars before first [._-] of filename
        echo $name
        dl "$src";
        
        # unpack if it's a zip or tar.gz
        if [[ $filename == *.zip ]]; then unzip -o $filename
        elif [[ $filename == *.tar.gz ]]; then tar -xvf $filename
        fi
        
        chmod +x $name
        mv $name $HOME/.binaries/$name
        )
}

gp() {
	local hosts=(
		"1.1.1.1"
		"cloudflare.com"
		"8.8.8.8"
		"google.com"
	)
	gping -s ${@:-${hosts[@]}}
}

# simple ping
sp() {
  ping ${@:-"1.1.1.1"} | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";
};

# ports
port(){ lsof -ti:$1 }
killport(){ lsof -ti:$1 | xargs kill }
pforward(){
    FWD_FROM_HOST=$1
    FWD_FROM_PORT=$2
    FWD_TO_PORT=${3:-$2}
    ssh -L $FWD_TO_PORT:$FWD_FROM_HOST:$FWD_FROM_PORT -N 127.0.0.1
}

ip() {
    # copy just the ip address, output ip, city, country
    curl -sS ipinfo.io | tee >(jq -r '.ip' | pbcopy) | jq '{ip:.ip, city:.city, country:.country}'
}

alias ttl='sudo sysctl net.inet.ip.ttl=65'
alias flushdns='dscacheutil -flushcache'

rcp(){ 
    rclone copy "$1" "$2" --progress --transfers=${3:-12} --multi-thread-streams 0 "${@:4}"
    }
ybr(){ yt-dlp --cookies-from-browser ${1:-safari} "$(pbpaste)" }
