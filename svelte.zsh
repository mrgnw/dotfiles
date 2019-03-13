#!/bin/zsh
# Base
alias sv='svelte'


# Dev

# The --format iife bit means 'generate an immediately-invoked function expression'
iife() {
	svelte compile --format iife $1.html > $1.js
}
# – this allows us to use the component as a simple <script> tag.
# (By default, Svelte will create a JavaScript module instead, which is 
# recommended for more serious applications but requires additional steps.)

+sv() {
	degit sveltejs/template $1
	cd $1
	npm install
	npm run dev
}


# Production