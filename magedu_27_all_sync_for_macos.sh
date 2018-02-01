#!/usr/bin/env bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		magedu_27_all_sync_for_macos.sh
# Date:			2018-01-30
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# pdfSrc="${HOME}/magedu_smb/slides"
# delete `/slides` of $pdfSrc then assign to $smbSrc
smbSrc="${HOME}/magedu_smb"
dest="/Volumes/WD-USB-HDD/magedu-linux-27"

[ `uname` == "Darwin" ] \
	|| { echo -e "\nPlease run this script on macOS." && exit 1; }

[ -d "${smbSrc}" ] || mkdir "${smbSrc}"

[ -d "${dest}" ] \
	|| { echo -e "\nConnect WD-USB-HDD first!" && exit 2; }

# the path of remote samba shared directory is 172.18.0.1/27,
# if a line of `df` output contains the path and the last field equal to 
# $smbSrc, that means the samba shared dir has been mounted on $smbSrc.
[[ "`df | awk '/172\.18\.0\.1\/27/{print $NF}'`" == "${smbSrc}" ]] \
	|| { 
		echo -e "\nMounting...\n"; 
		/sbin/mount -t smbfs //magedu27:magedu27@172.18.0.1/27 "${smbSrc}";
}

# Do not need `-z`, because the transmission is between local PC and a removable HDD.
# The receiver is an exFAT drive which is not support permissions, so use `--no-perms`.
default="rsync -ahiv --progress --no-perms"
# there must be a slash (/)
${default} --dry-run "${smbSrc}/" "${dest}"

echo -e "\n===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====\n"
read -rp "The dry-run result showed above, continue to really sync them? [y/n] " -n1
echo

if [[ $REPLY = [YyNn] ]]; then
	if [[ $REPLY = [Yy] ]]; then
		# there must be a slash (/)
		${default} "${smbSrc}/" "${dest}"
	else
		echo -e "\nYou have to manual run rsync with different options, current are: \n${default}"
		exit 3
	fi
fi
