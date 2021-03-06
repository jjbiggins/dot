#!/bin/bash

while read fb_ips
do
    sudo pfctl -t blocklist -T add "$fb_ips"

done<facebook

