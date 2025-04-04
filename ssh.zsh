sshake(){
    ls $HOME/.ssh/id_rsa || ssh-keygen;
    ssh-copy-id $@;
}

# user micro editor when session is ssh
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

# https://unix.stackexchange.com/a/9607/77873
