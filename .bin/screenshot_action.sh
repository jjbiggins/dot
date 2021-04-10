#!/bin/bash


pictures=/Users/jjbiggins/Pictures
screenshots="$pictures/Screenshots"

screenshot_prefix="Screen Shot"
today=`date +"%Y-%m-%d"`
screenshot="$screenshot_prefix $today"

cd "$pictures"
file=`echo "$screenshot"*`

if [ -d "$screenshots/ar_${today}" ]; then
    mv "$file" "$screenshots/ar_${today}/$file"
fi

if [ ! -d "$screenshots/ar_${today}" ]; then
    mkdir "$screenshots/ar_${today}"
    mv "$file" "$screenshots/ar_${today}/$file"
fi

