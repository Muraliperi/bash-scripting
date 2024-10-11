#!/bin/bash
clear
echo -e "\e[31;47;7mScript is to find out top CPU Consuming Processes\e[0m"
echo -e "\e[31m##########\e[0m"
sleep 3
echo -e "\e[31mPlease enter the Server name and then press Control D\e[0m"
cat > topcpuhosts
clear
topcpuprc="ps -eo pmem,pcpu,pid,args | tail -n +2 |sort -nrk 2 | head"
for i in $(cat /root/bash_automation/topcpuhosts)
do
echo -e "\e[37;44m Top CPU utilized process lists from $i \e[0m"
echo -e "\e[31m `ssh $i $topcpuprc`\e[0m"
sleep 5
clear
done
