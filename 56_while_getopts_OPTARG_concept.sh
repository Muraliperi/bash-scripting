[root@ansible-control-node bash_automation]# cat while_with_options2.sh
#!/bin/bash

while getopts :i:v:sf: opt
do
     echo "opt value is ${opt} and OPTARG value is ${OPTARG}"
     echo "----------------------------------------"
     case $opt in
        i) yum install ${OPTARG} -y
           echo "-----------------------------------------";;
        v) ${OPTARG} --version;;
        s) systemctl status httpd;;
        f) df -h ${OPTARG}
           echo "-----------------------------------------";;
        :) echo "You missed input/argument for your option -${OPTARG}"
           echo "Usage"
           echo "./while_with_options2.sh [-i pkgName] [-v toolName] [-s serviceName] [-f filesystemPath]"
           ;;
        \?) echo "Your option is invalid"
            echo "Usage"
            echo "./while_with_options2.sh [-i] [-v] [-s] [-f]"
     esac
done
------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat while_with_options3.sh
#!/bin/bash
usage() {
echo "Usage"
echo "./while_with_options3.sh [-u username] [-p password]"
return 1
}

while getopts :hu:p: opt
do
#   echo "opt value is ${opt} OPTARG value is ${OPTARG}"
   case ${opt} in
      u) userName=${OPTARG} ;;
      p) password=${OPTARG} ;;
      h) usage
         exit 1
         ;;
      :) echo "You missed to provided value for argument -${OPTARG}"
         usage
         ;;
     \?) echo "-${OPTARG} is an invalid option"
         usage
         exit 1
         ;;
   esac
done

if [[ -z ${userName} ]] ; then
   echo "Failed to get username .."
   exit 1
fi

if [[ -z ${password} ]]; then
   echo "Failed to get password .."
   exit 1
fi

cat << EOF
username: ${userName}
password: ${password}
EOF
[root@ansible-control-node bash_automation]#
