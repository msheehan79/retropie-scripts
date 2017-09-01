### Set variables for your joypad and emulator
### Basic Configuraion - Standard controller mappings - ID and keymaps determined dynamically
basicConfig="sudo /opt/retropie/supplementary/xboxdrv/bin/xboxdrv \
	> /dev/null \
	--silent \
	--detach-kernel-driver \
	--force-feedback \
	--deadzone-trigger 15% \
	--deadzone 4000 \
	--dpad-as-button \
	--trigger-as-button"
 
### Extended Configurations
### Specific emulator configuration or any other parameters you will need only for some emulators
scummVM="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap x1=REL_X:10,y1=REL_Y:10 \
	--ui-buttonmap a=BTN_LEFT,b=BTN_RIGHT,start=KEY_F5,back=KEY_ESC \
	--ui-buttonmap guide=void,x=void,y=void,lb=void,rb=void,tl=void,tr=void,lt=void,rt=void,back=void \
	--ui-axismap x2=void"

amiga_orig="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap x2=REL_X:1,y2=REL_Y:1 \
	--ui-axismap x1=KEY_LEFT:KEY_RIGHT,y1=KEY_DOWN:KEY_UP \
	--ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT \
	--ui-buttonmap lt=BTN_LEFT,rt=BTN_RIGHT,start=KEY_ESC,back=KEY_LEFTCTRL,y=KEY_SPACE,a=KEY_LEFTCTRL,b=KEY_LEFTALT,x=KEY_LEFTSHIFT \
	--ui-buttonmap guide=void,tl=void,lt=void,rt=void,back=void \
	--ui-axismap x2=void"

amiga="--ui-buttonmap du=KEY_UP,dd=KEY_DOWN,dl=KEY_LEFT,dr=KEY_RIGHT \
			--ui-buttonmap guide=KEY_F12,tl=void,lt=void,rt=void,back=void"

atari5200="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap X1=KEY_KP4:KEY_KP6,Y1=KEY_KP8:KEY_KP5 \
	--ui-axismap Y2=KEY_2:KEY_8,X2=KEY_4:KEY_6,lt+Y2=KEY_1:KEY_7,rt+Y2=KEY_3:KEY_9 \
	--ui-buttonmap tr=KEY_5,b=KEY_EQUAL,y=KEY_KPASTERISK,lb=KEY_0 \
	--ui-buttonmap a=KEY_RIGHTCTRL,x=KEY_RIGHTSHIFT,back+start=KEY_F9,lt+start=KEY_F5,du=KEY_KP8,dd=KEY_KP5,dl=KEY_KP4,dr=KEY_KP6,start=KEY_F4,back=KEY_F3,lt=KEY_HOME,rt=KEY_HOME,tl=KEY_HOME \
	--ui-buttonmap lt+a=KEY_ENTER,lt+b=KEY_ESC,lt+du=KEY_UP,lt+dd=KEY_DOWN,lt+dl=KEY_LEFT,lt+dr=KEY_RIGHT,back+x=KEY_F1,rt+b=KEY_F2 \
	--ui-axismap lt+X1=KEY_LEFT:KEY_RIGHT,lt+Y1=KEY_UP:KEY_DOWN \
	--ui-buttonmap guide=void,tl=void,rb=void"
	
atari5200p2="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap X1=KEY_A:KEY_D,Y1=KEY_W:KEY_S \
	--ui-axismap Y2=KEY_2:KEY_8,X2=KEY_4:KEY_6,lt+Y2=KEY_1:KEY_7,rt+Y2=KEY_3:KEY_9 \
	--ui-buttonmap tr=KEY_5,b=KEY_EQUAL,y=KEY_KPASTERISK,lb=KEY_0 \
	--ui-buttonmap a=KEY_LEFTCTRL,x=KEY_RIGHTSHIFT,back+start=KEY_F9,lt+start=KEY_F5,du=KEY_W,dd=KEY_S,dl=KEY_A,dr=KEY_D,start=KEY_F4,back=KEY_F3,lt=KEY_HOME,rt=KEY_HOME,tl=KEY_HOME \
	--ui-buttonmap lt+a=KEY_ENTER,lt+b=KEY_ESC,lt+du=KEY_UP,lt+dd=KEY_DOWN,lt+dl=KEY_LEFT,lt+dr=KEY_RIGHT,back+x=KEY_F1,rt+b=KEY_F2 \
	--ui-axismap lt+X1=KEY_LEFT:KEY_RIGHT,lt+Y1=KEY_UP:KEY_DOWN \
	--ui-buttonmap guide=void,tl=void,rb=void"

atari5200_mouse="--axismap -Y1=Y1,-Y2=Y2 \
	--buttonmap tr^toggle=tr \
	--ui-axismap x1=REL_X:10,y1=REL_Y:10 \
	--ui-axismap Y2=KEY_2:KEY_8,X2=KEY_4:KEY_6,lt+Y2=KEY_1:KEY_7,rt+Y2=KEY_3:KEY_9 \
	--ui-buttonmap rb=KEY_5,b=KEY_EQUAL,y=KEY_KPASTERISK,lb=KEY_0 \
	--ui-buttonmap a=KEY_RIGHTCTRL,x=KEY_RIGHTSHIFT,back+start=KEY_F9,lt+start=KEY_F5,du=KEY_KP8,dd=KEY_KP5,dl=KEY_KP4,dr=KEY_KP6,start=KEY_F4,back=KEY_F3,lt=KEY_HOME,rt=KEY_HOME \
	--ui-buttonmap lt+a=KEY_ENTER,lt+b=KEY_ESC,lt+du=KEY_UP,lt+dd=KEY_DOWN,lt+dl=KEY_LEFT,lt+dr=KEY_RIGHT,back+x=KEY_F1,rt+b=KEY_F2 \
	--ui-buttonmap tr+b=BTN_LEFT,tr+a=BTN_RIGHT \
	--ui-buttonmap guide=void,tl=void"

atari5200_dualsticks="--axismap -Y1=Y1,-Y2=Y2 \
	--buttonmap tl^toggle=tl \
	--buttonmap tr^toggle=tr \
	--ui-axismap X1=KEY_KP4:KEY_KP6,Y1=KEY_KP8:KEY_KP5 \
	--ui-axismap X2=KEY_A:KEY_D,Y2=KEY_W:KEY_S \
	--ui-buttonmap a=KEY_RIGHTCTRL,b=KEY_EQUAL,x=KEY_RIGHTSHIFT,y=KEY_KPASTERISK,back+start=KEY_F9,lt+start=KEY_F5,du=KEY_KP8,dd=KEY_KP5,dl=KEY_KP4,dr=KEY_KP6,start=KEY_F4,back=KEY_F3,lt=KEY_HOME,rt=KEY_HOME,tl=KEY_HOME,tr=KEY_HOME \
	--ui-buttonmap lt+a=KEY_ENTER,lt+b=KEY_ESC,lt+du=KEY_UP,lt+dd=KEY_DOWN,lt+dl=KEY_LEFT,lt+dr=KEY_RIGHT,back+x=KEY_F1,rt+b=KEY_F2 \
	--ui-axismap lt+X1=KEY_LEFT:KEY_RIGHT,lt+Y1=KEY_UP:KEY_DOWN \
	--ui-axismap tl+x1=REL_X:10,tl+y1=REL_Y:10 \
	--ui-buttonmap tr+b=BTN_LEFT,tr+a=BTN_RIGHT \
	--ui-buttonmap guide=void,lb=void,rb=void"

intellivision="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap X1=KEY_S:KEY_D,Y1=KEY_E:KEY_X \
	--ui-axismap Y2=KEY_2:KEY_8,X2=KEY_4:KEY_6,lt+Y2=KEY_1:KEY_7,rt+Y2=KEY_3:KEY_9 \
	--ui-buttonmap tr=KEY_5,b=KEY_EQUAL,rb=KEY_MINUS,lb=KEY_0 \
	--ui-buttonmap a=KEY_LEFTSHIFT,x=KEY_LEFTCTRL,y=KEY_LEFTALT,lt+back=KEY_F12,back+start=KEY_F1,lt=KEY_HOME,rt=KEY_HOME,tl=KEY_HOME,du=KEY_E,dd=KEY_X,dl=KEY_S,dr=KEY_D,start=KEY_PAUSE \
	--ui-buttonmap back=cycle-key:KEY_F6:KEY_F5 \
	--ui-buttonmap guide=KEY_ENTER"
	
intellivisionp2="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap X1=KEY_J:KEY_K,Y1=KEY_I:KEY_M \
	--ui-axismap Y2=KEY_KP2:KEY_KP8,X2=KEY_KP4:KEY_KP6,lt+Y2=KEY_KP1:KEY_KP7,rt+Y2=KEY_KP3:KEY_KP9 \
	--ui-buttonmap tr=KEY_KP5,b=KEY_ENTER,rb=KEY_KP0,lb=KEY_DOT \
	--ui-buttonmap a=KEY_RIGHTSHIFT,x=KEY_RIGHTCTRL,y=KEY_RIGHTALT,lt+back=KEY_F12,back+start=KEY_F1,lt=KEY_HOME,rt=KEY_HOME,tl=KEY_HOME,du=KEY_I,dd=KEY_M,dl=KEY_J,dr=KEY_K,back=KEY_HOME,start=KEY_PAUSE \
	--ui-buttonmap guide=KEY_ENTER"

intellivision_armorbattle="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap X1=KEY_S:KEY_D,Y1=KEY_E:KEY_X \
	--ui-axismap Y2=KEY_1:KEY_2,X2=KEY_3:KEY_4,lt+Y2=KEY_5:KEY_6,lt+X2=KEY_7:KEY_8,rt+Y2=KEY_9:KEY_0,rt+X2=KEY_MINUS:KEY_EQUAL \
	--ui-buttonmap a=KEY_LEFTSHIFT,b=KEY_HOME,x=KEY_LEFTCTRL,y=KEY_LEFTALT,lt+back=KEY_F12,back+start=KEY_F1,lt=KEY_HOME,rt=KEY_LEFTSHIFT,tl=KEY_HOME,tr=KEY_HOME,du=KEY_E,dd=KEY_X,dl=KEY_S,dr=KEY_D,start=KEY_PAUSE \
	--ui-buttonmap back=cycle-key:KEY_F6:KEY_F5 \
	--ui-buttonmap guide=KEY_ENTER,lb=void,rb=void"
	
intellivisionp2_armorbattle="--axismap -Y1=Y1,-Y2=Y2 \
	--ui-axismap X1=KEY_J:KEY_K,Y1=KEY_I:KEY_M \
	--ui-axismap Y2=KEY_KP1:KEY_KP2,X2=KEY_KP3:KEY_KP4,lt+Y2=KEY_KP5:KEY_KP6,lt+X2=KEY_KP7:KEY_KP8,rt+Y2=KEY_KP9:KEY_DOT,rt+X2=KEY_0:KEY_ENTER \
	--ui-buttonmap a=KEY_RIGHTSHIFT,b=KEY_HOME,x=KEY_RIGHTCTRL,y=KEY_RIGHTALT,lt+back=KEY_F12,back+start=KEY_F1,lt=KEY_HOME,rt=KEY_RIGHTSHIFT,tl=KEY_HOME,tr=KEY_HOME,du=KEY_I,dd=KEY_M,dl=KEY_J,dr=KEY_K,back=KEY_HOME,start=KEY_PAUSE \
	--ui-buttonmap guide=KEY_ENTER,lb=void,rb=void"
	
fourway="--four-way-restrictor"

invert="--ui-buttonmap du=KEY_DOWN,dd=KEY_UP"

### Kill Command
xboxkill="sudo killall > /dev/null 2>&1 xboxdrv"