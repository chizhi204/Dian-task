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
	echo ${FILE#*.}
fi

