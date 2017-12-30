#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		sum_number_divide_by_3_seq.sh
# Revision:		1.0
# Date:			2017-12-18
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

sum=0

for i in {1..100}; do
	remainder=$(( i % 3 ))
	if [[ ${remainder} -eq 0 ]]; then
		echo "number can be divided by 3: $i"
		sum=$((sum+i))
	fi
done
echo "The sum of all above numbers is $sum"
