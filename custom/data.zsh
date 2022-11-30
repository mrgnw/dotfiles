alias duck='duckdb'

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
