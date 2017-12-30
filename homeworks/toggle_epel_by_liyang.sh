#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====
# Filename:		toggle_epel_by_19_liyang.sh
# Revision:		1.0
# Date:			2017-11-30
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====

reposD="/etc/yum.repos.d/"
epelRepo=$(find "${reposD}" -maxdepth 1 -type f -iname "*epel*")
ext=$(echo "${epelRepo}" | sed -nr 's/.*\.(.+)$/\1/p')
epelOn="${reposD}epel.repo"
epelOff="${reposD}epel.repo.bak"

case "${ext}" in
repo)
	mv -v "${epelRepo}" "${epelOff}" && echo -e "\033[31mEPEL repo has been disabled.\033[0m"
	;;
bak)
	mv -v "${epelRepo}" "${epelOn}" && echo -e "\033[32mEPEL repo has been enabled.\033[0m"
	;;
*)
	echo "There is no match file to be renamed (backup)." >&2
	;;
esac

echo
yum repolist
