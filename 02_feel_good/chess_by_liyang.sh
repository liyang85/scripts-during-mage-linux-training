#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		chess_by_liyang.sh
# Revision:		1.0
# Date:			2017-12-26
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

bgBlack=`tput setab 0`
bgRed=`tput setab 1`
bgYellow=`tput setab 3`
bgWhite=`tput setab 7`
reset=`tput sgr0`

# determine if there is a $1 parameter
if [[ -z "$1" ]]; then
	echo
	echo -e "Usage: \t`basename $0` 8"
	echo -e "\t8 means rows and columns of the chessboard are 8x8."
	exit 1
fi

# determine if the $1 is a positive integer
[[ "$1" =~ ^[0-9]+$ ]] \
	|| { echo -e "\nError! Please input a positive integer." && exit 2; }

# 1 block = blkWidth_spaces x blkHeight_spaces 
blkWidth=5
blkHeight=2

# determine if the specified columns exceed tty max allowed value
ttyCols=`tput cols`
maxBlks=$[${ttyCols} / $blkWidth]
[[ $1 -gt $maxBlks ]] \
	&& echo -e "\nError! TTY columns are ${ttyCols}, just allows ${maxBlks} blocks per line." \
	&& echo "Please give a number which less than or equal to ${maxBlks}." \
	&& exit 3

blk1() {
	for j in `seq ${blkWidth}`; do
		# echo -n "${bgBlack} ${reset}"
		echo -n "${bgRed} ${reset}"
	done
}
blk2() {
	for j in `seq ${blkWidth}`; do
		echo -n "${bgWhite} ${reset}"
		# echo -n "${bgYellow} ${reset}"
	done
}

# function has its own positional parameters,
# and can't see the positional parameters of the script,
# for avoiding errors,
# if you want to pass script's positional parametes to a function:
# (1) script's positional parameters must be assigned to a variable,
# (2) then use the variable in a function.
#
cols=$1
line1() {
	for i in `seq ${blkHeight}`; do
		for j in `seq ${cols}`; do
			# echo $j 	# for debugging
			if [[ $[j%2] -eq 0 ]]; then
				blk1
			else
				blk2
			fi
		done
		echo
	done
}
line2() {
	for i in `seq ${blkHeight}`; do
		for j in `seq ${cols}`; do
			if [[ $[j%2] -eq 0 ]]; then
				blk2
			else
				blk1
			fi
		done
		echo
	done
}

rows=$1
echo
for i in `seq ${rows}`; do
	if [[ $[i%2] -eq 0 ]]; then
		line1
	else
		line2
	fi
done
