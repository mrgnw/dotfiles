»s() { bun run ${1:-dev} }
s+(){ svelte-add $@ }

# +project from template (shadcn-svelte)
+s() {
	local appname="${1:-sv$(word)}"
	local local_template="$HOME/.repos/shadcn-svelte-template"
	local repo_url="https://github.com/mrgnw/shadcn-svelte-template"

	if [ -d "${local_template}/.git" ]; then
		git -C "$local_template" pull
	else
		mkdir -p "$HOME/.repos"
		git clone --depth=1 "$repo_url" "$local_template"
	fi

	cp -R "${local_template}/." "$appname"
	chmod -R u+rw "$appname"
	
	cd "$appname" &&
		rm -rf .git &&
		bun install &&
		bun run dev	
}

+s0() {
	# + svelte project from scratch
	local appname="${1:-sv$(word)}"

	bunx sv create \
			--check-types typescript \
			--template minimal \
			--no-install "$appname" &&
	cd "$appname" &&
	bun install &&
	git init &&
	git add . &&
	git commit -m '+𝖘𝖛𝖑𝖙𝖊 New Svelte 5 project!' &&
	bun run dev
}

# create a remote repo directly from the template
s_repo() {
	appname="${1:-sv$(word)}"
	gh repo create $appname \
		--template https://github.com/mrgnw/shadcn-svelte-template \
		--private --clone
	cd $appname
	bun install
	bun run dev
}