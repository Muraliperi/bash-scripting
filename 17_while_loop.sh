[root@ansible-control-node bash_automation]# cat random_ips.txt
ip_addr1 ip_addr2 ip_addr3 ip_addr4
192.1688.76.11 192.1688.76.12 192.1688.76.13 192.1688.76.14
192.1688.66.11 192.1688.66.12 192.1688.66.13 192.1688.66.14
192.1688.86.11 192.1688.86.12 192.1688.86.13 192.1688.86.14
192.1688.55.11 192.1688.55.12 192.1688.55.13 192.1688.55.14
192.1688.96.11 192.1688.96.12 192.1688.96.13 192.1688.96.14
[root@ansible-control-node bash_automation]#
------------------------------------
# Type_1 Printing line by line
while IFS=' ' read -r var; do echo $var;echo "-------------------"; done < random_ips.txt
------------------------------------
# Type_2 Printing each ip address in new line.
while IFS=' ' read -r f1 f2 f3 f4; do echo $f1; echo $f2; echo $f3; echo $f4; echo "---------------"; done < random_ips.txt
------------------------------------
# Type_3 Printing each word separated by : colun 
 while IFS=':' read -r f1 f2 f3 f4 f5 f6 f7; do echo $f1; echo $f2; echo $f3; echo $f4; echo $f5; echo $f6; echo $f7; echo "--------"; done < /etc/passwd.txt
------------------------------------
# Type_4 Basic while loop 1
#!/bin/bash
i=1
while (( i<=10 ))
  do
  echo "Welcome to my Lecture $i"
  i=$(( i+1 ))
done
-------------------------------------
# Type_5 Basic while loop 2
#!/bin/bash
file_name=/etc/resolv.conf
while IFS=' ' read -r file
  do
  echo "$file"
done < $file_name
---------------------------------------
# Type_6 Basic while loop 2
#!/bin/bash
file_name=/etc/resolv.conf
while IFS=' ' read -r f1 f2 f3
  do
  echo "$f1"
  echo "$f2"
  echo "$f3"
  echo "---------------"
done < $file_name
----------------------------------------
# Infinite while loop 1
#!/bin/bash
while :
do
  echo "Hey, How is going on. Press [Ctrl + C] to stop this inifite loop!"
done
----------------------------------------
# Infinite while loop 2
#!/bin/bash
while true
do
 echo "Hey, how are you. Press [Ctrl+C] to stop "
done
----------------------------------------
# While Loop Basic 1
[root@ansible-control-node bash_automation]# cat while_loop4.sh
#!/bin/bash
cnt=1

while [[ ${cnt} -le 8 ]]
do
    echo "${cnt}) Hello World !"
    cnt=$((cnt+1))
done
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# cat random_servers.txt
server1.prod.abc.com
server2.test.xyz.com
server3.pre-prod.abc.com
server4.stag3.xyz.com
server5.stag4.abc.com
server6.dev.xyz.com
server7.test3.abc.com
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# cat while_loop5.sh
#!/bin/bash
# Type 1
[root@ansible-control-node bash_automation]# while read -r line
> do
> echo ${line}
> done <<< $(cat random_servers.txt)
server1.prod.abc.com
server2.test.xyz.com
server3.pre-prod.abc.com
server4.stag3.xyz.com
server5.stag4.abc.com
server6.dev.xyz.com
server7.test3.abc.com
[root@ansible-control-node bash_automation]#

echo "=================================================="

# Type 2
[root@ansible-control-node bash_automation]# cat random_servers.txt | while read -r line
> do
>   echo "${line}"
> done
server1.prod.abc.com
server2.test.xyz.com
server3.pre-prod.abc.com
server4.stag3.xyz.com
server5.stag4.abc.com
server6.dev.xyz.com
server7.test3.abc.com
[root@ansible-control-node bash_automation]#

echo "=================================================="

# Type 3

[root@ansible-control-node bash_automation]# while read -r line
> do
>    echo "${line}"
> done < random_servers.txt
server1.prod.abc.com
server2.test.xyz.com
server3.pre-prod.abc.com
server4.stag3.xyz.com
server5.stag4.abc.com
server6.dev.xyz.com
server7.test3.abc.com
[root@ansible-control-node bash_automation]#

echo "=================================================="

# Type 4
[root@ansible-control-node bash_automation]# cat test_while_loop.sh
#/bin/bash
fileName=random_servers.txt
while IFS='.' read -r f1 f2 f3 f4
do
  echo "${f1} : ${f2} : ${f3} : ${f4} "
done < ${fileName}
[root@ansible-control-node bash_automation]# sh test_while_loop.sh
server1 : prod : abc : com
server2 : test : xyz : com
server3 : pre-prod : abc : com
server4 : stag3 : xyz : com
server5 : stag4 : abc : com
server6 : dev : xyz : com
server7 : test3 : abc : com
[root@ansible-control-node bash_automation]#

echo "=================================================="
------------------------------------------------------------------------------------------------------
# Type 5
[root@ansible-control-node bash_automation]# fileName=random_servers.txt
[root@ansible-control-node bash_automation]# while IFS='.' read -r f1 f2 remaining
> do
>   echo "${f1} ${f2}      ${remaining}"
> done < ${fileName}
server1 prod      abc.com
server2 test      xyz.com
server3 pre-prod      abc.com
server4 stag3      xyz.com
server5 stag4      abc.com
server6 dev      xyz.com
server7 test3      abc.com
[root@ansible-control-node bash_automation]#
echo "=================================================="
------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat while_loop_with_break.sh
#!/bin/bash
num=1
while :
do
  echo "${num} Hello world!"
  num=$((num+1))
  if [[ ${num} -eq 11 ]] ; then
     break
  fi
  sleep 1
done
[root@ansible-control-node bash_automation]#
------------------------------------------------

