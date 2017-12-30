#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		ipforward_on_selinux_iptables_off_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-13
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

uid=`id -u`

if [[ $uid -eq 0 ]]; then
	# Part 1: enable IP-forward
	ipFwd="/proc/sys/net/ipv4/ip_forward"
	echo 1 > /proc/sys/net/ipv4/ip_forward \
		&& echo "IP-forward has been enabled."
	
	# Part 2: disable SELinux
	seCfg="/etc/selinux/config"
	tellSeS="SELinux has been disabled."
	if [[ `getenforce` == "Enforcing" ]]; then
		setenforce 0 \
			&& sed -i.bak -r 's/(SELINUX=)enforcing/\1disabled/' $seCfg \
			&& echo "${tellSeS}"
	fi

	# Part 3: disable iptables
	tellIptS='iptables/firewalld has been disabled.'
	os=`sed -nr 's/.* ([0-9]+)\..*/\1/p' /etc/centos-release`
	if [ ${os} -eq 7 ]; then
		iptables -F
		systemctl stop firewalld \
			&& systemctl disable firewalld \
			&& echo "${tellIptS}"
	fi
	if [ ${os} -eq 6 ]; then
		iptables -F \
			&& service iptables save \
			&& service iptables stop \
			&& echo "${tellIptS}"
		chkconfig iptables off
	fi
else
	echo "Only root user can run this script."
fi
