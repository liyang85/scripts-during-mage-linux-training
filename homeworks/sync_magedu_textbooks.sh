#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		sync_magedu_textbooks.sh
# Revision:		1.0
# Date:			2017-12-16
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

src="/Volumes/27/slides/"
dest="${HOME}/Google 云端硬盘/magedu-linux-training-27/pdf/"
default="rsync -ahivz"

${default} --dry-run "${src}" "${dest}"

echo -e "\n===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====\n"
read -rp "The dry-run result showed above, continue to really sync them? [y/n] " -n1
echo

if [[ $REPLY = [YyNn] ]]; then
	if [[ $REPLY = [Yy] ]]; then
		${default} "${src}" "${dest}"
	else
		echo "You have to manual run rsync with different options, current are: "
		echo "${default}"
		exit 2
	fi
fi
