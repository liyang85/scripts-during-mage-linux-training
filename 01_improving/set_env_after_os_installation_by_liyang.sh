#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		set_env_after_os_installation_by_liyang.sh
# Description:
# Date:			2018-01-07
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# sshd
modSshd() {
	sshdCfg="/etc/ssh/sshd_config"
	if [[ -f "${sshdCfg}.bak" ]]; then
		opt="-i"
	else
		opt="-i.bak"
	fi
	# Do NOT use `-n` here, or the result will remain modified lines!
	# If a line was commented, then append one;
	# If a line was not commented, then substitute it.
	# Sometimes, settings are different between CentOS 6 and 7.
	sed ${opt} -r \
		-e '/#UseDNS/a UseDNS no' \
		-e 's/(GSSAPIAuthentication )yes/\1no/' \
		${sshdCfg}
	echo "${sshdCfg} modified, original file had been saved in ${sshdCfg}.bak"
}

modSshd
