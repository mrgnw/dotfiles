
agq-init() {
	npm init --yes
	npm install --save apollo-server graphql

	{
	  echo "const { ApolloServer, gql } = require('apollo-server');"
	} > index.js

	# Git init with node gitignore
	curl https://www.gitignore.io/api/node > .gitignore
	git init
	git add .
	git commit -m '🚀 Init Apollo-GraphQL!'

	open index.js # or `subl .` ?
}

+apollo() {
	mkdir $1
	cd $1
	agq-init
}


