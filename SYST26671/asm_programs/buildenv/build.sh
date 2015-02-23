#!/bin/bash


make_linux_launcher() {
	cat ./buildenv/run_linux.tpl | \
		sed "s/<APPNAME>/$1/g" > "./$1.sh"
	chmod +x "./$1.sh"
}


#Make the input path
_INPUT="z:`pwd`"
_INPUT="${_INPUT//\//\\}"

#Clean the build environment
rm ./buildenv/MyBuild/* > /dev/null 2> /dev/null

#Build the program
echo "* Compiling..."
wine ./buildenv/emu8086.exe /a "$_INPUT" > /dev/null 2> /dev/null

#Display the log file
echo "* LOG..."
cat ./buildenv/MyBuild/_emu8086_log.txt

#Get the result
mv ./buildenv/MyBuild/*.$2_ "./$1.$2" > /dev/null 2> /dev/null

#Test the result
if [ -f "$1.$2" ] ; then
	echo '* Successfully compiled !'
	make_linux_launcher $1
	exit 0
else
	echo "E: An error occured when compiling '$1.$2'."
	exit 1
fi


