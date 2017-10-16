#!/bin/bash

# Check if EmulationStation is running. Exit if it isn't.
espid="$(pgrep -f "/opt/retropie/supplementary/.*/emulationstation([^.]|$)")" || exit 0

emucall="$(sed '4!d; s/\([\\"]\|[[:alnum:]_]\+=[^ ]* \)//g; s/[][(){}^$*.|+? ]/\\&/g' /dev/shm/runcommand.info)"
# If there is an emulator running, we need to kill it and go back to ES
if [[ -n "$emucall" ]]; then
    emupid="$(pgrep -f "$emucall" | tr '\n' ' ')"
    pkill -P "$(echo $emupid | tr ' ' ',')"
    kill "$emupid"
    wait "$emupid"
    sleep 5
fi

killall -w emulationstation
#COUNTER=0
#while [ $COUNTER lt 60 ]; do
#  if [ ! "$(pgrep -f "emulationstation" )" ]
#  then
#    break
#  fi
#  let COUNTER=COUNTER+1
#  sleep 1
#done
