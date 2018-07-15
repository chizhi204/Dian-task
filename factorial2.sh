#!/bin/bash

factorial()
{
    local num=$1
    if [[ "$num" -eq 0 ]];
    then
        fac=1
    else
        let "dec=$num-1"
        factorial $dec
        let "fac=$num * $fac"

    fi

}

factorial $1
echo "$fac"
