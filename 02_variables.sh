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
