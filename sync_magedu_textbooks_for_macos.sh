#!/usr/bin/env bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		sync_magedu_textbooks.sh
# Revision:		1.0
# Date:			2017-12-16
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

pdfSrc="${HOME}/magedu_smb/slides"
# delete `/slides` of $pdfSrc then assign to $smbSrc
smbSrc=${pdfSrc%/*}
dest="${HOME}/Google 云端硬盘/magedu-linux-training-27/pdf/"

[ `uname` == "Darwin" ] \
	|| { echo "Please run this script on macOS." && exit 1; }

[ -d "${smbSrc}" ] || mkdir "${smbSrc}"

# the path of remote samba shared directory is 172.18.0.1/27,
# if a line of `df` output contains the path and the last field equal to 
# $smbSrc, that means the samba shared dir has been mounted on $smbSrc.
[[ "`df | awk '/172\.18\.0\.1\/27/{print $NF}'`" == "${smbSrc}" ]] \
	|| { 
		echo -e "\nMounting...\n"; 
		/sbin/mount -t smbfs //magedu27:magedu27@172.18.0.1/27 "${smbSrc}";
}

default="rsync -ahiv"
# there must be a slash (/)
${default} --dry-run "${pdfSrc}/" "${dest}"

echo -e "\n===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====\n"
read -rp "The dry-run result showed above, continue to really sync them? [y/n] " -n1
echo

if [[ $REPLY = [YyNn] ]]; then
	if [[ $REPLY = [Yy] ]]; then
		# there must be a slash (/)
		${default} "${pdfSrc}/" "${dest}"
	else
		echo -e "\nYou have to manual run rsync with different options, current are: \n${default}"
		exit 2
	fi
fi
