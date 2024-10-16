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
-----------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat  get_PKG_path.sh
#!/bin/bash
# read -rp "Enter any package name: " pkgname
pkgname="${1}"
# rpm -q ${pkgname} 1>/dev/null 2>/dev/null && command -v ${pkgname} || echo "${pkgname} doesn't exit"
command -v ${pkgname} 1>/dev/null 2>/dev/null && echo "The path of ${pkgname} is: $(command -v ${pkgname})" || echo "${pkgname} is not Found"
[root@ansible-control-node bash_automation]#
-----------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat install_nc_pkg_if_not_exist.sh
#!/bin/bash
# Check if package exist, if not install it
pkgname=nc
echo "Verifying nc command installation...."
command -v ${pkgname} 1>/dev/null 2>/dev/null &&
{
  echo "${pkgname} is installed";
  echo "Path of ${pkgname} is $(command -v ${pkgname})";
  echo "Package ${pkgname} version is: $(nc --version 2>&1 |awk '{print $3}')";
} ||

{
  echo "${pkgname} command is not installed on this host.";
  echo "Installing ${pkgname} package";
  yum install ${pkgname} -y;
  echo "${pkgname} is installed now";
  echo "Package ${pkgname} version is: $(nc --version 2>&1 |awk '{print $3}')";
}
[root@ansible-control-node bash_automation]#
-----------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat read_file_content.sh
#!/bin/bash
filename=${1}
[[ "${#}" -eq 0 ]] && { echo "Please pass any arguments, ex: ./${0} /tmp/testfile.txt"; exit; }
[[ "${#}" -ne 1 ]] && { echo "You have to provide input as a File, ex: ./${0} /tmp/testfile.txt"; exit; }
[[ -d ${filename} ]] && { echo "${filename} is a directory, Please provide file path"; exit 1; }
[[ -e ${filename} ]] || { echo "File ${filename} not Found"; exit 1; }
[[ -r ${filename} ]] && cat "${filename}" || echo "You don't have permission for ${filename} File"
[root@ansible-control-node bash_automation]#
