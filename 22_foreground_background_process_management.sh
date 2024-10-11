26) Foreground process management.
a) "Run a while loop in foreground and press Ctrl + Z to change its status to Stopped."
'^C
[root@ansible-control-node ~]# (while true; do echo -n "Hello " >> /tmp/whileloopfile.txt;sleep 1;done)
^Z
[1]+  Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[root@ansible-control-node ~]# jobs
[1]+  Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[root@ansible-control-node ~]# (while true; do echo -n "Hello " >> /tmp/whileloopfile.txt;sleep 1;done)
^Z
[2]+  Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[root@ansible-control-node ~]# jobs
[1]   Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[2]   Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[root@ansible-control-node ~]# '

b) Execute bg command to resume/change the jobs status from Stopped to Running.
'
[root@ansible-control-node ~]# bg
[4]+ ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[root@ansible-control-node ~]# jobs
[1]   Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[2]-  Stopped                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[3]+  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
[root@ansible-control-node ~]# '

c) Press Ctrl + C to Terminate the foreground process.
'
[root@ansible-control-node ~]# (while true; do echo -n "Hello " >> /tmp/whileloopfile.txt;sleep 1;done)
^C
[root@ansible-control-node ~]# '

d) Execute fg command to view the foreground process and press Ctrl + C to terminate it.
'[root@ansible-control-node ~]# fg
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node ~]#

[root@ansible-control-node ~]# jobs
[1]   Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[2]   Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[3]-  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[4]+  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[root@ansible-control-node ~]# fg
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node ~]# fg
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node ~]# jobs
[1]-  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[2]+  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[root@ansible-control-node ~]# fg
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node ~]# jobs
[1]+  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[root@ansible-control-node ~]# fg
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node ~]#'

e) Execute fg command with % character to particularly terminate a job using its ID"

[root@ansible-control-node bash_automation]# fg %2
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node bash_automation]# jobs
[1]+  Running                 ( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done ) &
[root@ansible-control-node bash_automation]# fg %1
( while true; do
    echo -n "Hello " >> /tmp/whileloopfile.txt; sleep 1;
done )
^C
[root@ansible-control-node bash_automation]# jobs
