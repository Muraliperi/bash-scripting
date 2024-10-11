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
