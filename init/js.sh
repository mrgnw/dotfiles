#!/usr/bin/env zsh

curl https://bun.sh/install | bash

js_apps=(
	degit
	composerize
	pnpm
	speed-test
	spoof
)
bun install --global $js_apps
