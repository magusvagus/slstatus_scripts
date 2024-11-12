temp="$(sensors | awk '/Core 0/ {print $3 } ' | tr -d \"+°C\")"
temp=${temp%.*}

yellow="^c#b27e3e^"
red="^c#924747^"
block="^c#a36943^"
debug="^c#ffffff^"

if [[ $temp -lt 30 ]]; then
	echo "${yellow} $temp${block}"
elif [[ $temp -ge 80 ]]; then
	echo "${red} $temp${block}"
else
	echo " $temp"
fi
