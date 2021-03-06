#!/bin/bash

prefix=g
optbindir=/opt/local/bin
home=/Users/jjbiggins

>$home/gbin_temp.txt
cd $optbindir
for bin in g*
do
    name=$bin
    echo "$name" >> $home/gbin_temp.txt
done

sed  -e '' -e 's/^g//g' $home/gbin_temp.txt > $home/bin_temp.txt

while read line
do
    COMMAND=$line
    if ! command -v $COMMAND &> /dev/null
    then
        glias="alias "$COMMAND"=\""$optbindir/g$COMMAND"\""
        echo $glias
    fi
done <$home/bin_temp.txt


