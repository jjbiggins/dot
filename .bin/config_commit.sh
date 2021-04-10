#!/bin/bash


indir="$HOME/Applications/Shell/$0/input"
datadir="$HOME/Applications/Shell/$0/data"
archivedir="$HOME/Applications/Shell/$0/archive"

echo "$indir"
timestamp=`date '+%Y-%m-%d_%H-%M-%S'`
archive="ar_${timestamp}"

logfile=$HOME/Documents/Logs/$0/process.lst

shopt -s expand_aliases


source ~/.functions
source ~/.bashrc_aliases


while read line
do
    config=`/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME add "$line"`    
    echo "$line"
    config_add=`config add "$line"`
    echo "config add $line"
done<dot


BACK_PID=$!

call /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME commit -m "commit contents of dot file run via config_commit.sh"
wait $BACK_PID

call /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME push
wait $BACK_PID

