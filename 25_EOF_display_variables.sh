a=10
b=45.6
c=xyz
d=/tmp/testfile.txt
e=$(hostname)
f=`date`
# Type 1 to display the variables
echo $a
echo ${b}
# Type 2 to display the variables
cat << EOF
${e}
${f}
EOF
