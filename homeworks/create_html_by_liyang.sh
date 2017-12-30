#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		create_html_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-25
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

mkdir /tmp/testdir

for (( i = 1; i <= 10; i++ )); do
	rand=`openssl rand -base64 40 | tr -dc "[[:alpha:]]" | head -c8`
	touch /tmp/testdir/${i}${rand}.html
done
