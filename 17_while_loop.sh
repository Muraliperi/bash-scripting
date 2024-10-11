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
