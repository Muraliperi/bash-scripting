# For loop for scp
#!/bin/bash
for i in `cat /root/bash_automation/hosts`
do
scp -p $i:/tmp/log/*_system_info.log /root/bash_automation/fetched_info
done
----------------------------------------------------------
# Basic for loop 1
#!/bin/bash
for n in 1 2 3 4 5 6
do
echo $n
done
---------------------------------------------------------
# Basic for loop 2
#!/bin/bash
for i in sun mon tue wed thu fri sat
do
echo $i
done
---------------------------------------------------------
# Basic for loop 3
#!/bin/bash
for n in {1..25}
do
echo $n
done
---------------------------------------------------------
# Basic for loop 4
#!/bin/bash
i=1
for day in sun mon tue wed thu fri sat
do
echo "Weekday $((i++)) is $day"
done
---------------------------------------------------------
# Basic for loop 5
#!/bin/bash
n=1
for i in "Sun Mon Tue Wed Thu Fri Sat" "1 2 3 4 5 6 7"
do
echo "Weekdays $(( n++ )): $i"
done
---------------------------------------------------------
# Basic C like for loop
#!/bin/bash
for (( i=1; i<=10; i++))
do
echo "value of i is: $i"
done
---------------------------------------------------------
# Basic for loop 6
#!/bin/bash
files="/etc/passwd /etc/shadow /etc/gpasswd /etc/gshadow /etc/groups /etc/resolv.conf"
for file in $files
do
[ -f $file ] && echo "File found $file" || echo "File missing $file"
done
---------------------------------------------------------
# For loop using command line argument
#!/bin/bash -x
[ $# -eq 0 ] && { echo "You have not provided any Arguments"; exit 1;}
for file in $*
do
echo "< $file >"
[ -f $file ] && ls -lrt $file || echo "$file missing"
echo "-----------"
done
