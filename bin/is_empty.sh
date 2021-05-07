#!/bin/bash

failed_runs="/u5/bold/bold_vh0_2/ar_"
for ar in $failed_runs*
do

	#diffs=`diff $ar/input_increase.raw data/input_increase.raw`
	#echo 
	echo
	#echo $ar
	#echo $diffs
	increase="increase letters list 12.18.2020 b.csv"
	control=`echo "$increase" | cut -c 23-34`
	increase_file="$ar"/"$increase"
	date_b=`echo "$increase_file" | cut -c 23-34`

	echo $increase_file
	
done
