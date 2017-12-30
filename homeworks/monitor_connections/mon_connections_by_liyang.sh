#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		mon_connections_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-20
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

file="connection.txt"
delay=3

while sleep $delay; do
	ss -nt | grep ESTAB | tr -s " " ":" | cut -d':' -f6 | sort | uniq -c > "${file}"

	while read num ip; do
		if [[ $num -gt 3 ]]; then
			iptables -A INPUT -s "$ip" -j REJECT
			echo "$ip has been banned."
		fi
	done < "$file"
done
