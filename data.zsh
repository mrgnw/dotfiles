alias duck='duckdb'

# dasf file [new_ext]
dasf(){
  new_ext="${2:-json}"
  dasel -f "$1" -r "$1:e" -w "$new_ext" > "$1:r"."$new_ext" 
}

xls(){
	# if there's one argument, convert it to csv
	if [[ $# -gt 0 ]]; then
		echo "» $1"
		xlsx2csv $1 $1:t:r -s 0
	else
		for xl in *.xlsx; do
			echo "» xl"
			xlsx2csv $xl $xl:t:r -s 0
			echo "Converted $xl to csvs in folder $xl:t:r"
			trash $xl
		done
	fi
}

alias csv='xls'
