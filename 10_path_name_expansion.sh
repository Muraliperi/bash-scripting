[root@ansible-control-node bash_automation]# ls -l /etc/sysctl.conf /etc/yum.conf /etc/resolv.conf
-rw-r--r--. 1 root root  89 Sep  2 03:57 /etc/resolv.conf
-rw-r--r--. 1 root root 449 Apr 12 07:40 /etc/sysctl.conf
lrwxrwxrwx. 1 root root  12 Oct 16  2023 /etc/yum.conf -> dnf/dnf.conf
[root@ansible-control-node bash_automation]# ls -l /etc/{sysctl.conf,yum.conf,resolv.conf}
-rw-r--r--. 1 root root  89 Sep  2 03:57 /etc/resolv.conf
-rw-r--r--. 1 root root 449 Apr 12 07:40 /etc/sysctl.conf
lrwxrwxrwx. 1 root root  12 Oct 16  2023 /etc/yum.conf -> dnf/dnf.conf
[root@ansible-control-node bash_automation]# ls -l /etc/{sysctl,yum,resolv}.conf
-rw-r--r--. 1 root root  89 Sep  2 03:57 /etc/resolv.conf
-rw-r--r--. 1 root root 449 Apr 12 07:40 /etc/sysctl.conf
lrwxrwxrwx. 1 root root  12 Oct 16  2023 /etc/yum.conf -> dnf/dnf.conf
[root@ansible-control-node bash_automation]#
