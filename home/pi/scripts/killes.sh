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
    sleep 2
fi

kill "$espid"
wait "$espid"
sleep 2
