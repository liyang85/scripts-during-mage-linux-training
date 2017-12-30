#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		ping_hosts_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-26
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

netRe="^(([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])$"
read -p "Please specify a network (prefix=24, can't be changed): " net

[[ "${net}" =~ $netRe ]] || { echo "${net} is an invalid IP, try again." && exit 2; }

netid=`echo "${net}" | cut -d'.' -f1-3`

for i in `seq 254`; do
	{
	addr="${netid}.${i}"
	ping -c1 -w1 "${addr}" &>/dev/null
	if [[ $? -eq 0 ]]; then
		echo -e "\033[32m${addr}\tUP\033[0m"
	else
		echo -e "${addr}\tDOWN"
	fi
	}&
done
wait
