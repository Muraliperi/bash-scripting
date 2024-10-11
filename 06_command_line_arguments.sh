#!/bin/bash
a=$1
b=$2
results=`expr "$a + $b"| bc `
echo "Addition of $a and $b is: $results"
