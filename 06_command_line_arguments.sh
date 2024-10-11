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
