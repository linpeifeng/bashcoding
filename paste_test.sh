#! /bin/bash

echo '$BASH,$BASH_ENV,$BASH_VERSION' > 1.txt
value="$BASH,$BASH_ENV,$BASH_VERSION"
echo $value

awk 'BEGIN {RS=","}{print $1,"="}' 1.txt > 2.txt

IFS=','
for v in $value; do
    echo $v
done > 3.txt

paste 2.txt 3.txt
