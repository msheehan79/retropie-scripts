#!/bin/bash

# Check if EmulationStation is running. Exit if it isn't.
espid="$(pgrep -f "/opt/retropie/supplementary/.*/emulationstation([^.]|$)")" || exit 0

emucall="$(sed -n 4p /dev/shm/runcommand.info | tr -d '\\"' | tr '^$[]*.()|+?{}' '.')"
# If there is an emulator running, we need to kill it and go back to ES
if [[ -n "$emucall" ]]; then
    emupid="$(pgrep -f "$emucall")"
    pkill -P "$emupid"
    kill "$emupid"
    wait "$emupid"
    sleep 5
fi

killall emulationstation
COUNTER=0
while [ $COUNTER lt 60 ]; do
  if [ ! "$(pgrep -f "emulationstation" )" ]
  then
    break
  fi
  let COUNTER=COUNTER+1
  sleep 1
done
