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

