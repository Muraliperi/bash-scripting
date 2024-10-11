#!/bin/bash
a=$1
b=$2
results=`expr "$a + $b"| bc `
echo "Addition of $a and $b is: $results"
---------------------------------------------------------------------------
#!/bin/bash
echo "date"
echo "The name of my script is: ${0}"
echo "The value of First argument: ${1}"
echo "The value of Second argument: ${2}"
echo "The value of Third argument: ${3}"
echo "Total number of arguments is: ${#}"
echo "Total number of arguments : ${*}"
IFS=','
echo "Total number of arguments before IFS Internal Field Separator set to Comma character : ${*}"
---------------------------------------------------------------------------
# For loop using command line argument
#!/bin/bash -x
[ $# -eq 0 ] && { echo "You have not provided any Arguments"; exit 1;}
for file in $*
do
echo "< $file >"
[ -f $file ] && ls -lrt $file || echo "$file missing"
echo "-----------"
done
---------------------------------------------------------------------------
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
---------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat shift_command_arguments2.sh
#!/bin/bash
echo "${1}"
shift 1
echo "${2}"
echo "${3}"
[root@ansible-control-node bash_automation]# sh shift_command_arguments2.sh val1 val2 val3
val1
val3

[root@ansible-control-node bash_automation]#
---------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat cmd_line_args_with_array.sh
#!/bin/bash
declare -a myCmdArgs
# Taking all arguments in myCmdArgs array
myCmdArgs=( ${@} )
# Printing all given arguments
echo "${myCmdArgs[@]}"
# Printing 4th Index positioned argument from myCmdArgs array
echo "${myCmdArgs[4]}"
[root@ansible-control-node bash_automation]# sh cmd_line_args_with_array.sh 12 14 19 15 16 90
12 14 19 15 16 90
16
[root@ansible-control-node bash_automation]#
---------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat cmd_line_args_with_array_and_IFS.sh
#!/bin/bash
declare -a myCmdArgs
# Taking all arguments in myCmdArgs array
# We are mentioning : as a Internal Field Separator (IFS)
IFS=":"
myCmdArgs=( ${@} )
# Printing all given arguments
echo "${myCmdArgs[@]}"
# Printing 4th Index positioned argument from myCmdArgs array
echo "${myCmdArgs[4]}"
# Execute below command to test
# sh cmd_line_args_with_array_and_IFS.sh 12:13:14:15:16:17

[root@ansible-control-node bash_automation]# sh cmd_line_args_with_array_and_IFS.sh 12:13:14:15:16:17
12 13 14 15 16 17
16
[root@ansible-control-node bash_automation]#
-------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat cmd_line_args_with_array_and_IFS_Best_practices.sh
#!/bin/bash -x
declare -a myCmdArgs
# Taking all arguments in myCmdArgs array
# We are mentioning : as a Internal Field Separator (IFS)
# Assigning original IFS value to a Variable
#oldIFS=${IFS}
IFS=":"
myCmdArgs=( ${@} )
# Revoking original IFS value back
IFS=${oldIFS}

# Printing all given arguments
echo "${myCmdArgs[@]}"
# Printing 4th Index positioned argument from myCmdArgs array
echo "${myCmdArgs[4]}"
# Execute below command to test
# sh cmd_line_args_with_array_and_IFS.sh 12:13:14:15:16:17
[root@ansible-control-node bash_automation]# sh cmd_line_args_with_array_and_IFS.sh 12:13:14:15:16:17
12 13 14 15 16 17
16
[root@ansible-control-node bash_automation]#
-------------------------------------------------------------------------------------

