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

		echo -e "\n===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== =====\n"

		# make a review list which can be added to dida365.com
		date=`date +"%F%T"`
		lstName="pdf.lst.${date//[-:]}"
		cd "${dest}" \
			&& find . -mindepth 1 -maxdepth 1 -iname '*.pdf' \
			| sed -r -e 's/\.\///' \
			-e 's/^([0-9])([^[:digit:]].*)/0\1\2/' \
			-e 's/^([0-9]{2})/\1 /' \
			-e 's/\.pdf//' \
			| sort -n > "${lstName}"
		echo -e "Below is the newest pdf list, please add it to dida365.com: \n"
		cat "${lstName}"
		cd
	else
		echo -e "\nYou have to manual run rsync with different options, current are: \n${default}"
		exit 2
	fi
fi
