#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		calc_average_by_sex_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-30
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

awk '{sex[$3]++;score[$3]+=$2}\
END{for(i in sex){printf "%s\t%.2f\n",i,score[i]/sex[i]}}' score2.txt
