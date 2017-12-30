#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		create_yum_repo_by_liyang.sh
# Revision:		1.0
# Date:			2017-11-29
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

repoPath="/etc/yum.repos.d/"
repoFileRegex="^[.[:alnum:]_-]+\.repo$"
disableRepoRegex="^(yes|no)$"

if [ `id -u` -eq 0 ]; then
	read -p "Would you like to disable all exist repoes under ${repoPath}? [yes/no] " disableExistRepoes
	if [[ ${disableExistRepoes} =~ $disableRepoRegex ]]; then
		if [ ${disableExistRepoes} = "yes" ]; then
			cd "${repoPath}"
			repoNum=$(find . -maxdepth 1 -type f -iname "*.repo" | wc -l)
			if [ "${repoNum}" -gt 0 ]; then
				for i in *.repo; do
					mv -v $i ${i}.bak
				done
				echo "All *.repo files has been renamed to *.repo.bak"
			else
				echo "There is no exist *.repo file."
			fi
		else
			:
		fi
	else
		echo "Your input is invalid. Nothing has been done."
	fi

	echo
	read -p "Please input a repo name (need .repo extension): " repoFile
	if [[ ${repoFile} =~ $repoFileRegex ]]; then
		repoName=`echo ${repoFile} | sed -nr 's/(.+)\.repo$/\1/p'`

		# `<<-` will IGNORE all indent (blank) at the beginning of lines,
		# `<<` reserves all blank, and cause a syntax error to the script.
		# if use `<<` instead of `<<-`, the here-document part must NOT be indented!

		# `\011` is an octal, which implies a <tab> character, 
		# and do NOT be ignored by `<<-`
		tab=$'\011'
		
		# `${repoName//_/-}`: substitute all underscores (_) with dashes (-)
		# `${repoName//[-_]/ }`: substitute all underscores and dashes with space
		cat > "${repoPath}${repoFile}" <<- EOF
		[${repoName//_/-}]
		name=${repoName//[-_]/ }
		baseurl=file:///var/ftp/pub/centos/\$releasever/os/\$basearch
			${tab}ftp://172.18.19.7/pub/centos/\$releasever/os/\$basearch
		gpgcheck=0
		failovermethod=priority
		EOF

		echo -e "\033[32m${repoFile} has been created.\033[0m\n"
		yum repolist
	else
		echo "${repoFile} is an invalid file name."
		exit 2
	fi
else
	echo "Only root user can run this script."
	exit 1
fi
