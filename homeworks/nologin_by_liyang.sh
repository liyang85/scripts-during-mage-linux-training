#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		nologin_by_19_liyang.sh
# Revision:		1.0
# Date:			2017-11-28
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

echo "Now, regular users cannot login to this machine." | tee /etc/nologin
