#!/bin/bash
clear
echo -e "\e[31;47;7mScript is to find out top Memory Consuming Processes\e[0m"
echo -e "\e[31m##########\e[0m"
sleep 3
echo -e "\e[31mPlease enter the Server name and then press Control D\e[0m"
cat > topmemhosts
clear
topmemprs="ps -e -o pid,uname,cmd,pmem,cpu --sort=-pmem,-pcpu| head -10"
for i in $(cat /root/bash_automation/topmemhosts)
do
echo -e "\e[37;44m Top memory utilized process list from $i \e[0m"
echo -e "\e[31m `ssh $i $topmemprs`\e[0m"
sleep 5
clear
done
