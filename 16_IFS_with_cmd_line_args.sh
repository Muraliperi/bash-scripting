#!/bin/bash
IFS=","
a=$1
b=$2
c=`expr $a + $b`
echo "Sum of given numbers is: $c"
echo "Number of arguments given is: $#"
echo "Print the given arguments: $@"
echo "Print the given arguments: $*"
