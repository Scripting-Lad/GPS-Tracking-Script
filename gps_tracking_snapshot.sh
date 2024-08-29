#!/bin/bash
clear

date
echo " "

coor=$(gpspipe -w -n 10 | grep -m 1 TPV | jq -r '[.lat, .lon] | @csv')
echo Coordinates: $coor
echo " "

alt=$(gpspipe -w -n 10 | grep -m 1 TPV | jq -r '[.altHAE] | @csv')
echo Altitude\(M\): $alt
echo " "

echo Current IIR GPS-Lockheed Satellites in View:
for sv in $(gpspipe -w -n 12 |  grep -oP '\{"PRN":.*?\}' |  grep -oP '\{"PRN":\b(13|28|21|11|20|18|16|19|2)\b.*?\}'| sort -u -t, -k1,1 | awk -F, '{print $1}' | sed 's/{"PRN"://' )
do
	if [ $sv -eq 13 ]
	then
		echo SV43
	fi

	if [ $sv == 28 ]
	then
		echo SV44
	fi

	if [ $sv == 21 ]
	then
		echo SV45
	fi

	if [ $sv == 11 ]
	then
		echo SV46
	fi

	if [ $sv == 20 ]
	then
		echo SV51
	fi

	if [ $sv == 18 ]
	then
		echo SV54
	fi

	if [ $sv == 16 ]
	then
		echo SV56
	fi

	if [ $sv == 19 ]
	then
		echo SV59
	fi

	if [ $sv == 2 ]
	then
		echo SV61
	fi
done
echo " "


echo Current IIRM GPS-Lockheed Satellites in View:
for sv in $(gpspipe -w -n 12 |  grep -oP '\{"PRN":.*?\}' |  grep -oP '\{"PRN":\b(7|1|5|31|17|15|29|12)\b.*?\}'| sort -u -t, -k1,1 | awk -F, '{print $1}' | sed 's/{"PRN"://' )
do
	if [ $sv -eq 7 ]
	then
		echo SV48
	fi

	if [ $sv == 1 ]
	then
		echo SV49
	fi

	if [ $sv == 5 ]
	then
		echo SV50
	fi

	if [ $sv == 31 ]
	then
		echo SV52
	fi

	if [ $sv == 17 ]
	then
		echo SV53
	fi

	if [ $sv == 15 ]
	then
		echo SV55
	fi

	if [ $sv == 29 ]
	then
		echo SV57
	fi

	if [ $sv == 12 ]
	then
		echo SV58
	fi
done
echo " "


echo Current IIF GPS-Boeing Satellites in View:
for sv in $(gpspipe -w -n 12 |  grep -oP '\{"PRN":.*?\}' |  grep -oP '\{"PRN":\b(1|3|6|8|9|10|24|25|26|27|30|32)\b.*?\}'| sort -u -t, -k1,1 | awk -F, '{print $1}' | sed 's/{"PRN"://' )
do
	if [ $sv -eq 25 ]
	then
		echo SV62
	fi

	if [ $sv == 1 ]
	then
		echo SV63
	fi

	if [ $sv == 30 ]
	then
		echo SV64
	fi

	if [ $sv == 24 ]
	then
		echo SV65
	fi

	if [ $sv == 27 ]
	then
		echo SV66
	fi

	if [ $sv == 6 ]
	then
		echo SV67
	fi

	if [ $sv == 9 ]
	then
		echo SV68
	fi

	if [ $sv == 3 ]
	then
		echo SV69
	fi

	if [ $sv == 32 ]
	then
		echo SV70
	fi

	if [ $sv == 26 ]
	then
		echo SV71
	fi

	if [ $sv == 8 ]
	then
		echo SV72
	fi

	if [ $sv == 10 ]
	then
		echo SV73
	fi
done
echo " "


echo Current III GPS-Lockheed Satellites in View:
for sv in $(gpspipe -w -n 12 |  grep -oP '\{"PRN":.*?\}' |  grep -oP '\{"PRN":\b(4|18|23|14|11|28)\b.*?\}'| sort -u -t, -k1,1 | awk -F, '{print $1}' | sed 's/{"PRN"://' )
do
	if [ $sv -eq 4 ]
	then
		echo SV74
	fi

	if [ $sv == 18 ]
	then
		echo SV75
	fi

	if [ $sv == 23 ]
	then
		echo SV76
	fi

	if [ $sv == 14 ]
	then
		echo SV77
	fi

	if [ $sv == 11 ]
	then
		echo SV78
	fi

	if [ $sv == 28 ]
	then
		echo SV79
	fi
done

echo " "
