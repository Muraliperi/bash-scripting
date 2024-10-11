#!/bin/bash
# Check if a given number is odd, even or zero
echo "Enter a number:"
read a
if [ $a == 0 ]; then
   echo "The given number is Zero"
elif [ `expr $a % 2` == 0 ]; then
   echo "The number is even"
else
   echo "The number is odd"
fi
--------------------------------------------------------------------------------
#!/bin/bash
read -p "Enter your age: " age
if [ $age -le 13 ]; then
   echo "You are a Child"
elif [ $age -gt 13 ] && [ $age -le 18 ]; then
   echo "You are a Teenager"
elif [ $age -gt 18 ] && [ $age -le 45 ]; then
   echo "You are an Adult"
else
   echo "You are Old"
fi
--------------------------------------------------------------------------------
#!/bin/bash
read -p "Enter your name:" name
if test $name = "john"
then
   echo "You are not selected $name"
elif [ $name = "murali" ]; then
   echo "You are selected $name and congratulations for your successful journey!"
elif [ $name != "john" ] || [ $name != "murali" ] && [ ! -z $name ]; then
   echo "Sorry, you are not selected $name"
elif [ -z $name ]; then
   echo "Please enter your name, Name cannot be empty"
fi
--------------------------------------------------------------------------------
#!/bin/bash
echo "Enter your Age:"
read age
if [ $age -lt 20 ] || [ $age -gt 50 ]; then
   echo "Sorry, You are out of Age criteria !"
elif [ $age -gt 20 ] && [ $age -lt 30 ]; then
   echo "You are in 20's generation"
elif [ $age -gt 30 ] && [ $age -lt 40 ]; then
   echo "You are in 30's generation"
elif [ $age -gt 40 ] && [ $age -lt 50 ]; then
   echo "You are in 40's generation"
elif [ $age == 20 ]; then
   echo "You are in 20's generation"
elif [ $age == 30 ]; then
   echo "You are in 30's generation"
elif [ $age == 40 ]; then
   echo "You are in 40's generation"
else
   echo "You are in 50's generation"
fi
------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat if_elif_else_install_pkg.sh
#!/bin/bash
pkgname="${1}"
user_id="$(id -u)"
if [[ ${user_id} -ne 0 ]]; then
   echo "You need to become root user to execute this script, Please switch to root user"
   exit 1
fi

if [[ ${#} -ne 1 ]]; then
   echo "Please provide a package name to install"
   exit 2
fi

if command -v ${pkgname} 1>/dev/null 2>&1; then
   echo "Package ${pkgname} already installed. Skipping package installation"
   exit 3

else
   yum install ${pkgname} -y 1>/dev/null 2>&1
   exitStat="${?}"
   if [[ ${exitStat} -ne 0 ]]; then
      echo "Package installation failed"
   else
      echo "Package installed successfully"
   fi
fi
[root@ansible-control-node bash_automation]#
-----------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat if_elif_else_service_stat.sh
#!/bin/bash
serviceName=${1}
systemctl status ${serviceName} 1>/dev/null 2>&1
exitCode=$?

if [[ ${#} -eq 0 ]]; then
   echo "Provide a service name as input"
   echo "./<script_name> <service_name>"
   echo "ex. ./if_elif_else_service_stat.sh httpd"

elif [[ ${#} -ne 1 ]]; then
   echo "Provide only one service name as input"

elif [[ ${exitCode} -eq 4 ]]; then
   echo "${serviceName} is not Found"

elif [[ ${exitCode} -eq 3 ]]; then
   echo "${serviceName} is not running"

elif [[ "${exitCode}" -eq 0 ]]; then
   echo "${serviceName} is running"

else
   echo "Unknown error, exit code is ${exitCode}"
fi

# exit code 4 - Service is not found
# exit code 3 - Service is not running
# exit code 0 - Service is running
[root@ansible-control-node bash_automation]#
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
