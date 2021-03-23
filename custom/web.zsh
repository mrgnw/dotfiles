sping() {
  ping ${@:-"1.1.1.1"} | awk \
  '{ gsub("time=", "") ;\
   gsub("icmp_seq=","");\
   print $5"\t" $7 " " $8 }'\
   OFMT="%.0f";
};
alias sp='sping'

sshake(){
    ls $HOME/.ssh/id_rsa || ssh-keygen -t rsa;
    ssh-copy-id $@;
}

ksh() {(klist -s || kinit) && ssh $@}
kshtail() { ksh -t $1 "less +F $2" }
killport(){ lsof -ti:$1 | xargs kill }