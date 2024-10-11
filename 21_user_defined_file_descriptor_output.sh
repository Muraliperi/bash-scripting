
# Storing /tmp/abcd.txt as value in variable 6>
[root@ansible-control-node bash_automation]# cat user_defined_file_descriptor_output.sh
[root@ansible-control-node bash_automation]# exec 6> /tmp/abcd.txt
[root@ansible-control-node bash_automation]# echo "Hello world!" >&6
[root@ansible-control-node bash_automation]# uptime >&6
[root@ansible-control-node bash_automation]# date >&6
[root@ansible-control-node bash_automation]# hostname -i >&6
[root@ansible-control-node bash_automation]# cat /tmp/abcd.txt
Hello world!
 03:38:00 up  4:09,  1 user,  load average: 0.00, 0.03, 0.00
Mon Sep  9 03:38:04 EDT 2024
192.168.43.90
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]#
