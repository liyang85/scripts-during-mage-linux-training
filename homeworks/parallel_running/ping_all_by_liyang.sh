#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		ping_all_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-24
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# method 1
./ping_baidu_by_liyang.sh &
./ping_qq_by_liyang.sh &
./ping_taobao_by_liyang.sh &
wait
