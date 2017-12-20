#!/bin/bash
joycommand="$(sed '5!d; s/..$//' /dev/shm/runcommand.info)"
if [[ -n "$joycommand" ]]; then
	sudo killall -9 > /dev/null 2>&1 xboxdrv
	eval $joycommand
fi
