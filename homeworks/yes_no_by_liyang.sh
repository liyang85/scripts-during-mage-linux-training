#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		yes_no_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-19
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

read -p "Linux is wonderful, do you agree? [yes/no] -> " answer

case "${answer}" in
	[Yy]|[Yy][Ee][Ss])
		echo "You entered ${answer}." ;;
	[Nn]|[Nn][Oo])
		echo "You entered ${answer}." ;;
	*)
		echo "Do you know Linux?" ;;
esac
