#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		pass_input_to_while_loop.sh
# Revision:		1.0
# Date:			2017-12-22
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

diskUsedLevel=8

# via Pipe
echo
echo "via Pipe:"
df | grep "/dev/sd" | while read partition total used free percent mntp; do
	if [[ `echo "${percent}" | sed -r 's/^([0-9]+)%$/\1/'` -gt "${diskUsedLevel}" ]]; then
		echo "${partition} used ${percent}, which more than ${diskUsedLevel}%"
	fi
done

# via Process Substitute
echo
echo "via Process Substitute:"
while read partition total used free percent mntp; do
	if [[ `echo "${percent}" | sed -r 's/^([0-9]+)%$/\1/'` -gt "${diskUsedLevel}" ]]; then
		echo "${partition} used ${percent}, which more than ${diskUsedLevel}%"
	fi
done < <(df | grep "/dev/sd")

