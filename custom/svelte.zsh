
nr() {
	npm run ${1:-dev}
}

+s(){
	npx create-snowpack-app $1 --template @snowpack/app-template-svelte
	cd $1
    npm install svelte mdsvex --save
}
