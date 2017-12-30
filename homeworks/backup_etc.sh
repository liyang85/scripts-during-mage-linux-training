#!/bin/bash
# backup19.sh: backup /etc/

bakDate=$(date +%F)
bakDir=/root/etc${bakDate}
mkdir ${bakDir} && cp -a /etc/* $_
