# download both at the same time
git clone https://github.com/mrgnw/mzsh ~/.zsh &
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"

if ! grep -q mzsh ~/.zshrc; then
    cat ~/.zsh/init/zshrc_template >> ~/.zshrc
else 
    echo "~/.zshrc already contains mzsh";
fi

echo "Once installed, open a new tab."