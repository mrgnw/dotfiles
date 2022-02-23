export Z="$HOME/.zsh"
LANG="en_US.utf8"

source "$Z/zinit.zsh"

# Theme
zinit ice pick"async.zsh" src"pure.zsh";
zinit light sindresorhus/pure;

# mrgnw/dotfiles
for f in $Z/**/*.zsh; do
    source "$f"
done

