nr() {
	npm run ${1:-dev}
}

+s() {
	appdir="${1:-sv$(randomword) }"
    git clone https://github.com/sveltejs/kit "$appdir"
    cd $appdir
    pnpm i
    pnpm -r build
}
