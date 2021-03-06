#!/bin/bash
cd /opt/local/lib/postgresql96/bin
for x in *
do
    unlink  "/usr/local/bin/$x"
done
