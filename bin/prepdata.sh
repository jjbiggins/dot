#!/bin/bash
echo "Script Name: $0"
echo "CSV file: $1"
input_path="/test/data/jbiggins/input/"
data_path="/test/data/jbiggins/data/input.raw"
csvfile=${input_path}${1}
if [ -f $csvfile ]; then
	cp ${csvfile} ${data_path}
	sed -i '/^$/d' ${data_path}	
	vim ${data_path}
fi
