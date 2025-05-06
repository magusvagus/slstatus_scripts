#!/bin/bash

vol="$(/bin/sh -c "amixer get Master | tail -n1 | grep -Po '\\[\\K[^%]*' | head -n1")"

mute="$(amixer get Master | tail -n 1 | awk '{print $6}' | tr -d '[]')"

block="^c#a36943^" # resets the color to normal
crit2="^c#800000^"
off="^c#626262^"

# Horrible, yes. But if -gt/ "<" is used the script dosent work,
# right. Workaround needs to be found (AKA: rewriting this in C99)

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



