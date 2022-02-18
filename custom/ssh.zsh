sshake(){
    ls $HOME/.ssh/id_rsa || ssh-keygen -t rsa;
    ssh-copy-id $@;
}
sshtail() { ssh -t $1 "less +F $2" }

# if current session is ssh client
# https://unix.stackexchange.com/a/9607/77873
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  # add these customizations
  SESSION_TYPE=remote/ssh
  # echo "ahoy! $SESSION_TYPE"
  EDITOR=micro
else
  case $(ps -o comm= -p "$PPID") in
    sshd|*/sshd) SESSION_TYPE=remote/ssh;;
  esac
fi

