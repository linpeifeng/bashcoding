#!/bin/bash

declare -i j=0
for line in $(head -n 5 /etc/passwd)
do
    j+=1
    echo -n "$j line has fields at:"
    #save_ifs=IFS
    #IFS=":"
    for k in $line
    do
        echo -n $k " "
    done
    #IFS=$save_ifs
    echo
done
