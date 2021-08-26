»s() { pnpm run ${1:-dev} }

# create project
+s() {
	appdir="${1:-sv$(word)}"
    pnpm init svelte@next "$appdir"
    cd $appdir
    git init && git add -A && git commit -m "🚀 init $appdir"
    pnpm i
    pnpm install @sveltejs/adapter-static@next --save-dev
    pnpm build
}
