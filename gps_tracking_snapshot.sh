#!/bin/bash
clear

date
echo " "

coor=$(gpspipe -w -n 10 | grep -m 1 TPV | jq -r '[.lat, .lon] | @csv')
echo Coordinates: $coor
echo " "

alt=$(gpspipe -w -n 10 | grep -m 2 TPV | jq -r '[.altHAE] | @csv')
echo Altitude\(M\): $alt
echo " "


declare -rA SV_Array=(
["13"]="SV43-IIR-Lockheed"
["22"]="SV44-IIR-Lockheed"
["21"]="SV45-IIR-Lockheed"
["11"]="SV46-IIR-Lockheed"
["20"]="SV51-IIR-Lockheed"
["18"]="SV54-IIR-Lockheed"
["16"]="SV56-IIR-Lockheed"
["19"]="SV59-IIR-Lockheed"
["2"]="SV61-IIR-Lockheed"
["7"]="SV48-IIRM-Lockheed"
["5"]="SV50-IIRM-Lockheed"
["31"]="SV52-IIRM-Lockheed"
["17"]="SV53-IIRM-Lockheed"
["15"]="SV55-IIRM-Lockheed"
["29"]="SV57-IIRM-Lockheed"
["12"]="SV58-IIRM-Lockheed"
["1"]="SV62-Boeing"
["3"]="SV63-Boeing"
["6"]="SV64-Boeing"
["8"]="SV65-Boeing"
["9"]="SV66-Boeing"
["10"]="SV67-Boeing"
["24"]="SV68-Boeing"
["25"]="SV69-Boeing"
["26"]="SV70-Boeing"
["27"]="SV71-Boeing"
["30"]="SV72-Boeing"
["32"]="SV73-Boeing"
["4"]="SV74-III-Lockheed"
["18"]="SV75-III-Lockheed"
["23"]="SV76-III-Lockheed"
["14"]="SV77-III-Lockheed"
["11"]="SV78-III-Lockheed"
["28"]="SV79-III-Lockheed"
)


echo Current GPS Satellites in View:
for sv in $(gpspipe -w -n 12 |  grep -oP '\{"PRN":.*?\}' | grep -oP '\{"PRN":\b(13|22|21|11|20|18|16|19|2|1|5|31|17|15|29|12|1|3|6|8|9|10|24|25|26|27|30|32|4|18|23|14|11|28)\b.*?\}' | sort -u -t, -k1,1 | awk -F, '{print $1}' | sed 's/{"PRN"://' )
do
	echo ${SV_Array[$sv]}
done
echo " "
