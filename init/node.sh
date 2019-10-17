#!/usr/bin/env zsh

brew install node
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