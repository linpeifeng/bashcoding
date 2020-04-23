#!/bin/bash

trim_str () {
  RET=`awk '{$1=$1};1'`
  return $RET
}

PACKAGES=`zypper se -t package | awk -F "|" '{ print $2 }'`
#echo $PACKAGES
for i in $PACKAGES; do
    version=`zypper info $i | grep "^Version" | awk -F ":" '{ print $2 }'`
    level=`zypper info  $i | grep "^Support Level" | awk -F ":" '{ print $2 }'`
    #echo "$PACKAGES","$version","$level" >> /tmp/package-info.txt
    echo "$i","$version","$level" >> /tmp/package-info.txt
done


