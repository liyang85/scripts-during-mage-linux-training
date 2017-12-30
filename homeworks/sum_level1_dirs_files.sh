#!/bin/bash
#===== ===== ===== ===== ===== ===== 
# Filename:	sum_level1_dirs_files.sh
# Revision:	1.0
# Author:	Li Yang
# Date:		2017-11-23
# Description:
#===== ===== ===== ===== ===== ===== 

path1="/etc/"
path2="/var/"
path3="/usr/"

path1L1Dirs=`ls -ap ${path1} | grep -cE "/$"`
path2L1Dirs=`ls -ap ${path2} | grep -cE "/$"`
path3L1Dirs=`ls -ap ${path3} | grep -cE "/$"`

path1L1Files=`ls -ap ${path1} | grep -cvE "/$"`
path2L1Files=`ls -ap ${path2} | grep -cvE "/$"`
path3L1Files=`ls -ap ${path3} | grep -cvE "/$"`

sumL1Dirs=$(( ${path1L1Dirs} + ${path2L1Dirs} + ${path3L1Dirs} ))
sumL1Files=$(( ${path1L1Files} + ${path2L1Files} + ${path3L1Files} ))

echo "There are ${sumL1Dirs} level 1 directories in ${path1}, ${path2}, ${path3}."
echo "There are ${sumL1Files} level 1 files in ${path1}, ${path2}, ${path3}."
