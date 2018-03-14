#!/bin/bash
path=$3 #取原始路径，我的环境下如果是单文件则为 / data/demo.png, 如果是文件夹则该值为文件夹内某个文件比如 / data/a/b/c/d.jpg
downloadpath='/media/extraDisk/aria2c/downloading'
donepath='/media/extraDisk/aria2c/done'

if [$2 -eq 0]
        then
                exit 0
fi
while true; do  # 提取下载文件根路径，如把 / data/a/b/c/d.jpg 变成 / data/a
filepath=$path
path=${path%/*}; 
if ["$path" = "$downloadpath"] && [ $2 -eq 1 ]  # 如果下载的是单个文件
    then
    mv "$filepath" "$donepath"      
    exit 0
elif ["$path" = "$downloadpath"]   # 文件夹
    then
    mv "$filepath"/ "$donepath"/"${filepath##*/}"/
    exit 0
fi
done
