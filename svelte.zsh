»s() { pnpm run ${1:-dev} }

# create project
+s() {
	appname="${1:-sv$(word)}"
	bun create svelte@next "$appname"
	cd $appname
  svelte-add mdsvex
	bun install
	git init
	git add .
	git commit -m "🚀 init $appname"
}

# svelte-add to project
s+(){ svelte-add $@ }
