#!/bin/bash

for i in ./*.py ; do
	zip -r "${i%/}.zip" "$i"
done

