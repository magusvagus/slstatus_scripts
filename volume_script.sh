#!/bin/bash

## /bin/sh -c "amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1"

vol="$(/bin/sh -c "amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1")"

mute="$(amixer get Master | tail -n 1 | awk '{print $6}' | tr -d '[]')"

yellow5="^c#b68642^"
yellow4="^c#b27f42^" # yellow
yellow3="^c#ae7843^"
yellow2="^c#a86f43^"
yellow1="^c#a56c43^"

mid="^c#a36943^" # mid

red1="^c#ac684a^"
red2="^c#b36852^"
red3="^c#bb675b^"
red4="^c#c16765^"
red5="^c#c76770^"

block="^c#a36943^" # resets the color to normal
crit="^c#924747^"
crit2="^c#800000^"
off="^c#626262^"

# this works but the if statement dosent
# (in other form, try out why)
#if [ $vol -gt 50 ]; then echo "${red2}$vol${block}"; elif [ $vol -gt 60 ]; then echo "${blue}$vol${block}"; fi


if   [[ "$mute" ==  "off" ]]; then
	echo " ${off}--${block}"

elif [[ "$vol" ==  0 ]]; then
	echo "  $vol${block}" 

elif [[ "$vol" ==  5 ]]; then
	echo "  $vol${block}" 

elif [[ "$vol" == 10 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 15 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 20 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 25 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 30 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 35 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 40 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 45 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 50 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 55 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 60 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 65 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 70 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 75 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 80 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 85 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 90 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 95 ]]; then
	echo " $vol${block}" 

elif [[ "$vol" == 100 ]]; then
	echo " 99${block}" 
else
	echo " ${crit2}$vol${block}" # warning message
fi



