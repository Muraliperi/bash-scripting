[root@ansible-control-node bash_automation]# cat function_to_validate_packages.sh
#!/bin/bash
validatePKG() {
  if command -v ${1} 1>/dev/null 2>&1 ; then
     echo "Tool for $(command -v ${1}) already deployed"
     return 0
  else
     echo "Tool for $(command -v ${1}) not Found"
     return 1
  fi
}

<< mycomm
Output:
[root@ansible-control-node bash_automation]# source /root/bash_automation/function_to_validate_packages.sh
[root@ansible-control-node bash_automation]# validatePKG ansible
Tool for /usr/bin/ansible already deployed
[root@ansible-control-node bash_automation]#

mycomm
[root@ansible-control-node bash_automation]#
