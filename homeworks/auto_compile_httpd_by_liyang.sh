#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		auto_compile_httpd_by_liyang.sh
# Revision:		1.0
# Date:			2017-11-30
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

osVer=`cat /etc/centos-release | sed -nr 's/.*release ([0-9]+)\..*/\1/p'`

if [ `id -u` -eq 0 ]; then
	# install deps
	yum -y groupinstall "Development Tools"
	yum -y install apr-devel apr-util-devel openssl-devel pcre-devel lynx

	# make a dir to store source code
	srcDir="/src"
	if [ -d "${srcDir}" ]; then
		cd ${srcDir}
	else
		mkdir ${srcDir} && cd $_
	fi

	# download/compile httpd 2.2 in CentOS 6
	if [ "${osVer}" = 6 ]; then
		wget http://apache.spinellicreations.com//httpd/httpd-2.2.34.tar.bz2
		tar xf httpd-2.2.34.tar.bz2
		cd httpd-2.2.34
	fi

	# download/compile httpd 2.4 in CentOS 7
	if [ "${osVer}" = 7 ]; then
		wget http://apache.spinellicreations.com//httpd/httpd-2.4.29.tar.bz2
		tar xf httpd-2.4.29.tar.bz2
		cd httpd-2.4.29
	fi

	./configure --prefix=/app/httpd --enable-ssl --enable-proxy-fcgi
	make && make install

	# config PATH
	cfgPath="/etc/profile.d/httpd.sh"
	cat >> ${cfgPath} <<- EOF
	pHttpd="/app/httpd/bin"
	export PATH="\${pHttpd}:\$PATH"
	EOF
	source ${cfgPath}

	# start httpd then check it if running
	apachectl start
	apachectl | grep --color=auto running
	echo
	curl -I localhost | grep --color=auto -i 'ok' \
		&& echo -e '\nhttpd is running and can be accessed.\n' \
		|| echo -e '\nhttpd is not running, \033[32mmaybe you need to disable SELinux and iptables.\033[0m\n'
else
	echo "Only root user can run this script."
fi
