#!/bin/bash
# in linux: chmod +x xx.sh; vi xx.sh; :set ff=unix;
# https://www.cnblogs.com/kings-9/p/7642641.html
# https://blog.csdn.net/seulzz/article/details/86512843
function getdir(){
    for element in `ls $1`
    do
        dir_or_file=$1"/"$element
        if [ -d $dir_or_file ]
        then
            getdir $dir_or_file
        else
            ori_file=$dir_or_file
            if [ "{ori_file##*.}"x = "wav"x ]; then
                new_file=$2 "${ori_file#*$1}"
                echo $ori_file
                echo $new_file
                cp $ori_file $new_file
            fi
        fi
    done
}
source_dir="./source"
target_dir="./target"
getdir $source $target