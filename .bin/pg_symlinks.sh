#!/bin/bash
cd /opt/local/lib/postgresql96/bin
for x in *
do
    ln -s "$PWD/$x"  "/usr/local/bin/$x"
done
