#!/bin/bash
#===== ===== ===== ===== ===== ===== 
# Filename:	rabbit_rooster.sh
# Revision:	1.0
# Author:	Li Yang
# Website:	https://liyang85.com
# Date:		2017-11-24
# Description:
#===== ===== ===== ===== ===== ===== 

read -p "Please input head numbers: " head
read -p "Please input foot numbers: " feet

rabbit=$[(${feet}-2*${head})/2]
rooster=$[head-rabbit]

echo -e "Number of rabbit: \t${rabbit}"
echo -e "Number of rooster: \t${rooster}"
