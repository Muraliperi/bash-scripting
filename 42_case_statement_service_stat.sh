[root@ansible-control-node bash_automation]# cat case_statement_service_stat.sh
#!/bin/bash
serviceName=${1}

if [[ ${#} -eq 0 ]]; then
   echo "Provide a service name as input"
   echo "./<script_name> <service_name>"
   echo "ex. ./if_elif_else_service_stat.sh httpd"
elif [[ ${#} -ne 1 ]]; then
   echo "Provide only one service name as input"
fi

systemctl status ${serviceName} 1>/dev/null 2>&1
exitCode=$?

case ${exitCode} in
   4)
      echo "${serviceName} is not Found"
      ;;
   3)
      echo "${serviceName} is not running"
      ;;
   0)
      echo "${serviceName} is running"
      ;;
esac

# exit code 4 - Service is not found
# exit code 3 - Service is not running
# exit code 0 - Service is running
[root@ansible-control-node bash_automation]#
