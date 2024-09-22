»s() { bun run ${1:-dev} }
s+(){ svelte-add $@ }

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