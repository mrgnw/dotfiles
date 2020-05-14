# mzsh

Dotifles that use [zplugin](https://github.com/zdharma/zplugin) for a really fast shell.

### [_install](init/_install)
mac
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/mrgnw/mzsh/master/init/_install)"
```
linux
```
wget -O - https://raw.githubusercontent.com/mrgnw/mzsh/master/init/_install | bash
```

Or do it manually:

1. [Install zplugin](https://github.com/zdharma/zplugin#installation)

2. Clone or [degit](https://github.com/Rich-Harris/degit) this project to ~/.zsh
    ```sh
    git clone https://github.com/mrgnw/mzsh ~/.zsh
    ```
    ```sh
    degit https://github.com/mrgnw/mzsh ~/.zsh
    ```

3. Copy [zshrc_template](init/zshrc_template) into ~/.zshrc:

### [init/](init) setup scripts folder

After the above setup, you can open a new tab and type `mzsh` to run all of the `.sh` scripts in the `init/` folder. These install apps, etc.

#### Why a separate folder?

These only need to happen once per computer setup, they don't need to be sourced every time you open a new shell.
