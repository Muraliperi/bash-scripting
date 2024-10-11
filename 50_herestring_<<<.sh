[root@ansible-control-node bash_automation]# cat herestring.sh
#!/bin/bash

<<mycomm

[root@ansible-control-node bash_automation]# cut -d ' ' -f3 <<< "Hello Murali, Welcome to Bash Shell scripting Class"
Welcome
[root@ansible-control-node bash_automation]# myStr="This is first class"
[root@ansible-control-node bash_automation]# cut -d ' ' -f1 <<< ${myStr}
This
[root@ansible-control-node bash_automation]# cat /etc/passwd |grep ansu
ansuser:x:1010:1012::/home/ansuser:/bin/bash
[root@ansible-control-node bash_automation]# cut -d ':' -f6 <<< $(cat /etc/passwd |grep ansu)
/home/ansuser
[root@ansible-control-node bash_automation]#

mycomm
[root@ansible-control-node bash_automation]#
