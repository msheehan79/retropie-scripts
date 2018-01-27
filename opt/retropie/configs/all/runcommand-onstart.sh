#!/bin/bash -f
## Uncomment one or all of the following if you need to find some information about the emulator or roms
## Name of the emulator
#echo $1 >> /dev/shm/runcommand.log

## Name of the software used for running the emulation
#echo $2 >> /dev/shm/runcommand.log

## Name of the rom
#echo $3 >> /dev/shm/runcommand.log

##Executed command line
#echo $4 >> /dev/shm/runcommand.log

### The FUN begins
#Get ROM name stripping full path
rom="${3##*/}"
#echo $rom >> /dev/shm/runcommand.log

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

### Execute the driver with the configuration you need
# $1 is the name of the emulation, not the name of the software used
# it is intellivision not jzintv
case $1 in

	atari5200)
		# Will update the atari800.cfg file to make sure that the correct js id is assigned for p1 and p2
		case $rom in
			# ROM specific configurations, either 4-way joysticks, dual joysticks or mouse/paddle support
			"Pac-Man (USA).a52"|"Dig Dug (USA).a52"|"Frogger (USA).a52"|"Frogger II - Threeedeep! (USA).a52"|\
			"Galaxian (USA).a52"|"Mario Bros. (USA).a52"|"Montezuma's Revenge featuring Panama Joe (USA).a52"|\
			"Mr. Do!'s Castle (USA).a52"|"Ms. Pac-Man (USA).a52"|"Popeye (USA).a52"|"Wizard of Wor (USA).a52")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $atari5200 $fourway &"
				sed -i "s/SDL_JOY_0_INDEX=.*/SDL_JOY_0_INDEX=${player1['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $atari5200_p2 $fourway &"
					sed -i "s/SDL_JOY_1_INDEX=.*/SDL_JOY_1_INDEX=${player2['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			"Robotron 2084 (USA).a52"|"Space Dungeon (USA).a52")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $atari5200_dualsticks &"
				sed -i "s/SDL_JOY_0_INDEX=.*/SDL_JOY_0_INDEX=${player1['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $atari5200_dualsticks &"
					sed -i "s/SDL_JOY_1_INDEX=.*/SDL_JOY_1_INDEX=${player2['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			"Centipede (USA).a52"|"Gorf (USA).a52"|"Kaboom! (USA).a52"|"Missile Command (USA).a52"|\
			"Pengo (USA).a52"|"Pole Position (USA).a52"|"Super Breakout (USA).a52")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $atari5200_mouse &"
				sed -i "s/SDL_JOY_0_INDEX=.*/SDL_JOY_0_INDEX=${player1['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $atari5200_mouse &"
					sed -i "s/SDL_JOY_1_INDEX=.*/SDL_JOY_1_INDEX=${player2['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				fi				
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $atari5200 &"
				sed -i "s/SDL_JOY_0_INDEX=.*/SDL_JOY_0_INDEX=${player1['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $atari5200_p2 &"
					sed -i "s/SDL_JOY_1_INDEX=.*/SDL_JOY_1_INDEX=${player2['jsid']}/g" /opt/retropie/configs/atari800/atari800.cfg
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
		esac
	;;

	intellivision)		
		case $rom in
			"Armor Battle (World).int")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $intellivision_armorbattle &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $intellivisionp2_armorbattle &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			"Beauty and the Beast (World).int"|"BurgerTime (World).int"|"Congo Bongo (World).int"|"Dig Dug (World).int"|\
			"Donkey Kong (World).int"|"Donkey Kong Jr (World).int"|"Duncan's Thin Ice (World).int"|"Lock 'N' Chase (World).int"|\
			"Mouse Trap (World).int"|"Night Stalker (World).int"|"Pac-Man (World).int"|"Popeye (World).int"|"Tutankham (World).int")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $intellivision $fourway &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $intellivision_p2 $fourway &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $intellivision &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $intellivision_p2 &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
		esac
	;;

	amiga)
		case $rom in
			"1943.uae")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $amiga_1943 &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $amiga &"	
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			*)
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $amiga &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $amiga &"	
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
		esac
	;;
	
	n64)
		$xboxkill
		joycommand="$basicConfig ${player1['id']} ${player1['map']} $invertrightanalog &"
		if [ ${#player2[@]} -gt 0 ]; then
			joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $invertrightanalog &"	
		fi
		echo $joycommand >> /dev/shm/runcommand.info
		eval $joycommand		
	;;

	# RetroArch emulators
	atari7800|fds|gamegear|gb|gbc|gba|mastersystem|megadrive|msx|msx2|neogeo|nes|pcengine|pcenginecd|pcfx|psx|sega32x|segacd|sgfx|snes|vectrex|virtualboy|x68000)
		$xboxkill
		joycommand="$basicConfig ${player1['id']} ${player1['map']} &"
		if [ ${#player2[@]} -gt 0 ]; then
			joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} &"	
		fi

		echo $joycommand >> /dev/shm/runcommand.info
		eval $joycommand
		# Need to put a delay to allow xboxdrv to get set up before we can poll for the SDL IDs to map those
		sleep 0.5
		map_joystick_indexes		
		sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
		sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
		if [ ${#player2[@]} -gt 0 ]; then
			sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
			sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
		fi
	;;

	arcade)
        case $2 in
			"lr-mame2003"|"lr-mame2003-plus"|"lr-mame2010"|"lr-fbalpha")
				case $rom in # Configuration used only for these ROMs - four way joystick
					"005.zip"|"alibaba.zip"|"amidar.zip"|"anteater.zip"|"atetris.zip"|"armorcar.zip"|"armwrest.zip"|"bagman.zip"|"ballbros.zip"|"barricad.zip"|\
					"bbonk.zip"|"bnj.zip"|"bogeyman.zip"|"bombrman.zip"|"bouldash.zip"|"brubber.zip"|"btimem.zip"|"cavelon.zip"|"checkman.zip"|"columns.zip"|"comotion.zip"|\
					"congo.zip"|"crash.zip"|"ckong.zip"|"crush.zip"|"devilfsh.zip"|"digdug.zip"|"digdug2.zip"|"digger.zip"|"docastle.zip"|"dorunrun.zip"|"domino.zip"|"dominos.zip"|\
					"dkong.zip"|"dkong3.zip"|"dkongjr.zip"|"drgnbstr.zip"|"eeekk.zip"|"elevator.zip"|"frogger.zip"|"galaga.zip"|"galaxian.zip"|"galpanic.zip"|"glfgreat.zip"|\
					"headon.zip"|"hustle.zip"|"invaders.zip"|"jrpacman.zip"|"jungler.zip"|"kicker.zip"|"klax.zip"|"kungfum.zip"|"ladybug.zip"|"ldrun.zip"|"lnc.zip"|"locomotn.zip"|\
					"lupin3.zip"|"maze.zip"|"monsterb.zip"|"mspacman.zip"|"mrdo.zip"|"mrflea.zip"|"mrgoemon.zip"|"mtrap.zip"|"natodef.zip"|"naughtyb.zip"|"nibbler.zip"|"nrallyx.zip"|\
					"olibochu.zip"|"pacman.zip"|"pacmania.zip"|"pacplus.zip"|"pandoras.zip"|"pengo.zip"|"pepper2.zip"|"pitfall2.zip"|"ponpoko.zip"|"popeye.zip"|"puckman.zip"|"pulsar.zip"|\
					"punchout.zip"|"qbert.zip"|"qbertqub.zip"|"rallyx.zip"|"rampage.zip"|"rbtapper.zip"|"robby.zip"|"roundup.zip"|"rthunder.zip"|"sbagman.zip"|"sharkatt.zip"|"sidetrac.zip"|\
					"spacezap.zip"|"spectar.zip"|"spnchout.zip"|"sqix.zip"|"superpac.zip"|"tankbatt.zip"|"tapper.zip"|"targ.zip"|"tazmania.zip"|"tetris.zip"|"tetrisp.zip"|"thepit.zip"|"thief.zip"|\
					"timber.zip"|"todruaga.zip"|"tomahawk.zip"|"toypop.zip"|"tranqgun.zip"|"upndown.zip"|"warpwarp.zip"|"wbml.zip"|"wow.zip"|"zerozone.zip"|"zigzag.zip"|"zoar.zip"|"zookeep.zip")
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} $fourway &"
						if [ ${#player2[@]} -gt 0 ]; then
							joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $fourway &"
						fi
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
					*) # Configuration for every other ROMs on this emulator
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} &"
						if [ ${#player2[@]} -gt 0 ]; then
							joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} &"
						fi
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
				esac
				
				# Need to put a delay to allow xboxdrv to get set up before we can poll for the SDL IDs to map those
				sleep 0.5
				map_joystick_indexes
				sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
				sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
				if [ ${#player2[@]} -gt 0 ]; then
					sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
					sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
				fi
			;;
			"advmame")
				case $rom in # Configuration used only for these ROMs
					"bwidow.zip")
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_bwidow &"
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
					"bzone.zip")
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_bzone &"
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
					"tinstar.zip")
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_tinstar &"
						if [ ${#player2[@]} -gt 0 ]; then
							joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $advmame_tinstar &"
						fi
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
					"tron.zip"|"dotron.zip")
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_tron &"
						if [ ${#player2[@]} -gt 0 ]; then
							joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $advmame_tron_p2 &"
						fi
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
					*)
						$xboxkill
						joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_p1 &"
						if [ ${#player2[@]} -gt 0 ]; then
							joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $advmame_p2 &"
						fi
						echo $joycommand >> /dev/shm/runcommand.info
						eval $joycommand
					;;
				esac
			;;
		esac
	;;

	mame-libretro)
		$xboxkill
		joycommand="$basicConfig ${player1['id']} ${player1['map']} &"
		if [ ${#player2[@]} -gt 0 ]; then
			joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} &"	
		fi
		echo $joycommand >> /dev/shm/runcommand.info
		eval $joycommand

		# Need to put a delay to allow xboxdrv to get set up before we can poll for the SDL IDs to map those
		sleep 0.5
		map_joystick_indexes		
		sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
		sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
		if [ ${#player2[@]} -gt 0 ]; then
			sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
			sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
		fi
	;;

	mame-advmame)
		case $rom in
			"bwidow.zip")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_bwidow &"
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			"bzone.zip")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_bzone &"
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			"tinstar.zip")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_tinstar &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $advmame_tinstar &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			"tron.zip"|"dotron.zip")
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_tron &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $advmame_tron_p2 &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			*)
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $advmame_p1 &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $advmame_p2 &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
		esac
	;;

	fba)
		case $rom in
			"amidar.zip"|"atetris.zip"|"puckman.zip") # Configuration used only for these ROMs
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} $fourway &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} $fourway &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
			*) # Configuration for every other ROMs on this emulator
				$xboxkill
				joycommand="$basicConfig ${player1['id']} ${player1['map']} &"
				if [ ${#player2[@]} -gt 0 ]; then
					joycommand="$joycommand $basicConfig ${player2['id']} ${player2['map']} &"
				fi
				echo $joycommand >> /dev/shm/runcommand.info
				eval $joycommand
			;;
		esac

		# Need to put a delay to allow xboxdrv to get set up before we can poll for the SDL IDs to map those
		sleep 0.5
		map_joystick_indexes		
		sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
		sed -i "s/input_player1_joypad_index\s*\=\s*.*/input_player1_joypad_index = ${player1['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
		if [ ${#player2[@]} -gt 0 ]; then
			sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/all/retroarch.cfg
			sed -i "s/input_player2_joypad_index\s*\=\s*.*/input_player2_joypad_index = ${player2['jsindex']}/g" /opt/retropie/configs/$1/retroarch.cfg
		fi
	;;
esac
