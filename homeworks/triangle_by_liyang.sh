#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		triangle_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-25
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

read -p "Please give height of the triangle: " height

[[ "$height" =~ ^[0-9]+$ ]] || { echo "Please input positive integer." && exit 2; }

for (( i = 1; i <= height; i++ )); do
	# print spaces
	spaceQty=$[${height}-${i}]
	for (( k = 1; k <= ${spaceQty}; k++ )); do
		echo -n " "
	done

	# print asterisks
	asteriskQty=$[$i*2-1]
	for (( j = 1; j <= ${asteriskQty}; j++ )); do
		echo -n "*"
	done
	echo
done
