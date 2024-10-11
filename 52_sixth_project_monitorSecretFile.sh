[root@ansible-control-node bash_automation]# cat monitorSecretFile.sh
#!/bin/bash
filePath=/tmp/testfile.txt
mailTo=muruganbcamba@gmail.com
ECHO=/bin/echo
MAILX=/usr/bin/mailx
HOSTNAME=/usr/bin/hostname
if [[ ! -e ${filePath} ]] ; then
   ${ECHO} "The file ${filePath} not exist"
   ${ECHO} "The file ${filePath} removed from the host $(${HOSTNAME})" | ${MAILX} -s "Alert: Secret file ${filePath} deleted" ${mailTo}
fi
[root@ansible-control-node bash_automation]#
