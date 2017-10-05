#!/usr/bin/env python
# shutdown/startup script

import RPi.GPIO as GPIO
import time
import subprocess

DEBUG = False

BUTTON = 5
GPIO.setmode(GPIO.BOARD)
GPIO.setup(BUTTON, GPIO.IN)

while True:
        GPIO.wait_for_edge(BUTTON, GPIO.FALLING)

        if DEBUG:
                print("Button press detected")
        else:
                print("Shutdown process initiated")
                subprocess.call("/home/pi/scripts/killes.sh", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
                subprocess.call("/sbin/shutdown -h now", shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
