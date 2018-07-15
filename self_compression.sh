#!/bin/bash
#Function : Accomplish self-decompression accorrding to the suffix

#If the input is empty,output the usage and function.
if test $# -eq 0
then 
	echo Usage:self_compression.sh [--list] or [Source compressed file] [Destination path]
	echo Self compression accorrding to the file name suffix
	exit
fi

#If the input is "--list",output the supported file types.
if test $1 = "--list"
then
	echo Supported file types: zip tar tar.gz tar.bz2
	exit
else
	FILE=$1
#Get the suffix from the file.
	suffix=${FILE##*.}
fi

#Get the right path to decompress.
if test -z $2
then 
	path=.
else 
	path=$2
fi

#choose the different way to decompress by the suffix.
case $suffix in 
zip) 
	unzip -d $path $1;;
tar)
	tar -xvf $1 -C $path;;
gz)
	tar -zxvf $1 -C $path;;
bz2)
	tar -jxvf $1 -C $path;;
#If the suffix is unsupported,output the error.
*)
	echo unsupported formats
esac

















