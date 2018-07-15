#!/bin/bash
#Function : To show top N largest files or directories.

#To show the usage and function of the program.
if test $# -eq 0
then
        echo Usage: file_size.sh [-n N]  [-d DIR]
        echo Show top N largest files or directories.
        exit
fi

#To test the input is right.
if [ $1 != -n ]
then
	echo Wrong input.
	exit
fi


#Getting the right path of the files.
if test -z $4
then
        path=.
else
        path=$4
fi


filelist=`ls $path` 
#a is the cyclic variable.
a=0

#To get the name and size of the file one by one.
for file in $filelist
do 
	filename[$a]=$file
	filesize[$a]=`ls -l $path/$file | awk '{printf $5}'` 
	((a++))
done

#fileamount equals to the amount of the files or directories.
fileamount=$a;

#Sort by the size of the files or directories.
for((i=0;i<fileamount-1;i++))
do
        for((j=0;j<fileamount-1-i;j++))
        do
		l=` expr $j + 1 `

                if [[ ${filesize[$j]} -lt ${filesize[$l]} ]]
                then
			
                        temp1=${filesize[$j]}
                        filesize[$j]=${filesize[$l]}
                        filesize[$l]=$temp1
			
			temp2=${filename[$j]}
			filename[$j]=${filename[$l]}
			filename[$l]=$temp2
                fi
        done
done

#Output the serial number,the size and the name of the files and directories from the largest one.
echo The largest files or directories in $path are:     
for((k=0;k<$2;k++))
do
	m=` expr $k + 1 `
	echo -n "$m     "
        printf "%-10s" `du -sh $path/${filename[k]}`
        echo -e "\n"
done
