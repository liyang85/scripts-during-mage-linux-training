#!/bin/bash

# insert_shell_script_header.sh: create script description automatically

fullFileName="${1}_by_liyang.sh"

cat << _EOF_ > ${fullFileName}
#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		${fullFileName}
# Revision:		1.0
# Date:			`date +%F`
# Description:
# Author:		Li Yang
# Website:		https://liyang85.com
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 


_EOF_

chmod +x ${fullFileName}
vim + -c 'startinsert' ${fullFileName}
