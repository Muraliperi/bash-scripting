[root@ansible-control-node bash_automat
ion]# cat awkfile
No Employee-Name Manager Salary Designation
100 Murali Vikas $3000 Admin
200 Vinay Vipul $5000 Developer
300 Chiru Abhishek $8000 Middleware
400 Siva Abhishek $9000 Database
500 Abhi Deveena $6000 Cloud-Adm
600 Swapnil Vikas $8000 System-Adm
[root@ansible-control-node bash_automation]#
-----------------------------------------------------------------------------
Basic concepts with awk:
cat awkfile | awk '{print $1}'  --> To cut first column
cat awkfile | awk '{print $1}'  --> To cut second column
cat awkfile | awk '{print $1$2}'  --> To cut first & second column
cat awkfile | awk '{print $1,$2}'  --> To cut first & second column with Space
cat awkfile | awk '{print $NF}'  --> To cut last row value of each column.
-----------------------------------------------------------------------------
Moderate concepts with awk:
cat awkfile | awk '/Thomas/'   --> To search Thomas keyword in entire file.
awk '/Thomas/' awkfile         --> To search Thomas keyword in entire file.
cat awkfile | awk '/Thomas/   --> Hit enter here to search more than one keyword. Then finally end with single quote. Nisha is the second keyword.
> /Nisha/'
awk '$4 ~/Techology/' awkfile  --> To search Techology keyword in 4th column.
awk '$1 > 200' awkfile         --> To search numbers greater than 200 in 1st column.
-----------------------------------------------------------------------------
Advance concepts with awk:(Pre-processing)
To insert a newline header in the beginning of the file, use BEGIN.
cat awkfile | awk 'BEGIN {print "Numbers Name Designation Department Salary";} {print $1,$2,$3,$4,$5}'
To separate a newly inserted header with tab.
cat awkfile | awk 'BEGIN {print "Numbers\t Name\t Designation\t Department\t Salary";} {print $1,$2,$3,$4,$5}'
To separate a tab for all colums in the file content as well? then go with below.
cat awkfile | awk 'BEGIN {print "Numbers\t Name\t Designation\t Department\t Salary";} {print $1,"\t",$2,"\t",$3,"\t",$4,"\t",$5}'
To insert a newline header with tab and then print the remaining file content as it is. 
cat awkfile | awk 'BEGIN {print "Numbers\t Name\t Designation\t Department\t Salary";} {print $0}'
Advance concepts with awk:(Post-processing)
To insert a newline in the end of the line use END.
cat awkfile | awk 'BEGIN {print "Numbers\t Name\t Designation\t Department\t Salary";} {print $0} END {print "Report has been generated";}'
To create a user defined variable.
awk 'BEGIN { test="Welcome to Linux Classes"; print test}'
-------------------------------------------------------------------------------

#!/bin/bash
# Finding java version with awk command
# Trying to fetch uid value zero from id command using cut, Here we are using cut command double time
[root@ansible-control-node bash_automation]# id
uid=0(root) gid=0(root) groups=0(root) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
[root@ansible-control-node bash_automation]# id -u
0
[root@ansible-control-node bash_automation]# id | cut -d '=' -f2
0(root) gid
[root@ansible-control-node bash_automation]# id | cut -d '=' -f2 | cut -d '(' -f1
0
[root@ansible-control-node bash_automation]#

# Approaching same scenario with awk.
# -F refers to Delimiters and we can put multiple delimiters in [] square brackets
[root@ansible-control-node bash_automation]# id
uid=0(root) gid=0(root) groups=0(root) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
[root@ansible-control-node bash_automation]# id | awk -F '[=(]' '{print$2}'
0
[root@ansible-control-node bash_automation]# id ansuser
uid=1010(ansuser) gid=1012(ansuser) groups=1012(ansuser)
[root@ansible-control-node bash_automation]# id ansuser | awk -F '[=(]' '{print$2}'
1010
[root@ansible-control-node bash_automation]#


# Combination of cut and awk
[root@ansible-control-node bash_automation]# java -version
openjdk version "1.8.0_362"
OpenJDK Runtime Environment (build 1.8.0_362-b08)
OpenJDK 64-Bit Server VM (build 25.362-b08, mixed mode)
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# java -version 2>&1 | cut -d '"' -f2
1.8.0_362
OpenJDK Runtime Environment (build 1.8.0_362-b08)
OpenJDK 64-Bit Server VM (build 25.362-b08, mixed mode)
[root@ansible-control-node bash_automation]# java -version 2>&1 | head -1 | cut -d '"' -f2
1.8.0_362
[root@ansible-control-node bash_automation]# java -version 2>&1 | grep version | cut -d '"' -f2
1.8.0_362
[root@ansible-control-node bash_automation]# java -version 2>&1 | awk 'NR==1' | cut -d '"' -f2
1.8.0_362
[root@ansible-control-node bash_automation]#

# Finally, Only with AWK command
[root@ansible-control-node bash_automation]# java -version 2>&1 | awk -F '"' 'NR==1 {print $2}'
1.8.0_362
[root@ansible-control-node bash_automation]#

# Print last field
[root@ansible-control-node bash_automation]# ls -lrt | head -10 | awk '{print $NF}'
456
test
hello_world.sh
test.sh
variables.sh
ls_out_file_from_shell_scripting.txt
24-08-21.log
storing_command_outputs_in_variable.sh
store_cmd_into_var.sh
basic_echo.sh
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# 
----------------------------------------------------------------------------------------
