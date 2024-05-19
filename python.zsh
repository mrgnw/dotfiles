p+() { uv pip install "$@"}
p-() { uv pip uninstall "$@"}

»(){ 
	if [ -d .venv ]; then
		source .venv/bin/activate
	else
		echo "\t» ~/.venv"
		source ~/.venv/bin/activate
	fi
}
«(){ deactivate }

# allows pip install x[y]
set +o nomatch