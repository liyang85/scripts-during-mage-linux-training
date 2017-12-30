#!/bin/bash
#
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 
# Filename:		check_ip.sh
# Revision:		1.0
# Author:		Li Yang
# Date:			2017-11-24
# Description:		finding quotes how to affect regex evaluation
#===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== ===== 

# 定义数组的2种方式
# ips=("str1" "str2" "str3" "str4" "str5")
ips[0]='192.168.0.1'
ips[1]='192.168.0'
ips[2]='255.255.255.256'
ips[3]='123.123.123.123.123'
ips[4]='a.b.c.d'
ips[5]='255.255.255.255'
ips[6]='0.0.0.0'

# 使用「$'...'」将转义八进制或十六进制的值转换成ASCII或Unicode字符
red=$'\033[31m'
green=$'\033[32m'
yellow=$'\033[33m'
blue=$'\033[34m'
magenta=$'\033[35m'
cyan=$'\033[36m'
normal=$'\033[0m'

invalidOut="Invalid"
validOut="Valid"
regexVar="Saved in a VARIABLE"
regexStr="Is a STRING"
noQuotes="NO quotes"
singleQuotes="Single quotes"
doubleQuotes="Double quotes"

printStyleT="%-25s\t%-10s\t%-20s\t%-15s\n"
# 颜色代码必须放在`%[column_width]s`外面，否则会占用列宽
printStyleY="${green}%-25s\t%-10s${normal}\t%-20s\t%-15s\n"
printStyleN="${red}%-25s\t%-10s${normal}\t%-20s\t%-15s\n"
printTitle=$(printf "${printStyleT}" "IP Address" "Validity" "Regex" "Quote Type")
print2ndLine=$(printf "${printStyleT}" "====================" "==========" "====================" "===============")

# part 1: regex saved in a variable

regex="^((25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})[.]){3}(25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})$"

# 不要使用任何引号包围正则表达式变量或正则表达式字符串，
# 否则正则表达式会被解释为普通字符串，而非元字符，导致匹配永远失败
#
# 另外，如果正则表达式包含反斜线，务必要赋值给变量，然后在条件测试语句中调用，
# 详见 https://liyang85.com/how-to-use-bash-regex-evaluation-correctly#i-2
function validIP1a() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	# 「${#ips[@]}」表示数组长度，
	# 「${ips[@]}」表示数组的所有成员，
	# 两种情况都需要使用花括号界定变量名
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ $regex ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexVar}" "${noQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexVar}" "${noQuotes}"
		fi
	done
}

# the regex variable has been surrounded with single quotes
function validIP1b() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ '$regex' ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexVar}" "${singleQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexVar}" "${singleQuotes}"
		fi
	done
}

# the regex variable has been surrounded with double quotes
function validIP1c() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ "$regex" ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexVar}" "${doubleQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexVar}" "${doubleQuotes}"
		fi
	done
}

# part 2: regex is a string that write down directly

# the regex string has been surrounded without quotes
function validIP2a() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ ^((25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})[.]){3}(25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})$ ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexStr}" "${noQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexStr}" "${noQuotes}"
		fi
	done
}

# the regex string which includes the backslash \ meta character has been surrounded without quotes
function validIP2b() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ \b((25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})[.]){3}(25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})\b ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexStr}" "${noQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexStr}" "${noQuotes}"
		fi
	done
}

# the regex string has been surrounded with single quotes
function validIP2c() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ '^((25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})[.]){3}(25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})$' ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexStr}" "${singleQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexStr}" "${singleQuotes}"
		fi
	done
}

# the regex string has been surrounded with double quotes
function validIP2d() {
	echo "${printTitle}"
	echo "${print2ndLine}"
	for (( i=0; i<${#ips[@]}; i++ )); do
		if [[ "${ips[i]}" =~ "^((25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})[.]){3}(25[0-5]|2[0-4][0-9]|[01][0-9][0-9]|[0-9]{1,2})$" ]]; then
			printf "${printStyleY}" "${ips[i]}" "${validOut}" "${regexStr}" "${doubleQuotes}"
		else
			printf "${printStyleN}" "${ips[i]}" "${invalidOut}" "${regexStr}" "${doubleQuotes}"
		fi
	done
}

validIP1a
echo
validIP1b
echo
validIP1c
echo

validIP2a
echo
validIP2b
echo
validIP2c
echo
validIP2d
