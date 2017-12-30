#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		batch_create_user_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-18
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

userfile="./users.txt"
user_pw_file="./user_pw.txt"

> "$userfile"
> "$user_pw_file"

for i in {1..10}; do
	username=`echo "user${i}"`
	password=`openssl rand -base64 20 | head -c 8`

	useradd "${username}" && echo "Created new user ${username}."
	echo "${username}:${password}" >> ${user_pw_file}
done

cat "${user_pw_file}" | chpasswd
