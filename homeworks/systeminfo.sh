#!/bin/bash -
#===============================================================================
#
#          FILE: systeminfo.sh
#
#         USAGE: ./systeminfo.sh
#
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Li Yang (ly), li.will.yang@gmail.com
#  ORGANIZATION: https://liyang85.com
#       CREATED: 11/23/2017 03:57:21 PM
#      REVISION: ---
#===============================================================================

set -o nounset                                  # Treat unset variables as an error

myHost=`hostname`
myIP=`ifconfig ens33 | grep -w "inet" | tr -s " " | cut -d" " -f3`
myOS=`cat /etc/centos-release`
myKernel=`uname -r`
myCPU=`lscpu | grep -i "model name" | tr -s " " | cut -d: -f2 | cut -c2-`
totalMem=`cat /proc/meminfo | head -n1 | tr -s " " | cut -d: -f2 | cut -c2-`
diskSize=`lsblk | grep -w "sda" | tr -s " " | cut -d" " -f4`

cat <<_EOF_
My hostname:		${myHost}
My IP address:		${myIP}
My OS version:		${myOS}
My kernel version:	${myKernel}
My CPU model:		${myCPU}
My total memory:	${totalMem}
My disk size:		${diskSize}
_EOF_
