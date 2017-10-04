#!/bin/bash

# Check if EmulationStation is running. Finish the script if doesn't.
espid="$(pgrep -f "/opt/retropie/supplementary/.*/emulationstation([^.]|$)")" || exit 0

emucall="$(sed -n 4p /dev/shm/runcommand.info | tr -d '\\"' | tr '^$[]*.()|+?{}' '.')"
# If there's an emulator running, we need to kill it and go back to ES
if [[ -n "$emucall" ]]; then
    emupid="$(pgrep -f "$emucall")"
    pkill -P "$emupid"
    kill "$emupid"
    wait "$emupid"
    sleep 5 # maybe it can be lesser
fi

kill "$espid"
wait "$espid"
sleep 5 # maybe it can be lesser