clrd() {
    local chat_name="${1:-$(basename "$PWD")»$(git branch --show-current 2>/dev/null || echo "no-git")}"
    claude --remote-control --dangerously-skip-permissions --chat "$chat_name"
}
