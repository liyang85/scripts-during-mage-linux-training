#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		9x9_table_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-24
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

for (( i = 1; i < 10; i++ )); do
	for (( j = 1; j <= $i; j++ )); do
		echo -ne "${j} x ${i} = $[$j*$i]\t"
	done
	echo
done
