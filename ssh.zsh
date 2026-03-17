sshake(){
    ls $HOME/.ssh/id_rsa || ssh-keygen;
    ssh-copy-id $@;
}

# user micro editor when session is ssh
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE=remote/ssh
  EDITOR=micro
  SHELL_SYMBOL="%F{#05ffa1}✦%f"
else
  case $(ps -o comm= -p "$PPID") in
    sshd|*/sshd) SESSION_TYPE=remote/ssh; SHELL_SYMBOL="%F{#05ffa1}✦%f";;
  esac
fi

# https://unix.stackexchange.com/a/9607/77873
