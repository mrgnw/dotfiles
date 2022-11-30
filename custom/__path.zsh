# Add to PATH here without syncing to repository
PATH_DIRS=(
    "$HOME/.binaries"
    "$GOPATH/bin"
    "$BUN_INSTALL/bin"
    "$PY_BASE/bin"
)
PATH="$PATH:${(j.:.)PATH_DIRS}"
