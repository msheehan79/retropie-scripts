#!/bin/sh
# Include helper functions
source '/opt/retropie/configs/all/xboxdrv-configs/xboxdrv-mapping-funcs.sh'

# Location of config file
declare configfile='/opt/retropie/configs/all/xboxdrv-configs/joystick-maps.cfg'

# Initialize config data and find connected joystick SDL indexes
read_config $configfile

# Assign controller information such as device name, mapping and SDL index
assign_controllers

if [ ${#player1[@]} -eq 0 ]; then
	echo "No controllers found!"
	exit 0
fi

# Include controller configuration strings
source '/opt/retropie/configs/all/xboxdrv-configs/xboxdrv-controlmaps.sh'

$xboxkill
joycommand="$basicConfig ${player1['id']} ${player1['map']} &"
if [ ${#player2[@]} -gt 0 ]; then
	joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} &"
fi
#echo $joycommand >> /dev/shm/runcommand.log
eval $joycommand
# Need to put a delay to allow xboxdrv to get set up before we can poll for the SDL IDs to map those
sleep 0.5