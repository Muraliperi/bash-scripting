[root@ansible-control-node bash_automation]# cat arrays_basics.sh
#!/bin/bash
declare -a mylist
mylist=(1 2 3 4 5 6)
echo "My first array lists are below (1 2 3 4 5 6)"
echo "${mylist[0]}"
echo "${mylist[1]}"
echo "${mylist[2]}"
echo "${mylist[3]}"
echo "${mylist[4]}"
echo "${mylist[*]}"

declare -a mylist1
mylist1=(1 hi hello "hello sir" 2.0 44)
echo "My Second array lists are below (1 hi hello 'hello sir' 2.0 44)"
echo "${mylist1[0]}"
echo "${mylist1[1]}"
echo "${mylist1[2]}"
echo "${mylist1[3]}"
echo "${mylist1[4]}"
# To print all values
echo "${mylist1[@]}"
# Retrieving n values starting from index i
# Starting from index 3 the next 3 index positioned values
# echo "${mylist1[@]:i:n}"
echo "${mylist1[@]:3:3}"
# Print only index numbers
echo "${!mylist1[@]}"
# Print array length
echo "${#mylist1[@]}"
# To replace a value in arrays/overwrite 2nd index value
mylist1[2]="Welcome"
echo "${mylist1[@]}"
# Appending new value to the array
mylist1+=(12)
echo "Appending new value 12 to the array:"
echo "${mylist1[@]}"
# Appending multiple values to the array
echo "Appending multiple values 13 14 15 16) to the array:"
mylist1+=(13 14 15 16)
echo "${mylist1[@]}"
# Unset/remove a value from Array
echo "Removing 'Welcome' from the Array"
unset mylist1[2]
echo "${mylist1[@]}"
[root@ansible-control-node bash_automation]#
