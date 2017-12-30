#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		guess_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-22
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

sys=`echo $[RANDOM%11]`

while true; do
	read -p "Guess a number [0-10]: " num
	if [[ $num -gt $sys ]]; then
		echo "$num is greater, go on ..."
	elif [[ $num -lt $sys ]]; then
		echo "$num is less, go on ..."
	else
		echo "Congratulations. The number is ${sys}"
		break
	fi
done
