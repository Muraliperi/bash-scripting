#!/bin/bash
ansible=$(ansible --version|awk 'NR==1 {print $3}'|cut -d ']' -f1)
httpd=$(httpd -v|awk 'NR==1 {print $3}')
openssh1=$(rpm -q openssh|cut -d '-' -f2)
openssh2=$(rpm -q openssh|cut -d '-' -f3)
echo "-----------------------------------------"
echo -e "| \033[4;33mTool-Name\033[0m       | \033[4;33mVersion\033[0m             |"
echo "|----------------------------------------"
echo "| Ansible Version | $ansible              |"
echo "| HTTPD Version   | $httpd       |"
echo "| OpenSSH Version | $openssh1-$openssh2 |"
echo "|----------------------------------------"
