»s() { pnpm run ${1:-dev} }

# create project
+s() {
	appname="${1:-sv$(word)}"
	gh repo create $appname \
	  --template https://github.com/mrgnw/shadcn-svelte-template \
	  --private --clone
	cd $appname
	bun install
	bun run dev
}

# svelte-add to project
s+(){ svelte-add $@ }
