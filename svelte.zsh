#!/bin/zsh
# Base

sv() {
	npm run ${1:-dev}
}

+sv() {
	degit sveltejs/template $1
	cd $1
	npm install
	npm run dev
}


# Production