[root@ansible-control-node bash_automation]# cat find_version_with_case_statement.sh
#!/bin/bash
toolName=${1}
if [[ ${#} -ne 1 ]]; then
   echo "Enter any tool name in below format"
   echo "sh <scriptName> <toolName>"
   echo "Ex: sh find_version_with_case_statement.sh ansible"
   exit 1
fi

<< mycomm
if ! command -v ${toolName} 1>/dev/null 2>&1; then
   echo "${toolName} not found on this server"
   exit 2
fi
mycomm

case ${toolName} in
   docker )
           docker --version 2>&1 | awk 'NR==2 {print $3}'
           ;;

   ansible )
           ansible --version | awk 'NR==1 {print $3}' | tr -d ']'
           ;;

   httpd )
           httpd -v |awk 'NR==1 {print $3}' | cut -d '/' -f2
           ;;

   nginx )
           nginx -V 2>&1 | awk 'NR==1 {print $3}' | cut -d '/' -f2
           ;;

   java )
           java -version 2>&1 |awk 'NR==1 {print $3}' | tr -d '"'
           ;;

   * )
           echo "The script don't have the logic to find version for ${toolName} "
           echo "You can update a logic in this script, then try again"
           echo "File path is : /root/bash_automation/find_version_with_case_statement.sh"
esac



# docker --version 2>&1 | awk 'NR==2 {print $3}'
# ansible --version | awk 'NR==1 {print $3}' | tr -d ']'
# httpd -v |awk 'NR==1 {print $3}' | cut -d '/' -f2
# nginx -V 2>&1 | awk 'NR==1 {print $3}' | cut -d '/' -f2
# java -version 2>&1 |awk 'NR==1 {print $3}' | tr -d '"'
[root@ansible-control-node bash_automation]#
