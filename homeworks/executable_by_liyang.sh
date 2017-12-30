#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		executable_by_19_liyang.sh
# Revision:		1.0
# Date:			2017-11-28
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

read -p "Please give a file name --> " fn

regex="\.sh$"

if [ -s "$fn" ] && [[ "$fn" =~ $regex ]]; then
	chmod a+x "$fn"
	echo "$fn has been added executable permission."
else
	echo -e "$fn is not a shell script (without .sh extension) OR it is an empty file."
fi
