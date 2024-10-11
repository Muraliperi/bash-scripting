#!/bin/bash
echo "Hello world, This is test file for bash shell scripting tutorial"
echo 'This message is using single codes'

echo "The below output is from using echo command"
echo "-------using double quotes---------"
echo "$(date)"
echo "-------using single quotes---------"
echo '$(date)'
echo "-------using without quotes---------"
echo $(date)

Output:
[root@ansible-control-node bash_automation]# sh hello_world.sh
Hello world, This is test file for bash shell scripting tutorial
This message is using single codes
The below output is from using echo command
-------using double quotes---------
Fri Oct 11 00:41:08 EDT 2024
-------using single quotes---------
$(date)
-------using without quotes---------
Fri Oct 11 00:41:08 EDT 2024
[root@ansible-control-node bash_automation]#
======================================================================
[root@ansible-control-node bash_automation]# cat test.sh
#!/bin/bash
x=67
y=98
z=76
echo "printing x value with double quotes"
echo "$x"
echo "printing x value with single quotes"
echo '$x'
echo "printing x value without quotes"
echo $x
[root@ansible-control-node bash_automation]# sh test.sh
printing x value with double quotes
67
printing x value with single quotes
$x
printing x value without quotes
67
[root@ansible-control-node bash_automation]#

