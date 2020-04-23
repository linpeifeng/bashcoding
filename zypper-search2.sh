#!/bin/bash

trim_str () {
  RET=`awk '{$1=$1};1'`
  return $RET
}

REPO=19
URL="/home/smt-repo/SUSE/Updates/SLE-SERVER/12-SP3/x86_64/"

if [ ! -d $URL ]; then
  echo "$URL not exit"
  exit 1
fi

mkdir -p $URL/update.new/x86_64/
mkdir -p $URL/update.new/noarch/

PACKAGES=`zypper se -t package -s -r $REPO | awk -F "|" '{ print $2 }'`
#echo $PACKAGES
for i in $PACKAGES; do
    version=`zypper info -r $REPO $i | grep "^Version" | awk -F ":" '{ print $2 }'`
    arch=`zypper info -r $REPO $i | grep "^Arch" | awk -F ":" '{ print $2 }'`
    if [ -n "$version" ]; then
        VERSION=`echo -e "$version" | awk '{$1=$1};1'`
        ARCH=`echo -e "$arch" | awk '{$1=$1};1'`
        echo "handling $i-$VERSION-$ARCH"
        if [ "$ARCH" = 'x86_64' ]; then
            cp -up $URL/update/x86_64/"$i-$VERSION"*.rpm $URL/update.new/x86_64/
            if [ $? != 0 ]; then
               echo "ERROR $i-$VERSION"
            fi
        elif [ "$ARCH" = 'noarch' ]; then
            cp -up $URL/update/noarch/"$i-$VERSION"*.rpm $URL/update.new/noarch/
            if [ $? != 0 ]; then
               echo "ERROR $i-$VERSION"
            fi
        else
           echo "ERROR: $i-$VERSION not exit" 
        fi
    fi
done


