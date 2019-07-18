echo "📈  CPU usage shows in Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

# Many prefs taken from github.com/mathiasbynens/dotfiles/blob/master/.macos
# turn on tab completion for brew
ln -s "$(brew --prefix)/Library/Contributions/brew_zsh_completion.zsh" /usr/local/share/zsh/site-functions

echo "🌌 Screenshots"
echo "   📂 ~/Pictures/Screenshots "
mkdir ~/Pictures/Screenshots
screenshotDir ~/Pictures/Screenshots
echo "   🏷 Name =  {date & time}.png"
defaults write com.apple.screencapture name ; killall SystemUIServer

# Move apps that I rarely use into the Utilities folder
buryThese=(
    'Automator'
    'Chess'
    'DVD Player'
    'Font Book'
    'Image Capture'
    'Launchpad'
    'Mail'
    'Mission Control'
    'Photo Booth'
    'Stickies'
    'TextEdit'
    'Time Machine'
    )
echo "Burying rarely used apps to Utilities"
sudo buryApp ${buryThese[@]}

# Enable apps from everywhere - makes getting set up easier
openGate

finderDefaults
safariDefaults

git config --global core.excludesfile '~/.oh-my-zsh/custom/.gitignore_global'
ln -s ~/.oh-my-zsh/custom/.gitignore_global ~/.config/git/ignore

echo "App Store"
init_mas
echo "Homebrew"
init_brew
echo "Node"
init_node

configApps

# Disable smart quotes. Ain't nobody need those
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

echo "🎯 performance"
echo "  🚫 No hibernation = faster sleep"
sudo pmset -a hibernatemode 0

echo "📡  App store"
echo "  🔄 Auto-check for updates, daily"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
echo "  ⬇️ Auto-download updates"
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
# Turn on app auto-update
defaults write com.apple.commerce AutoUpdate -bool true

echo " SF Mono"
cp /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/*.otf ~/Library/Fonts/