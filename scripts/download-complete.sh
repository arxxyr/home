#!/bin/bash
path=$3
downloadpath='/media/extraDisk/aria2c/downloading'
donepath='/media/extraDisk/aria2c/done'

if [$2 -eq 0]
        then
                exit 0
fi
while true; do
filepath=$path
path=${path%/*}; 
if ["$path" = "$downloadpath"] && [ $2 -eq 1 ]
    then
    mv "$filepath" "$donepath"      
    exit 0
elif ["$path" = "$downloadpath"]
    then
    mv "$filepath"/ "$donepath"/"${filepath##*/}"/
    exit 0
fi
done
