»(){
    # if no args, detect the language of the project folder & run the appropriate command
    if [[ $# -eq 0 ]]; then
        if [[ -f "package.json" ]]; then 
            pnpm start
        elif [[ -f "Cargo.toml" ]]; then 
            cargo run
        elif [[ -f "go.mod" ]]; then 
            go run .
        elif [[ -f ".venv/bin/activate" ]]; then 
            »py
        elif [[ -f "docker-compose.yml" ]]; then 
            dc
        fi
    else
        dc $@;
    fi
}

eval "$(github-copilot-cli alias -- "$0")"