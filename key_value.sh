#! /bin/bash

declare -A arr

arr["\$BASH"]=$BASH

arr+=( ["\$BASH_ENV"]=$BASH_ENV ["\$BASH_VERSION"]=$BASH_VERSION )

for key in ${!arr[@]}; do
    echo ${key}"="${arr[${key}]}
done
