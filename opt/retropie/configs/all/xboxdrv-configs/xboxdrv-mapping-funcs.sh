#!/bin/bash -f
#

# Config arrays
declare -A configArray
declare -A sdlArray
declare -A player1
declare -A player2

# function read_config()
# Reads config file data from supplied config filepath and parse any entries following pattern "controllern_type" to an array $configArray
# The finished associative array follows format [controllernumer_datatype] i.e. [1_keymap] would be the keymap string for controller 1 etc etc.
function read_config() {
	shopt -s extglob
	tr -d '\r' < $configfile > $configfile.unix
	while IFS='= ' read lhs rhs
	do
		if [[ ! $lhs =~ ^\ *# && -n $lhs ]]; then
			rhs="${rhs%%\#*}"    # Del in line right comments
			rhs="${rhs%%*( )}"   # Del trailing spaces
			rhs="${rhs%\"*}"     # Del opening string quotes 
			rhs="${rhs#\"*}"     # Del closing string quotes 
			
			if [[ $lhs =~ controller(.+)_(.*) ]]; then
				key=${BASH_REMATCH[1]}
				type=${BASH_REMATCH[2]}			
				case $type in
					"id"|"absmap"|"keymap"|"calibration"|"devicename")
						configArray[${key}_${type}]="${rhs}"
					;;
				esac
			fi			
		fi
	done < $configfile.unix
}

# function map_joystick_indexes()
# Maps Joystick SDL Index Numbers to an array - Needed for RetroArch config
# Requires jslist binary to obtain list of input joysticks
function map_joystick_indexes() {
	mapfile -t jsList < <(sudo jslist)
	for element in "${jsList[@]}"; do
		if [[ $element =~ ([0-9]+):(.*) ]]; then
			sdlArray[${BASH_REMATCH[2]}]=${BASH_REMATCH[1]}
		fi
	done
	
	# SDL index
	player1['jsindex']=${sdlArray[${player1["devicename"]}]}
	if [ ${#player2[@]} -gt 0 ]; then
		player2['jsindex']=${sdlArray[${player2["devicename"]}]}
	fi
}

# function assign_controllers()
# Assigns controller information to arrays for player1 and player2 based on what is currently connected
function assign_controllers() {
	for ((i=1; i <= ${#configArray[@]}; i++))
	do
		if [[ ${configArray[${i}_id]} != '' && -e ${configArray[${i}_id]} ]]; then
			if [ ${#player1[@]} -eq 0 ]; then
				player1=(
					["id"]="--evdev ${configArray[${i}_id]}" \
					["map"]="--evdev-absmap ${configArray[${i}_absmap]} --evdev-keymap ${configArray[${i}_keymap]} --calibration ${configArray[${i}_calibration]} --device-name '${configArray[${i}_devicename]}'" \
					["devicename"]="${configArray[${i}_devicename]}" \
				)
			
				# locate the joystick id (js0, js1, etc)
				# @todo do we even need this anymore or is SDL index all that is needed?
				joystickid=${configArray[${i}_id]}
				jsid=`sudo readlink ${joystickid/event-/}`
				player1['jsid']=${jsid/..\/js}			
			
			elif [ ${#player2[@]} -eq 0 ]; then
				player2=(
					["id"]="--evdev ${configArray[${i}_id]}" \
					["map"]="--evdev-absmap ${configArray[${i}_absmap]} --evdev-keymap ${configArray[${i}_keymap]} --calibration ${configArray[${i}_calibration]} --device-name '${configArray[${i}_devicename]}'" \
					["devicename"]="${configArray[${i}_devicename]}" \
				)

				# locate the joystick id (js0, js1, etc)
				joystickid=${configArray[${i}_id]}
				jsid=`sudo readlink ${joystickid/event-/}`
				player2['jsid']=${jsid/..\/js}
			
			else
				#echo "Both controllers already mapped. Exiting."
				break;
			fi
		fi
	done
}