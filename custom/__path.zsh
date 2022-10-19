# Add to PATH here without syncing to repository
PATH_DIRS=(
    "$HOME/.binaries"
)
PATH="$PATH:${(j.:.)PATH_DIRS}"
