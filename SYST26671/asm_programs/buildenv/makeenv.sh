#!/bin/bash


#The URL for downloading Emu8086
_EMU8086_URL="http://www.emu8086.com/d/emu8086v408r.exe"


#Test if wine is installed
if [ -x /usr/bin/wine ] ; then
	#Download Emu8086
	# wget -c "$_EMU8086_URL" -O emu8086_installer.exe

	#Unpack the executable
	wine ./innounp.exe -xb emu8086_installer.exe

	#Clean the Emu8086 folder
	rm -rf "{app}/documentation"
	rm -rf "{app}/examples"
	rm -rf "{app}/DEVICES"
	rm -f "{app}/inc/"*.txt
	rm -f "{app}/emu8086.ini"

	#Move files
	mv "{app}/"* .
	mv "{sys}/"* .

	#Clean the environment
	rm -f install_script.iss
	rm -f emu8086_installer.exe
	rm -f innounp.exe
	rm -f make_emu8086-buildenv.sh
	rmdir "{app}"
	rmdir "{sys}"
else
	echo "E: WINE is not installed"
	exit 1
fi

