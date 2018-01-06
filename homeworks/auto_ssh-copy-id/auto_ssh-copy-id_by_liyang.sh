#!/bin/bash
# vim: set ft=sh.expect:
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		auto_ssh-copy-id_by_liyang.sh
# Revision:		1.0
# Date:			2018-01-06
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

hostList="./host_list.txt"
defaultKey="${HOME}/.ssh/id_rsa.pub"

read -p "Specify path of the ssh public key, enter Y to choose default (${defaultKey}): " key

if [[ "$key" =~ ^[Yy]$ ]]; then
	key=$defaultKey
fi

if [[ ! -f "$key" ]]; then
	echo "${key} is not exist or is not a regular file."
	exit 1
fi

which expect &>/dev/null \
	|| { echo "Installing expect"; yum -y install expect >/dev/null; }

while read ip user passwd; do
	echo 
	ping -nc1 -W1 "${ip}" >/dev/null || { echo "${ip} is down" && continue; }
	expect <<- EOF
		spawn ssh-copy-id -i "${key}" ${user}@${ip}
		expect {
			"yes/no" {send "yes\n"; exp_continue}
			"password" {send "$passwd\n"}
		}
		expect eof
	EOF
	echo -e "\n=================================================="
done < ${hostList}

echo -e "\nCopy finished, remember to delete PASSWORDs in ${hostList}!"

