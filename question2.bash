#!/bin/bash
s=s=$(cat /sys/class/power_supply/BAT0/capacity)
chargestate=$(cat /sys/class/power_supply/BAT0/status)
state1="Charging"
state0="Discharging"
if [[ $((s)) -le 30 ]]
then
	echo powersave | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
else
	if [[ $((s)) -eq 100 ]]
	then 
		if [[ "$chargestate" == "$state0" ]]
			then	
			echo conservative | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
		fi
	fi
	if [[ "$chargestate" == "$state1" ]];then
 	echo performance | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	fi
fi
