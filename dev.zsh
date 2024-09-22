# infer tool from current directory
get_tool() {
	if [[ -f pyproject.toml ]]; then
		echo "uv"
	elif [[ -f package.json ]]; then
		echo "bun"
	elif [[ -f Package.swift ]]; then
		echo "swift"
	elif [[ -f main.go ]]; then
		echo "go"
	elif [[ -f compose.yml || -f compose.yaml ]]; then
		echo "docker-compose"
	elif [[ -f docker-compose.yml || -f docker-compose.yaml ]]; then
		echo "docker-compose"
	else
		echo ""
	fi
}

# Define the command for each tool & operation (+-«»)
map_tool_command() {
	local tool=$1
	local operation=$2

	case $tool in
		uv)
			case $operation in
				+) echo "add" ;;
				-) echo "remove" ;;
				») echo "run" ;;
				«) echo "sync" ;;
			esac
			;;
		bun|swift|go)
			case $operation in
				+) echo "add" ;;
				-) echo "remove" ;;
				») echo "run" ;;
				«) echo "update" ;;
			esac
			;;
		docker-compose)
			case $operation in
				+) echo "pull" ;;
				-) echo "down" ;;
				») echo "up" ;;
				«) echo "pull" ;;
			esac
			;;
		brew)
			case $operation in
				+) echo "install" ;;
				-) echo "uninstall" ;;
				») echo "upgrade" ;;
				«) echo "update" ;;
			esac
			;;
	esac
}

run_tool_command() {
    local operation=$1
    shift
    local tool=$(get_tool)
		echo $tool
    tool=${tool:-brew}
    command=$(map_tool_command $tool $operation)
		echo "$tool $command" "$@"
    $tool $command "$@"
}

+() { run_tool_command + "$@" }
-() { run_tool_command - "$@" }
«() { run_tool_command « "$@" }
»() { run_tool_command » "$@" }