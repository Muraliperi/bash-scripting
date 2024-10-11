[root@ansible-control-node bash_automation]# cat break_and_continue_statement.sh
#!/bin/bash
echo "WE ARE PLAYING WITH BREAK AND CONTINUE"
for each in 12 14 15 16 17 18 19 20
do
   if [[ ${each} -eq 14 ]] ; then
       echo "Skipping, because n value is: ${each}"
       continue
   elif [[ ${each} -eq 18 ]] ; then
       echo "Breaking, because n value is: ${each}"
       break
   fi
   echo "Value of n is: ${each}"
done

echo "This comment is from outside of for loop.."
[root@ansible-control-node bash_automation]#
