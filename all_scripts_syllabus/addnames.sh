#!/bin/bash
if [ $# -eq 2 ]
	then
		echo "correct arguments supplied"
else
	echo "incorrect arguments supplied"
fi


if [ -e "$1" ]
	then
		echo "yes it exsists"
else
	echo "error no exsistance of file"
fi

if grep -Fxq "$2" "$1" 
	then 
		echo "username exists"
else
	echo "username does not exit"
	echo "appending to file"
	echo "$2">>"$1"


fi
