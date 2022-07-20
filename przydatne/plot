#!/bin/bash 

# Log temperature over some time  interval given as days, hours, minutes or seconds.
# enter the variables according to your usage in the following seciton :
duration="$1"  #duration format is  ndnhnmns where n is some number and d is day,
# h is hours, m is minutes and s is seconds. For example, 4d , 4d5h30m , 5m30s, 6h30m30s are all valid.

# Based on https://askubuntu.com/questions/96957/where-can-i-find-the-log-file-of-my-system-temperature

step="$2"

echo "Plot CPU Temps:";
echo "";

#----------------------------------------------------------------------
#starting time taken as current
dt=$(date '+%Y-%m-%dT%H:%M:%S');
#et=$(date '+%Y-%m-%dT%H:%M:%S');

#----------------------------------------------------------------------
a=$(dateadd $dt  $duration )
b=$(datediff $dt $a -f '%S')
echo $a $b

ntimes=$((b/step))
echo $ntimes


echo "logging...";
rm plot_cpu_t_log.txt
nms=0
while [  $nms -lt $ntimes ];  do
        sensors | grep -A 0  'Core' | cut -c17-18 |tr "\n" "\t" >> plot_cpu_temp.txt
        let nms=nms+1
        sleep  $step
        now=$(date +"%d/%m/%Y %T")
#       echo $now
        echo -e "$(cat plot_cpu_temp.txt)""\t$now"  >> plot_cpu_t_log.txt
        rm plot_cpu_temp.txt
done

if [ ! -d "plot-images" ]; then
  mkdir plot-images
fi

#plotting using gnuplot to get a beautiful plot. 
day=86400 #different x-axis for different  time duration. A day = 86400 seconds

fcode=$(date "+%Y-%m-%d_%H%M%S") # generate a time stamp 
#echo $fcode
if [[ "$b" > "$day" ]]
then
        gnuplot -e "filename='plot-images/plot_cpu_$fcode'" plot_day_cpu
else
        gnuplot -e "filename='plot-images/plot_cpu_$fcode'" plot_time_cpu
fi

#end-of-script---------------------------------------------------------
