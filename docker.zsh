
dockerPulls(){
	
	standardDocks=(
		linuxserver/radarr
		linuxserver/sonarr
		linuxserver/transmission
		jstewig/docker-vpn-unlimited
		)

	for d in $standardDocks; do
		echo "🍺 loading the docks 🚢 🐳" 
		docker pull $d
	done

}

# Run a docker command on multiple items
# e.g. `dkr pull a b` = docker pull a; docker pull b;
dkr(){
	docker_command=$1
	shift
	for i in "$@"
	do 
		docker $docker_command "$i"
	done
}