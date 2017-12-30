#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		my_functions_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-22
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

os (){
	file="/etc/centos-release"
	ver=`sed -r 's/.* ([0-9]+)\..*/\1/' "${file}"`
	if [[ $ver -eq 6 ]]; then
		echo "Version number is 6."
	fi
	if [[ $ver -eq 7 ]]; then
		echo "Version number is 7."
	fi
}
