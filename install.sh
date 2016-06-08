#!/bin/bash
set -x 

KEY=$1

wineboot -u
winetricks -q mfc40

# finally, install vb6
Xvfb :0 -auth ~/.Xauthority -screen 0 1024x768x24 >> ~/xvfb.log 2>&1 &
XVFB_PID=$!
sleep 3;
# convince the installer that the wizard has already been run
DISPLAY=:0 wine regedit.exe /s "vs\\KEY.DAT"
sleep 1;

DISPLAY=:0 wine "vs\\ACMSETUP.exe" /k $KEY /n Container /o None /qnt

sleep 15;
kill $XVFB_PID

ls "/home/wine/.wine/drive_c/Program Files/Microsoft Visual Studio/" | grep VB98 || exit 1
