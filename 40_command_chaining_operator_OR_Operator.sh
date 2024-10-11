# Check if nginx package installed, if not then install it.
command -v nginx 1>/dev/null 2>/dev/null || yum install nginx -y
which nginx 1>/dev/null 2>/dev/null || yum install nginx -y
which nginx 1>/dev/null 2>/dev/null  --> We are nullifying success output with 1>/dev/null
#                                          We are nullyfying error output with 2>/dev/null
# If first command succeeded then && AND operater will be executed thus "Nginx is installed on this Host" will be printed
# If first command failed then OR || operator will be executed thus "Nginx is not installed on this host" will be printed.
which nginx 1>/dev/null 2>/dev/null && echo "Nginx is installed on this Host" || echo "Nginx is not installed on this host"
command -v nginx 1>/dev/null 2>/dev/null && echo "Nginx is installed on this Host" || echo "Nginx is not installed on this host"
-----------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat install_package_if_not_Found_or_not_exist.sh
#!/bin/bash
# Check if package exist, if not install it
cmd=${1}
command -v ${cmd} 1>/dev/null 2>/dev/null && { echo "${cmd} is installed"; echo "Path of ${cmd} is $(command -v ${cmd})"; } || { echo "Installing package of ${cmd}"; yum install ${cmd} -y; }
[root@ansible-control-node bash_automation]# sh install_package_if_not_Found_or_not_exist.sh httpd
httpd is installed
Path of httpd is /usr/sbin/httpd
[root@ansible-control-node bash_automation]#
