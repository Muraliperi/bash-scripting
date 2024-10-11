[root@ansible-control-node bash_automation]# cat rediction_operators_STDIN_STDOUT_STDERR.sh
#bin/bash
<< mycomm
1) <<<  This three less than symbol used for STDIN, Inputting string
[root@ansible-control-node bash_automation]# cat /etc/passwd |grep games
games:x:12:100:games:/usr/games:/sbin/nologin
[root@ansible-control-node bash_automation]# cut -d ':' -f1 <<< "games:x:12:100:games:/usr/games:/sbin/nologin"
games
[root@ansible-control-node bash_automation]# echo "games:x:12:100:games:/usr/games:/sbin/nologin" | cut -d ':' -f1
games
[root@ansible-control-node bash_automation]# cut -d ':' -f1 <<< $(cat /etc/passwd |grep games)
games
[root@ansible-control-node bash_automation]# username=$(cut -d ':' -f1 <<< $(cat /etc/passwd |grep games))
[root@ansible-control-node bash_automation]# echo $username
games
[root@ansible-control-node bash_automation]#

mycomm

<<mycommone
# redicting success output into 'success.log' and error output into 'error.log'
mkdir /root/testdir 1>success.log 2>error.log
cat success.log
cat error.log
touch testfile 1>success.log 2>error.log
cat success.log
cat error.log
cat /etc/passwd 1>success.log 2>error.log
cat success.log
cat error.log
ls -lrt 1>lsout.log 2>lserr.log
ls -lrt 1>lsout.log 2>lsout.log
ls -lrt 1>lsout.log 2>&1

# redirecting success output into lsout.log and nullifying error log
ls -lrt /home/ansuser 1>lsout.log 2>/dev/null
mycommone

<<mycommtwo
1) Printing ansible version
[root@ansible-control-node bash_automation]# ansible --version
ansible [core 2.16.3]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/root/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/lib/python3.12/site-packages/ansible
  ansible collection location = /root/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/bin/ansible
  python version = 3.12.1 (main, Feb 21 2024, 14:18:26) [GCC 8.5.0 20210514 (Red Hat 8.5.0-21)] (/usr/bin/python3.12)
  jinja version = 3.1.2
  libyaml = True
[root@ansible-control-node bash_automation]#

2) Filtering ansible version
[root@ansible-control-node bash_automation]# ansible --version | awk 'NR==1'
ansible [core 2.16.3]
[root@ansible-control-node bash_automation]#

3) Printing java version
[root@ansible-control-node bash_automation]# java -version
openjdk version "1.8.0_362"
OpenJDK Runtime Environment (build 1.8.0_362-b08)
OpenJDK 64-Bit Server VM (build 25.362-b08, mixed mode)

4) Trying to filter java version but it fails, because by default java -version command provides error outputs.
[root@ansible-control-node bash_automation]# java -version | awk 'NR==1'
openjdk version "1.8.0_362"
OpenJDK Runtime Environment (build 1.8.0_362-b08)
OpenJDK 64-Bit Server VM (build 25.362-b08, mixed mode)
[root@ansible-control-node bash_automation]#

5) When we are nullyfying error output in java -version command, we are not getting any output.
[root@ansible-control-node bash_automation]# java -version 2>/dev/null
[root@ansible-control-node bash_automation]#

6) We can redirect error output into the success output, then we sould be able to fetch java -version
[root@ansible-control-node bash_automation]# java -version 2>&1 |awk 'NR==1'
openjdk version "1.8.0_362"
[root@ansible-control-node bash_automation]#
mycommtwo
[root@ansible-control-node bash_automation]#
