#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		crack_hashed_nums_v1_grep_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-20
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

randoms="
efbaf275cd
4be9c40b8b
44b2395c46
f8c8873ce0
b902c16c8b
ad865d2f63
"

crack_target="crack_target.txt"
echo $randoms | tr " " "\n" > "${crack_target}"

hashed_list="hashed_list.txt"
> "${hashed_list}"

i=0
while [ $i -le 32767 ]; do
	hash=`echo $i | md5sum | cut -c1-10`
	printf "%-10s %s\n" "$i" "$hash" >> "${hashed_list}"
	let i++
done

grep -f "${crack_target}" "${hashed_list}"
