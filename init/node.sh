# brew uninstall node

# download nvm github.com/nvm-sh/nvm
curl -o ~/.oh-my-zsh/custom/lazy/nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/master/nvm.sh
# setup nvm?
nvm install node
nvm use node
npm install --global pnpm

NPMS=(
    degit
    now
    spoof
    surge
    speed-test
)
pnpm install --global $NPMS