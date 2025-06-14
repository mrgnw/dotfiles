# Quick zellij session management for mobile/remote use

# Main function - attach or create session
zj() {
    if [ "$#" -eq 0 ]; then
        zellij list-sessions 2>/dev/null || echo "No sessions"
    else
        zellij attach "$1" 2>/dev/null || zellij --session "$1"
    fi
}

# Resume or create session based on client
zr() {
    local zr_session_name="main"
    if [ -n "$SSH_CLIENT" ]; then
        # Use SSH_CONNECTION or fallback to simplified client IP
        if [ -n "$SSH_TTY" ]; then
            zr_session_name="ssh_$(who am i | awk '{print $NF}' | tr -d '()')"
        else
            zr_session_name="ssh_$(echo "$SSH_CLIENT" | awk '{print $1}' | tr '.' '_')"
        fi
    fi
    zellij attach "$zr_session_name" 2>/dev/null || zellij --session "$zr_session_name"
}

# Quick access to common sessions
zm() { zj main }
zw() { zj work }
zd() { zj dev }

# Kill session
zk() {
    [ "$#" -eq 0 ] && { echo "Usage: zk <session>"; return 1; }
    zellij delete-session "$1"
}

# Create session with current folder name
zf() {
    zj "$(basename "$PWD")"
}

# List sessions with status
zl() {
    zellij list-sessions 2>/dev/null | nl -v0 -nln
}

# Kill all sessions
zka() {
    zellij list-sessions 2>/dev/null | awk '{print $1}' | xargs -I {} zellij delete-session {}
}

# Auto-resume on SSH (add to your .zshrc)
# if [[ -n "$SSH_CLIENT" && -z "$ZELLIJ" && $- == *i* ]]; then zr; fi