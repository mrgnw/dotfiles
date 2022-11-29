export Z="$HOME/.zsh"
export CONFIG="$HOME/.config"

LANG="en_US.utf8"

# Theme
zinit ice pick"async.zsh" src"pure.zsh";
zinit light sindresorhus/pure;

# mrgnw/dotfiles
for f in $Z/**/*.zsh; do
    source "$f"
done

# Language & framework variables
export GOPATH="$HOME/.golang"
export BUN_INSTALL="$HOME/.bun"
export PY_BASE="$(python3.11 -m site --user-base)"

# completions
[ -s "$BUN_INSTALL/_bun" ] && source "$BUN_INSTALL/_bun"

