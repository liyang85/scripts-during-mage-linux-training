#!/bin/bash
# vim: set ft=sh.expect: 
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		auto_ssh_print_os_version_by_liyang.sh
# Revision:		1.0
# Date:			2018-01-06
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

host="$1"
user="$2"
passwd="$3"

[ $# -lt 3 ] && echo "Usage: `basename $0` host user passwd" \
	&& exit 1

expect <<- EOF
	set timeout 10
	spawn ssh ${user}@${host}
	expect {
		"yes/no" {send "yes\n"; exp_continue}
		"password" {send "$passwd\n"}
	}
	expect "$ " {send "cat /etc/centos-release\n"}
	expect "$ " {send "uname -r\n"}
	expect "$ " {send "exit\n"}
	expect eof
	# interact	; # the `interact` command can't run in here,
			# because it is in a here-doc,
			# when the second EOF appears, 
			# whole here-doc will be terminated.
EOF

