#!/bin/bash
serviceName=${1}
HOSTNAME=/usr/bin/hostname
MAILX=/usr/bin/mailx
PS=/usr/bin/ps
WC=/usr/bin/wc
GREP=/bin/grep
ECHO=/usr/bin/echo
BASENAME=/usr/bin/basename
DATE=/usr/bin/date
DATETIME=$(date '+%F %T')
TEE=/usr/bin/tee
LOGFILE=/var/tmp/BashLogDir/$(${BASENAME} $0)_$(${DATE} '+%F').log
mailTo=muruganbcamba@gmail.com
serviceCount=$(${PS} auxf| ${GREP} ${serviceName} | ${GREP} -v grep | ${GREP} -v ${0} | ${WC} -l)

${ECHO} "${DATETIME} : $(${HOSTNAME}) Process count value for the server ${serviceName} is : ${serviceCount}" | ${TEE} -a ${LOGFILE}

if [[ ${serviceCount} -eq 0 ]] ; then
   ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service is NOT RUNNING" | ${TEE} -a ${LOGFILE}
   ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service is NOT RUNNING" | ${MAILX} -s "Alert service ${serviceName} status" ${mailTo}
else
   ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service IS RUNNING" | ${TEE} -a ${LOGFILE}
   ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service IS RUNNING"
--------------------------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat monitor_process_or_service2.sh
#!/bin/bash
declare -a services
services=(httpd rsyslog sshd)
HOSTNAME=/usr/bin/hostname
MAILX=/usr/bin/mailx
PS=/usr/bin/ps
WC=/usr/bin/wc
GREP=/bin/grep
ECHO=/usr/bin/echo
BASENAME=/usr/bin/basename
DATE=/usr/bin/date
DATETIME=$(date '+%F %T')
TEE=/usr/bin/tee
LOGFILE=/var/tmp/BashLogDir/$(${BASENAME} $0)_$(${DATE} '+%F').log2
mailTo=muruganbcamba@gmail.com

for serviceName in ${services[@]}
do
  serviceCount=$(${PS} auxf| ${GREP} ${serviceName} | ${GREP} -v grep | ${GREP} -v ${0} | ${WC} -l)
  ${ECHO} "${DATETIME} : $(${HOSTNAME}) Process count value for ${serviceName} is : ${serviceCount}" | ${TEE} -a ${LOGFILE}

  if [[ ${serviceCount} -eq 0 ]] ; then
     ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service is NOT RUNNING" | ${TEE} -a ${LOGFILE}
     ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service is NOT RUNNING" | ${MAILX} -s "Alert service ${serviceName} status" ${mailTo}
  else
     ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service IS RUNNING" | ${TEE} -a ${LOGFILE}
     ${ECHO} "${DATETIME} : $(${HOSTNAME}) ${serviceName} service IS RUNNING"
  fi
done
[root@ansible-control-node bash_automation]#
--------------------------------------------------------------------------------------------------------------------------------------------------
