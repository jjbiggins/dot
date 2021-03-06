#!/bin/bash

pass=`cat ~/.personal/pass | grep local | cut -d $'\t' -f 2-`

echo "$pass" | sudo -S port install postgresql96-server postgresql96 &
BACK_PID=$!

#while kill -0 $BACK_PID; do
#    echo "Process is still active...."
#    sleep 1
#done


# wait till process finishes
echo "Process is still active ................."
wait $BACK_PID

echo "port install FINISHED"
echo "Postgresql96-server and postgresql96 have install successfully."

if [[ -d "/opt/local/lib/postgresql96/bin" ]]; then
    cd /opt/local/lib/postgresql96/bin
else
    echo "Directory /opt/local/lib/postgresql96/bin does not exist."
    echo "exiting program now"
    exit
fi


echo "$pass" | sudo -S mkdir -p /var/db/postgresql96/defaultdb &
echo "Process is still active ......................"
wait $BACK_PID

echo "$pass" | sudo -S chown postgres:postgres /var/db/postgresql96/ &
BACK_PID=$!
echo "Process is still active ......................"
wait $BACK_PID

echo "$pass" | sudo -S chown postgres:postgres /var/db/postgresql96/defaultdb &
BACK_PID=$!
echo "Process is still active ......................"
wait $BACK_PID

for x in *
do
    if [[ -f "/usr/local/bin/$x" ]]; then
        echo "/usr/local/bin/$x already exists"
        echo "We should exit because this is unexpected, and may cause issues"
        exit
    else
        ln -s "$PWD/$x"  "/usr/local/bin/$x"
    fi
done

sudo su postgres -c 'cd /var/db/postgresql96 && initdb -D initdb -D /var/db/postgresql96/defaultdb' &
BACK_PID=$!
echo "Process is still active ......................"
wait $BACK_PID

echo "$pass" |  sudo port load postgresql96-server &
BACK_PID=$!
echo "Process is still active ......................"
wait $BACK_PID

sudo -u postgres -i bash -c "pg_ctl -D /var/db/postgresql96/defaultdb -l logfile start"
sudo -u postgres -i bash -c "createuser chuckjones"
sudo -u postgres -i bash -c "psql -U postgres -c 'create database masterdb owner chuckjones;'"
printf '\n'
echo "===================================================================================\n"
echo "Program completed successfully\n"
echo "===================================================================================\n"
exit
