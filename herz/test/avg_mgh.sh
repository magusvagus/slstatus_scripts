cpu0="$(lscpu -e=MHZ | head -n 2 | tail -n 1)"
cpu1="$(lscpu -e=MHZ | head -n 3 | tail -n 1)"
cpu2="$(lscpu -e=MHZ | head -n 4 | tail -n 1)"
cpu3="$(lscpu -e=MHZ | head -n 5 | tail -n 1)"
cpu4="$(lscpu -e=MHZ | head -n 6 | tail -n 1)"
cpu5="$(lscpu -e=MHZ | head -n 7 | tail -n 1)"
cpu6="$(lscpu -e=MHZ | head -n 8 | tail -n 1)"
cpu7="$(lscpu -e=MHZ | head -n 9 | tail -n 1)"
cpu8="$(lscpu -e=MHZ | head -n 10 | tail -n 1)"
cpu9="$(lscpu -e=MHZ | head -n 11 | tail -n 1)"
cpu10="$(lscpu -e=MHZ | head -n 12 | tail -n 1)"
cpu11="$(lscpu -e=MHZ | head -n 13 | tail -n 1)"

cpu0=${cpu0%.*}
cpu1=${cpu1%.*}
cpu2=${cpu2%.*}
cpu3=${cpu3%.*}
cpu4=${cpu4%.*}
cpu5=${cpu5%.*}
cpu6=${cpu6%.*}
cpu7=${cpu7%.*}
cpu8=${cpu8%.*}
cpu9=${cpu9%.*}
cpu10=${cpu10%.*}
cpu11=${cpu11%.*}

cpu_avg="$(( (cpu0+cpu1+cpu2+cpu3+cpu4+cpu5+cpu6+cpu7+cpu8+cpu9+cpu10+cpu11)/12 ))"

cpu_avg="$(python -c 'print(${cpu_avg}/1000.0)')"

echo "$cpu_avg"

