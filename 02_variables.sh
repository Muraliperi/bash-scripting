#!/bin/bash
x=98
y=67
z=45
f=89
date_out="$(ls)"
<< commenting
echo "The value of x is: $x"
echo "The value of y is: $y"
echo "The value of z is: $z"
echo "The value of f is: $f"
commenting
echo -e "The value of x is $x \nThe value of y is $y \nThe value of z is $z \nThe value of f is $f"
echo "$date_out"

Output:
[root@ansible-control-node bash_automation]# sh variables.sh
The value of x is 98
The value of y is 67
The value of z is 45
The value of f is 89
Fri Oct 11 00:47:59 EDT 2024
[root@ansible-control-node bash_automation]#
----------------------------------------------------------------------------------------------------------------------
#!/bin/bash
# When we add # symbol inside curly braces while referring variable ${#}, it counting the variable length
shell_name=bash
myShellLen=${#shell_name}
echo "The length of '${shell_name}' is : ${myShellLen}"
----------------------------------------------------------------------------------------------------------------------
#!/bin/bash
# Converting a string into Upper case letters
myshell=bashshell
myshellUp=${myshell^^}
echo ${myshellUp}
----------------------------------------------------------------------------------------------------------------------
#!/bin/bash
# Converting string to Lower case
myshell=SHELL
myshellLow=${myshell,,}
echo ${myshellLow}
----------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat common_vars
#!/bin/bash
ansible=$(ansible --version|awk 'NR==1 {print $3}'|cut -d ']' -f1)
httpd=$(httpd -v|awk 'NR==1 {print $3}')
[root@ansible-control-node bash_automation]# cat source_to_read_variables_from_different_scriptfile.sh
#!/bin/bash
source /root/bash_automation/common_vars
echo "${httpd}"
echo "${ansible}"
[root@ansible-control-node bash_automation]# sh source_to_read_variables_from_different_scriptfile.sh
Apache/2.4.37
2.16.3
[root@ansible-control-node bash_automation]#
-------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat export_command_to_provide_inputs_for_variables.sh
#!/bin/bash
# First you need to execute 'export AnsiVer=$(ansible --version)' command on Terminal
# If you close and re-open the terminal then, this variable will be disappeared
echo "Ansible version is : ${AnsiVer}"

# 'export -p' can be executed to check if AnsiVer variable is available in the environmental variable.
#
[root@ansible-control-node bash_automation]# export DockerVersion=12.178-ops1
[root@ansible-control-node bash_automation]# export -p|grep Docker
declare -x DockerVersion="12.178-ops1"
[root@ansible-control-node bash_automation]# set |grep Dock
DockerVersion=12.178-ops1
[root@ansible-control-node bash_automation]#
-------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat shift_command_arguments.sh
#!/bin/bash
shift 2
echo "${1}"
echo "${2}"
echo "${3}"


# The shift command shifts/moves the command-line arguments to the left by one position.
# The first argument is lost after using shift.
# You can specify how many positions to shift (default is 1).

<< mycomm
[root@ansible-control-node bash_automation]# cat shift_command_arguments.sh
#!/bin/bash
shift 1
echo "${1}"
echo "${2}"
echo "${3}"
[root@ansible-control-node bash_automation]# sh shift_command_arguments.sh val1 val2 val3
val2
val3

[root@ansible-control-node bash_automation]# vim shift_command_arguments.sh
[root@ansible-control-node bash_automation]# cat shift_command_arguments.sh
#!/bin/bash
shift 2
echo "${1}"
echo "${2}"
echo "${3}"
[root@ansible-control-node bash_automation]# sh shift_command_arguments.sh val1 val2 val3
val3


[root@ansible-control-node bash_automation]#
mycomm
[root@ansible-control-node bash_automation]#
----------------------------------------------------------------------------------------------------------------------------------
