#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		stat_files_type_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-19
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

old_IFS="$IFS"
# IFS默认为<space><tab><newline>三种，用于Bash展开时作为单词分割的分隔符，
# 但其中的<space>会导致包含空格的文件名被分割成多个字段，
# 因此需要把IFS设置为只使用换行符。
IFS=$'\n'

read -p "Please give a directory name: " dir
files=`find "${dir}"`
out="stat_filetype.txt"

> "${out}"

echo "Counting..."
for i in ${files}; do
	filetype=`stat -c %F "${i}"`
	printf "%-20s\t%s\n" "${filetype}" "${i}" >> "${out}"
done

cut -f1 "${out}" | sort | uniq -c | sort -k1 -nr
