#!/bin/bash

_APP_NAME="<APPNAME>"

if [ -x /usr/bin/dosbox ] ; then
	#Go to the scrip directory
	cd "${0%/*}" 1> /dev/null 2> /dev/null
	#Run DosBox
	dosbox -conf \
		-c "ECHO" \
		-c "MOUNT C \"`pwd`\"" \
		-c "C:" \
		-c "$_APP_NAME" \
		-c "EXIT"
	exit 0
else
	echo "E: DosBox is not installed."
	exit 1
fi

