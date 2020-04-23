#!/bin/bash

PACKAGES=`zypper se -t package -s -r 11 | awk -F "|" '{ print $2, $4, $5 }'`
ALLPACKAGES=($PACKAGES)
tLen=${#ALLPACKAGES[@]}

for (( i=0; i<${tLen}; ((i=i+3))));
do
  echo ${ALLPACKAGES[$i]}-${ALLPACKAGES[$((i+1))]}
done


