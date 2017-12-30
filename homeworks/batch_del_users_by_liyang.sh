#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		batch_del_users_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-18
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

for i in {1..100}; do
	userdel -r "user${i}" && echo "user${i} deleted."
done
