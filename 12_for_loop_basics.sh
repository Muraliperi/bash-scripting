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
# Basic for loop 4
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
