alias duck='duckdb'


jsonl(){
  local selector="${2:-.[]}"
  jq -c "$selector" "$1" > "$1:r".jsonl
}

sojsonl(){ jsonl "$1" ".[].row[]" }
sojsons(){
  for f in **/*.json; do
    sojsonl "$f"
  done
}

# dasf file [new_ext]
dasf(){
  new_ext="${2:-json}"
  dasel -f "$1" -r "$1:e" -w "$new_ext" > "$1:r"."$new_ext" 
}

dasf2(){
    echo "$1" > "$1:r".json
    dasel -f "$1" -r "$1:e" -w "json" | jj -u > "$1:r".json
}

dasfs(){
  for f in **/*.xml; do
    echo "$f" > "$f:r".json
    dasel -f "$f" -r "$f:e" -w "json" | jj -u > "$f:r".json
  done
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
