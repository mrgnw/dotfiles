timezsh() {
  for i in $(seq 1 5); 
    do /usr/bin/time $SHELL -i -c exit; 
  done
}