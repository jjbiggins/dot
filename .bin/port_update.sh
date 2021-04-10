#!/bin/bash

password=`cat ~/.personal/pass | tr $'\t' ' ' | cut -d ' ' -f 2`
echo "$password"

echo "$password" | sudo -S port -v selfupdate &
wait $BACK_PID

echo ""
echo "========================================================="
echo " Now run port upgrade outdated "
echo "========================================================="
echo ""

echo "$password" | sudo -S port upgrade outdated &
wait $BACK_PID
