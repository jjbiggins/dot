#!/bin/bash

pass=`cat ~/.personal/pass | grep local | cut -d $'\t' -f 2-`

sudo port installed | grep -v active | while read line;
do
    macport=`echo "$line" | sed 's/ //g'`
    echo "$macport"
    
	echo "$pass" | sudo port uninstall "$macport" &
    BACK_PID=$!
    wait $BACK_PID
done

echo "$pass" | sudo -S port -v selfupdate &
BACK_PID=$!
wait $BACK_PID

echo "$pass" | sudo -S port upgrade outdated &
BACK_PID=$!
wait $BACK_PID

