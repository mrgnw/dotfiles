nr() {
	npm run ${1:-dev}
}

+s() {
	appdir="${1:-sv$(randomword) }"
	npx create-snowpack-app $appdir --template @snowpack/app-template-svelte --use-yarn
	cd $appdir
	yarn add svelte mdsvex
	yarn add snowpack-plugin-mdsvex -D
}
