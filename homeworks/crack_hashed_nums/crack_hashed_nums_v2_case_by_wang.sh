#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		crack_hashed_nums_v2_case_by_wang.sh
# Revision:		1.0
# Date:			2017-12-20
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

str1="efbaf275cd"
str2="4be9c40b8b"
str3="44b2395c46"
str4="f8c8873ce0"
str5="b902c16c8b"
str6="ad865d2f63"

i=0
while [ $i -le 32767 ]; do
	rand=`echo $i | md5sum | cut -c1-10`
	case $rand in
		$str1 )
			echo -e "$i: \t ${str1}"
			;;
		$str2 )
			echo -e "$i: \t ${str2}"
			;;
		$str3 )
			echo -e "$i: \t ${str3}"
			;;
		$str4 )
			echo -e "$i: \t ${str4}"
			;;
		$str5 )
			echo -e "$i: \t ${str5}"
			;;
		$str6 )
			echo -e "$i: \t ${str6}"
			;;
	esac
	let i++
done
