#!/bin/bash
clear
echo -e "\e[36;4mSystem Information\e[0m"
sleep 1
# true-command && true-condition || false-condition
ping -c 1 -w 2 8.8.8.8 &> /dev/null && int="Connected" || int="Disconnected"
echo -e "\e[32mInternet:\e[0m \e[34m$int\e[0m"
sleep 1
os_type=$(uname -o)
echo -e "\e[32mOS Type:\e[0m \e[34m$os_type\e[0m"
sleep 1
server_type=$(dmidecode -s system-manufacturer)
echo -e "\e[32mServer Type:\e[0m \e[34m$server_type\e[0m"
sleep 1
# Check OS Release version and Name
###################################
OS=$(uname -s)
if [ "${OS}" = "Linux" ]; then
    if [ -f /etc/redhat-release ]; then
     DIST=`cat /etc/redhat-release|awk '{print $1,$2}'`
    elif [ -f /etc/SuSE-release ]; then
     DIST="SUSE Linux"
    elif [ -f /etc/mandrake-release ]; then
     DIST="Mandrake"
    elif [ -f /etc/debian_version ]; then
     DIST="Debian"
    fi
fi
# Printing Distribution details
echo -e "\e[32mDistribution:\e[0m" "\e[34m$DIST\e[0m"
sleep 1
# Check Architecture
arch=$(uname -m)
echo -e "\e[32mArchitecture:\e[0m" "\e[34m$arch\e[0m"
sleep 1
# Check Kernel Release
krel=$(uname -r)
echo -e "\e[32mKernel Release:\e[0m" "\e[34m$krel\e[0m"
sleep 1
# Check Hostname
echo -e "\e[32mHostname:\e[0m" "\e[34m$HOSTNAME\e[0m"
sleep 1
# Internal IP Address
ip_addr=$(hostname -I)
echo -e "\e[32mIP Address:\e[0m" "\e[34m$ip_addr\e[0m"
sleep 1
# DNS Address
dns=$(cat /etc/resolv.conf|sed '1 d'|awk '{print $2}')
echo -e "\e[32mDNS IP Address:\e[0m" "\e[34m$dns\e[0m"
sleep 1
# Logged in users
who>/tmp/users
echo -e "\e[32mLogged in Users:\e[0m"
echo -e "\e[34m`cat /tmp/users`\e[0m"
sleep 1
# Check RAM and Swap Memory usages
free -h>/tmp/cache
echo -e "\e[32mRAM Usage:\e[0m"
sleep 1
echo -e "\e[34m`cat /tmp/cache|grep -vi Swap`\e[0m"
echo -e "\e[32mSwap Usage:\e[0m"
sleep 1
echo -e "\e[34m`cat /tmp/cache|grep -vi Mem`\e[0m"
# Check Disk usage
df -h>/tmp/diskusage
echo -e "\e[32mDisk Usages:\e[0m"
sleep 1
echo -e "\e[34m`cat /tmp/diskusage|grep -v tmpfs `\e[0m"
# Disk details
disk_details=$(fdisk -l|grep -i Disk|egrep -v 'dos|identifier|mapper')
echo -e "\e[32mDisk details:\e[0m"
echo -e "\e[34m$disk_details\e[0m"
# Check Load average
load_avg=$(top -n 1 -b|grep "load average:"|awk '{print $10 $11 $12}')
echo -e "\e[32mLoad average:\e[0m"
echo -e "\e[34m$load_avg\e[0m"
# Check System uptime
sys_uptime=$(uptime|awk '{print $3,$4}'|cut -f1 -d,)
echo -e "\e[32mSystem Uptime Days/ (HH:MM:)\e[0m" "\e[34m$sys_uptime\e[0m"
