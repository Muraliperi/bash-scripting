[root@ansible-control-node bash_automation]# cat function_to_install_packages.sh
#!/bin/bash
userid=$(id -u)
if [[ ${userid} -ne 0 ]] ; then
   echo "You must be root to perform this task"
   exit 1
fi

installPKG(){
   reqPKG=${1}
   if command -v ${reqPKG} 1>/dev/null 2>&1; then
       echo "${reqPKG} is already deployed"
   else
       echo "############# ${reqPKG} not found on this host ##################"
       echo "############# Installing ${reqPKG} on the host ##################"
       yum install ${reqPKG} -y
   fi
}

installPKG ${1}
#installPKG httpd
#installPKG vim
#installPKG nc
#installPKG docker
#installPKG python3-jenkins
<<mycomm

[root@ansible-control-node bash_automation]# source /root/bash_automation/function_to_install_packages.sh
 is already deployed
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# installPKG python3-jenkins
############# python3-jenkins not found on this host ##################
############# Installing python3-jenkins on the host ##################
Last metadata expiration check: 0:09:16 ago on Tue 17 Sep 2024 05:30:34
Installed:
  python3-jenkins-1.6.0-1.el8.noarch                 python3-kerberos-1.3.0-4.el8.x86_64                 python3-multi_key_dict-2.0.3-2.el8.noarch                 python3-pbr-5.1.2-3.el8.noarch
Complete!
[root@ansible-control-node bash_automation]#
mycomm
[root@ansible-control-node bash_automation]#
----------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat reuse_functions.sh
#!/bin/bash
source /root/bash_automation/function_to_validate_packages.sh
validatePKG ansible
validatePKG httpd
validatePKG jenkins
validatePKG kernel
[root@ansible-control-node bash_automation]#
----------------------------------------------------------------------------------------------------------------
