#!/bin/bash
if test $# -eq 0
then 
	echo Usage:self_compression.sh [--list] or [Source compressed file] [Destination path]
	echo Self compression accorrding to the file name suffix
	exit
fi


if test $1 = "--list"
then
	echo Supported file types: zip tar tar.gz tar.bz2
	exit
else
	FILE=$1
	suffix=${FILE##*.}
fi

if test -z $2
then 
	path=.
else 
	path=$2
fi

case $suffix in 
zip) 
	unzip -d $path $1;;
tar)
	tar -xvf $1 -C $path;;
gz)
	tar -zxvf $1 -C $path;;
bz2)
	tar -jxvf $1 -C $path;;
*)
	echo Unsupported formats.
	echo Use the command self_compression.sh --list to know the supported format.
esac

















