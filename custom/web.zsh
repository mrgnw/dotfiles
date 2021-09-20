# simple ping
sp() {
  ping ${@:-"1.1.1.1"} | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";
};

# ssh
ksh() {(klist -s || kinit) && ssh $@}
sshake(){
    ls $HOME/.ssh/id_rsa || ssh-keygen -t rsa;
    ssh-copy-id $@;
}
kshtail() { ksh -t $1 "less +F $2" }

# ports
port(){lsof -ti:$1}
killport(){ lsof -ti:$1 | xargs kill }
pforward(){
    FWD_FROM_HOST=$1
    FWD_FROM_PORT=$2
    FWD_TO_PORT=${3:-$2}
    ssh -L $FWD_TO_PORT:$FWD_FROM_HOST:$FWD_FROM_PORT -N 127.0.0.1
}

ip() {curl -sS ipinfo.io | jq '{ip:.ip, city:.city, country:.country}'}

alias ttl='sudo sysctl net.inet.ip.ttl=65'