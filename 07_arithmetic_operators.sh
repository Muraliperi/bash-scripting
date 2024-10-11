#!/bin/bash
x=$1
y=$2
results=$((x+y))
echo "The addition of $x and $y is: $results"
----------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat scr.sh
#!/bin/bash
b=300
c=`expr $a + $b`
echo "c value is: $c"
[root@ansible-control-node bash_automation]# sh scr.sh
c value is: 300
[root@ansible-control-node bash_automation]#
----------------------------------------------------------------
root@ansible-control-node bash_automation]# echo $((23 + 78))
101
[root@ansible-control-node bash_automation]# echo $((23 - 78))
-55
[root@ansible-control-node bash_automation]# echo $((23 * 78))
1794
[root@ansible-control-node bash_automation]# echo $((23 / 78))
0
[root@ansible-control-node bash_automation]#
