#!/bin/bash
# Cut command to cut characters based on its range length numbers or index position

[root@ansible-control-node bash_automation]# message="Welcome to Bash shell scripting!"
[root@ansible-control-node bash_automation]# echo ${message}
Welcome to Bash shell scripting!
[root@ansible-control-node bash_automation]# echo ${message} | cut -c 1-7
Welcome
[root@ansible-control-node bash_automation]# echo ${message} | cut -c 7-17
e to Bash s
[root@ansible-control-node bash_automation]# echo ${message} | cut -c 7-20
e to Bash shel
[root@ansible-control-node bash_automation]# cat demofile.txt
ansuser:x:1010:1012::/home/ansuser:/bin/bash
[root@ansible-control-node bash_automation]# cut -d ':' -f1 demofile.txt
ansuser
[root@ansible-control-node bash_automation]# cut -d: -f1 demofile.txt
ansuser
[root@ansible-control-node bash_automation]# cut -d ':' -f1,3 demofile.txt
ansuser:1010
[root@ansible-control-node bash_automation]# cut -d ':' -f6,8 demofile.txt
/home/ansuser
[root@ansible-control-node bash_automation]# cut -d ':' -f1,3 demofile.txt
ansuser:1010
[root@ansible-control-node bash_automation]# cut -d ':' -f1-6 demofile.txt
ansuser:x:1010:1012::/home/ansuser
[root@ansible-control-node bash_automation]# cut -d ':' -f3-6 demofile.txt
1010:1012::/home/ansuser
[root@ansible-control-node bash_automation]# cut -d ':' --output-delimiter ' ' -f3-6 demofile.txt
1010 1012  /home/ansuser
[root@ansible-control-node bash_automation]# cut -d ':' --output-delimiter ' ' -f1-6 demofile.txt
ansuser x 1010 1012  /home/ansuser
[root@ansible-control-node bash_automation]# cut -d ':' -f3- demofile.txt
1010:1012::/home/ansuser:/bin/bash
[root@ansible-control-node bash_automation]# cut -d ':' -f-4 demofile.txt
ansuser:x:1010:1012
[root@ansible-control-node bash_automation]#


# To get the last field
[root@ansible-control-node bash_automation]# cat demofile.txt
ansuser:x:1010:1012::/home/ansuser:/bin/bash
[root@ansible-control-node bash_automation]# cat demofile.txt | rev
hsab/nib/:resusna/emoh/::2101:0101:x:resusna
[root@ansible-control-node bash_automation]# cat demofile.txt | rev | cut -d ':' -f1
hsab/nib/
[root@ansible-control-node bash_automation]# cat demofile.txt | rev | cut -d ':' -f1 | rev
/bin/bash
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# cat demofile.txt
ansuser:x:1010:1012::/home/ansuser:/bin/bash
devuser:x:2301:1234:hey:/home/devuser:/bin/bash
[root@ansible-control-node bash_automation]# cut -f1 demofile.txt
ansuser:x:1010:1012::/home/ansuser:/bin/bash
devuser:x:2301:1234:hey:/home/devuser:/bin/bash
[root@ansible-control-node bash_automation]# cut -d ':' -f1 demofile.txt
ansuser
devuser
[root@ansible-control-node bash_automation]# cat demofile.txt | cut -d ':' -f1
ansuser
devuser
[root@ansible-control-node bash_automation]# echo "Hi,Hello,How,Are,You,swiz" | cut -d ',' -f3
How
[root@ansible-control-node bash_automation]# echo "Hi,Hello,How,Are,You,swiz" | rev
ziws,uoY,erA,woH,olleH,iH
[root@ansible-control-node bash_automation]# echo "Hi,Hello,How,Are,You,swiz" | rev | cut -d ',' -f1
ziws
[root@ansible-control-node bash_automation]# echo "Hi,Hello,How,Are,You,swiz" | rev | cut -d ',' -f1 | rev
swiz
[root@ansible-control-node bash_automation]#
