ss -tn | awk -F "[ :]+" \
	'/^ESTAB/{ip[$(NF-2)]++}END{for(i in ip){if(ip[i]>3)\
	{system("iptables -A INPUT -s "i" -j REJECT")}}}'
