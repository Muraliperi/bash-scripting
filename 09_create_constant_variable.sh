[root@ansible-control-node bash_automation]# cat make_constant_variable.sh
#Declaring constant type of variable. If you can see in this example the variable type is with integer. When we try to change value from Integer to String it's returning 0
[root@ansible-control-node bash_automation]# abc=100
[root@ansible-control-node bash_automation]# echo $abc
100
[root@ansible-control-node bash_automation]# abc=Murali
[root@ansible-control-node bash_automation]# echo $abc
Murali
[root@ansible-control-node bash_automation]# declare -i abc=110
[root@ansible-control-node bash_automation]# echo $abc
110
[root@ansible-control-node bash_automation]# abc=890
[root@ansible-control-node bash_automation]# echo $abc
890
[root@ansible-control-node bash_automation]# abc=hkdf
[root@ansible-control-node bash_automation]# echo $abc
0
[root@ansible-control-node bash_automation]# abc=10
[root@ansible-control-node bash_automation]# echo $abc
10
[root@ansible-control-node bash_automation]#
