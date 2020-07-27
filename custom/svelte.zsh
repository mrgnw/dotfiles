nrd(){
	npm run dev
}

sv() {
	npm run ${1:-dev}
}

+sv() {
	degit sveltejs/template "$1"
	cd "$1"
	code . -g src/App.svelte
	pnpm install
	pnpm run dev
	open http://localhost:5000
}
