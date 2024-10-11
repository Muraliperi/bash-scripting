#!/bin/bash
dirName=/var/tmp/BashLogDir
#dirName=/boot/
DATE=/usr/bin/date
LS=/usr/bin/ls
AWK=/usr/bin/awk
ECHO=/usr/bin/echo
TEE=/usr/bin/tee
MAILX=/usr/bin/mailx
LOGFILE=/var/tmp/BashOutDir/AppGen_"$(${DATE} '+%F')".log
toMail=muruganbcamba@gmail.com
latestFile=$(${LS} -lt ${dirName} | ${AWK} 'NR==2 {print $NF}')
latestFileAgeInSec=$(${DATE} -r ${dirName}/${latestFile} '+%s')
curDateAgeInSec=$(${DATE} '+%s')
ageCalculationRes=$((curDateAgeInSec-latestFileAgeInSec))
ageDiffInHour=$((ageCalculationRes/3600))
HOSTNAME=/usr/bin/hostname
SUBJECT="Application logfiles under ${dirName} is failed to generate on $(${HOSTNAME})"

if [[ ! -d ${dirName} ]] ;  then
   ${ECHO}  "Your directory ${dirName} not exist on $(${HOSTNAME})" |  ${MAILX} -s ${SUBJECT} ${toMail}
   exit 1
fi

if [[ -z ${LOGFILE} ]] ; then
   ${ECHO}  "Log file ${LOGFILE} not exist/not found on $(${HOSTNAME})" |  ${MAILX} -s ${SUBJECT} ${toMail}
   exit 2
fi
if [[ ${ageDiffInHour} -ge 24 ]] ; then
    ${ECHO}  "$(${HOSTNAME}) : Application IS NOT generating logs $(${DATE} '+%F%T')" | ${TEE} -a ${LOGFILE}
    ${ECHO}  "$(${HOSTNAME}) : Application IS NOT generating logs $(${DATE} '+%F%T')" | ${MAILX} -s ${SUBJECT} ${toMail}
    ${ECHO}  "Review log file from ${LOGFILE}"
    exit 3
else
    ${ECHO} "$(${HOSTNAME}) : Application IS generating logs $(${DATE} '+%F%T')" | ${TEE} -a ${LOGFILE}
    ${ECHO}  "Review log file from ${LOGFILE}"
   exit 0
fi
