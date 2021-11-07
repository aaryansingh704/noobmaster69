#!/bin/bash
s=$(upower -i $(upower -e | grep BAT) | grep "percentage")
chargestate=$(upower -i $(upower -e | grep BAT) | grep "state")
finalchargestate=${chargestate:11}
finals=${s: -3}
echo $finalchargestate
state1="state: charging"
state0="state: discharging"

finalss=${finals: 0 : 2} 

if [[ $((finalss)) -le 100 ]]
then
	echo "need to go to powersave"
fi
if [[ $((finalss)) -ge 99 ]]
then 
if [[ "$finalchargestate" == "$state0" ]]
then	
	echo "need to go to conservative"
fi
fi
if [[ "$finalchargestate" == "$state1" ]];then
 	echo "performance"
fi
echo $finalss
