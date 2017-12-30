#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		scp_ssh_config_to_multiple_hosts.sh
# Revision:		1.0
# Date:			2017-12-12
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# must use `${HOME}` to ensure it can be expanded
sshCfg="${HOME}/.ssh/config"
# use `~` to ensure it will not be expanded
remoteSshDir="~/.ssh"

declare userName

read -p 'Copy to which user on the host? [Default is root, enter Y to select] -> '
if [[ ${REPLY} =~ ^[Yy]$ ]]; then
	userName=root
else
	userName="$REPLY"
fi

read -p "Copy to which host? [Allow multiple hosts, use SPACE to separate] -> "
for host in $REPLY; do
	scp "${sshCfg}" "${userName}@${host}:${remoteSshDir}"
done
