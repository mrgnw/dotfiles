alias dl='http -d'

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

ip() {curl -sS ipinfo.io | jq '{ip:.ip, city:.city, country:.country}'}

alias ttl='sudo sysctl net.inet.ip.ttl=65'
alias flushdns='dscacheutil -flushcache'

is_macos || return 1
alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"

ybr(){ yt-dlp --cookies-from-browser ${1:-safari} "$(pbpaste)" }

rcp(){
    rclone copy "$1" "$2" --progress --transfers=${3:-12}
}