#!/usr/bin/env zsh

if [[ is_macos ]]; then
    brew install node
    npm install --global pnpm
fi
if [[ is_linux ]]; then
    sudo dnf install -y nodejs
    npm install --global pnpm
fi

node_apps=(
	degit
	nanoid
	nanoid-cli
	now
	npx
	speed-test
	spoof
)
pnpm install --global $node_apps
