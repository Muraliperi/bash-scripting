[root@ansible-control-node bash_automation]# cat select_loop.sh
#!/bin/bash

PS3="Select your option to check service status: "

select option in docker httpd sshd nginx stop
do
   case $option in
      docker) systemctl status docker
              ;;
      httpd) systemctl status httpd
              ;;
      sshd) systemctl status sshd
              ;;
      nginx) systemctl status nginx
              ;;
      stop) break
              ;;
   esac
done

<< mycomm

[root@ansible-control-node bash_automation]# sh select_loop.sh
1) docker
2) httpd
3) sshd
4) nginx
5) stop
Select your option to check service status: 1
Unit docker.service could not be found.
Select your option to check service status: 2
● httpd.service - The Apache HTTP Server
   Loaded: loaded (/usr/lib/systemd/system/httpd.service; disabled; vendor preset: disabled)
   Active: inactive (dead)
     Docs: man:httpd.service(8)
Select your option to check service status: 3
● sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
   Active: active (running) since Wed 2024-09-18 06:05:54 EDT; 56min ago
     Docs: man:sshd(8)
           man:sshd_config(5)
 Main PID: 899 (sshd)
    Tasks: 1 (limit: 11015)
   Memory: 2.1M
   CGroup: /system.slice/sshd.service
           └─899 /usr/sbin/sshd -D -oCiphers=aes256-gcm@openssh.com,chacha20-poly1305@openssh.com,aes256-ctr,aes256-cbc,aes128-gcm@openssh.>

Sep 18 06:05:54 ansible-control-node systemd[1]: Starting OpenSSH server daemon...
Sep 18 06:05:54 ansible-control-node sshd[899]: Server listening on 0.0.0.0 port 22.
Sep 18 06:05:54 ansible-control-node sshd[899]: Server listening on :: port 22.
Sep 18 06:05:54 ansible-control-node systemd[1]: Started OpenSSH server daemon.
Select your option to check service status: 5
[root@ansible-control-node bash_automation]#

mycomm
[root@ansible-control-node bash_automation]#
