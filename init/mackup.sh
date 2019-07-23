# sync app settings & configs with mackup
# https://github.com/lra/mackup
brew install mackup

cp ~/.oh-my-zsh/custom/init/mackup.cfg ~/.mackup.cfg
# echo "[storage]" >> ~/.mackup.cfg
# echo "engine = icloud" >> ~/.mackup.cfg

echo "restore app configurations with:"
echo "\tmackup restore"