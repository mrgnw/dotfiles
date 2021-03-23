pg_ping(){
  pg_isready $@  && sleep 3 && pg_ping $@ || afplay /System/Library/Sounds/Ping.aiff
}