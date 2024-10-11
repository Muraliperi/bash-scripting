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
