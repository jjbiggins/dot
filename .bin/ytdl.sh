#!/bin/bash

youtube_url=$1
media_dir="/Users/jjbiggins/Movies/TV/Media.localized/Automatically\ Add\ to\ TV.localized/%(title)s.%(ext)s"

cmd=`youtube-dl -o "$media_dir" "$1"`
$cmd &



