
export GOPATH="$HOME/go"
PATH="$GOPATH/bin:$PATH"

upgrade_go(){
	local version="${1:-latest}"
	(g install $version && g set $version && g list)
}
+golang(){
	upgrade_go \
	|| (curl -sSL https://git.io/g-install | sh -s) \
	   && upgrade_go
}

"»g"(){
	g self-upgrade
}

