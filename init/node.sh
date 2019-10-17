#!/usr/bin/env zsh

# download nvm github.com/nvm-sh/nvm
curl -o ~/.oh-my-zsh/custom/lazy/nvm.sh https://raw.githubusercontent.com/nvm-sh/nvm/master/nvm.sh
# setup nvm?
nvm install node
nvm use node
npm install --global pnpm

NPMS=(
    degit
    now
    npx
    speed-test
    spoof
    surge
)
pnpm install --global $NPMS