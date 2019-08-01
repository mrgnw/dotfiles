# mzsh

1. [Install zplugin](https://github.com/zdharma/zplugin#installation)

2. Clone or [degit](https://github.com/Rich-Harris/degit) this project to ~/.zsh

  <details><summary>git clone</summary>
  <code>git clone https://github.com/mrgnw/mzsh ~/.zsh</code>
  </details>

	```degit https://github.com/mrgnw/mzsh ~/.zsh```

3. Add to ~/.zshrc:

```shell
source "$HOME/.zplugin/bin/zplugin.zsh"
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# theme
zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

export Z="$HOME/.zsh"
for f in $Z/*.zsh; do
    # $ZZ:t:r # filename
    zplugin ice silent wait"1"; zplugin snippet $f
done
```

### Example: prioritizing load order

The above loads all ~/.zsh/ scripts after a delay.

Below, we load `_*.zsh` files first,  then everything not in LARGE_SCRIPTS, then large scripts.

```
export Z="$HOME/.zsh"
# private local files first
for f in $Z/_*.zsh; do
    zplugin ice silent; zplugin snippet "$f"
done

LARGE_SCRIPTS=(envs video)
for f in $Z/*.zsh; do
    fname=$f:t:r
    
    # delays loading LARGE_SCRIPTS
    (( ${LARGE_SCRIPTS[(I)fname]} )) \
        && zplugin ice silent \
        || zplugin ice silent wait"2";
    zplugin snippet "$f"
     
    # zplugin ice silent wait"1"; zplugin snippet "$f"
done
```



### init.zsh

I'll likely move that to another location or even the [mdevinit](https://rebrand.ly/mdevinit) gist.