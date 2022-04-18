#!/usr/bin/env zsh

brew install node nvm

npm install --global pnpm

node_apps=(
	degit
	composerize
	npx
	speed-test
	spoof
)
pnpm install --global $node_apps
