#!/bin/bash

option=$1

if [[ "$option" == '-a' || "$option" == "-all" ]]; then
    for file in *.*
    do
        remove_colon_comma_and_other_bullshit=`echo "$file" | tr -d ':;,-'`
        new_name=`echo "$file" | tr ' ' '_'`
    done
elif [[ -f "$option" ]]; then
    file="$option"
    remove_colon_comma_and_other_bullshit=`echo "$file" | tr -d ':;,-'`
    new_name=`echo "$remove_colon_comma_and_other_bullshit" | tr ' ' '_'`
    mv "$file" "$new_name"
fi
