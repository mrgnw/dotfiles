
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk
### End of Zinit's installer chunk


# github.com/mrgnw/dotfiles

zinit ice pick"async.zsh" src"pure.zsh"; zinit light sindresorhus/pure

export Z="$HOME/.zsh"
# private local files first
setopt null_glob  # (.N) returns '' if glob returns nothing
for f in $Z/_*(.N).zsh; do
    zinit ice lucid; zinit snippet "$f"
done

# load all *.zsh; delay loading LARGE_SCRIPTS
LARGE_SCRIPTS=(envs video)
for f in $Z/**/*.zsh; do
    fname=$f:t:r

    (( ${LARGE_SCRIPTS[(I)fname]} )) \
        && zinit ice lucid \
        || zinit ice lucid wait"0";
    zinit snippet "$f"

    # zinit ice silent wait"1"; zinit snippet "$f"
done
# end dotfiles zshrc
