#!/bin/bash

char=#
marginleft='\e[5C['
cols=`tput cols`

barlen=`printf "$char" | wc -m`
#marginslen=`printf "$marginleft" | wc -m | xargs -n 1 bash -c 'echo "($1 * 2)" | bc' args`
#avaiable_barlen=`echo "($cols - $marginslen)" | bc`

spacelen=`echo "($cols - ($barlen + 12))" | bc`
bar="\033[5C[${char}"

percent_increments=`bc <<< "scale=2; 100.00/${spacelen}"`
percent="$percent_increments"
percent_display="\033[5C${percent}"


while [[ "$spacelen" -gt 0 ]]
do

	echo -e "\033[2A\033[K${bar}"
        echo ""
	echo -e "\033[1A\033[K${percent_display}"

        # --------------------------------------------------
        # LOGIC TO CONTROL BAR
        # --------------------------------------------------
	char="${char}#"
	barlen=`printf "$char" | wc -m`
	barlen=`echo "($barlen + 1)" | bc`
	spacelen=`echo "($cols - ($barlen + 12))" | bc`
	bar="\033[5C[${char}\033[${spacelen}C]"
	
        # ---------------------------------------------------
        # PERCENT CALCULATOR
        # ---------------------------------------------------
        if [[ "$spacelen" == 1 ]]; then
		percent=100.00
		percent_display="\033[5C${percent}"
	else
		percent=`bc<<<${percent}+${percent_increments}`
		percent_display="\033[5C${percent}"
	fi

	sleep 0.005
done
