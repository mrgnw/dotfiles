#!/bin/zsh
sv() {
	npm run ${1:-dev}
}

+sv() {
	degit sveltejs/template "$1"
	cd "$1"
	pnpm install code . -g src/App.svelte
	pnpm run dev
	open http://localhost:5000
}
