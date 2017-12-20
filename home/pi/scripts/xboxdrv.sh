#!/bin/bash
sudo killall -9 > /dev/null 2>&1 xboxdrv
joycommand="$(sed '5!d; s/..$//' /dev/shm/runcommand.info)"
if [[ -n "$joycommand" ]]; then
	eval $joycommand
fi
