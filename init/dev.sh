brew install asdf

+asdf() {
  asdf plugin-add $1
  asdf install $1 ${2:-latest}
  asdf global $1 ${2:-latest}
}
+asdfs() { for i in "$@"; do +asdf "$i"; done }

asdf plugin list all

runtimes=(
	python
	nodejs
	pnpm
	golang
	redis
)
+asdfs $runtimes

clis=(
	dust
	duf
	gojq
	httpie-go
	ripgrep
	trdsql  # query csv, json, etc — w/ PostgreSQL syntax
)
+asdfs $clis

# swift
# v
# rust
# ruby

# 1password-cli
# exa
# redis-cli
# usql
# zoxide
# postgres

