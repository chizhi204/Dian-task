#!/bin/bash
#A program to calculate a number's factorial.

#If the input is empty,output the usage and function.
if test $# -eq 0
then
        echo Usage:"self_compression.sh n" to calculate n!.
        echo "A program to calculate a number's factorial."
        exit
fi

#Function declaration
function factorial()
{
        #Define a local variable "num" which equals to input
	local num=$1
	#When the num is 0,the result is 1.
	if [[ "$num" -eq 0 ]];
	then
        	result=1

	else
        	let "temp=$num-1"
		#Calling the function itself
        	factorial $temp
		#After calling the function many times,the result is (n-1)!
		#So the result multiplies the input to get the final result n!.
        	let "result=$1 * $result"
    	fi
}

#calling the function
factorial $1
#Output the result
echo "$result"
