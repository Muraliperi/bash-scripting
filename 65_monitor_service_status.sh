#!/bin/bash
service_name="httpd.service"
A=`/usr/bin/systemctl is-active ${service_name}`
E=`/usr/bin/systemctl is-enabled ${service_name}`
RESULT=5
if [[ ${A} == "active" ]] && [[ ${E} == "enabled" ]] ; then
   RESULT=0
   echo "${service_name} is active and enabled. Status code is : ${RESULT}"
elif [[ ${A} == "inactive" ]] && [[ ${E} == "disabled" ]] ; then
   RESULT=1
   echo "${service_name} is inactive and disabled. Status code is : ${RESULT}"
elif [[ ${A} == "active" ]] && [[ ${E} == "disabled" ]] ; then
   RESULT=2
   echo "${service_name} is active and disabled. Status code is : ${RESULT}"
elif [[ ${A} == "inactive" ]] && [[ ${E} == "enabled" ]] ; then
   RESULT=3
   echo "${service_name} is inactive and enabled. Status code is : ${RESULT}"
else
   echo "${service_name} status is unknown. Status code is: ${RESULT}"
fi
