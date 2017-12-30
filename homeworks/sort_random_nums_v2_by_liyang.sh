#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		sort_random_nums_v2_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-21
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

max=0
min=0

for (( i = 0; i < 10; i++ )); do
	num="$RANDOM"
	echo "${num}"

	if [[ $i -eq 0 ]]; then
		max="${num}"
		min="${num}"
	fi

	if [[ ${num} -gt ${max} ]]; then
		max=${num}
		# echo "max = ${max}"
	fi

	if [[ ${num} -lt ${min} ]]; then
		min=${num}
		# echo "min = ${min}"
	fi
done

echo
echo "The maximum number is ${max}"
echo "The minimal number is ${min}"
