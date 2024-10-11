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
-----------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat make_constant_variable1.sh
#!/bin/bash
# using declare -i to keep the variable with particular data type. Here we are passing integer value, so we can not change it's value to any other data/variable type such as string
declare -i ab=100
declare -i bc=345
echo "ab value is $ab"
echo "bc value is $bc"
cd=$(( ab+bc ))
echo "ab + bc value is $cd"
ab="Hello"
echo "ab value after changing to Hello string $ab"
echo "bc value is $bc"
cd=$(( ab+bc ))
echo "ab + bc after trying with updated ab value is $cd"
[root@ansible-control-node bash_automation]# sh make_constant_variable1.sh
ab value is 100
bc value is 345
ab + bc value is 445
ab value after changing to Hello string 0
bc value is 345
ab + bc after trying with updated ab value is 345
[root@ansible-control-node bash_automation]#
---------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat defining_constant_variable.sh
#!/bin/bash
# declare -r is to set constant/readonly variable. 
[root@ansible-control-node bash_automation]# declare -r verma=/home/ansusr/tempdir/datafile
[root@ansible-control-node bash_automation]# echo $verma
/home/ansusr/tempdir/datafile
[root@ansible-control-node bash_automation]# verma=78
bash: verma: readonly variable
[root@ansible-control-node bash_automation]# verma=apple
bash: verma: readonly variable
[root@ansible-control-node bash_automation]# unset verma
bash: unset: verma: cannot unset: readonly variable
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]#
