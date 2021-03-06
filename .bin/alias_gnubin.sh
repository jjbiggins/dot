#!/bin/bash

gnubin_libexec=/opt/local/libexec/gnubin
gnubin_bin=/opt/local/bin

cd $gnubin_libexec
for x in *
do
    gbin=$gnubin_bin/g$x
    if [[ -f $gbin ]]; then
        galias="alias "$x"=\""$gbin"\""
        echo $galias >> ~/.aliases
    fi
done


