# cat tr_cmd_convert_str_to_lower_upper.sh
[root@ansible-control-node ]# myshell=SHELL
[root@ansible-control-node ]# echo ${myshell} |tr '[A-Z]' '[a-z]'
shell
[root@ansible-control-node ]# myhome=home
[root@ansible-control-node ]# echo ${myhome} |tr '[a-z]' '[A-Z]'
HOME
[root@ansible-control-node ]# echo ${myhome} |tr '[a-z]' '[A-Z]'|tr '[A-Z]' '[a-z]'
home
[root@ansible-control-node ]#
[root@ansible-control-node bash_automation]# echo "Hello, How are you ?" | tr '[a-e]' '[A-E]'
HEllo, How ArE you ?
[root@ansible-control-node bash_automation]# java -version 2>&1 | head -1 | awk '{print $3}'
"1.8.0_362"
[root@ansible-control-node bash_automation]# java -version 2>&1 | head -1 | awk '{print $3}' | tr -d '"'
1.8.0_362
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]# ps auxf|grep httpd | grep -v grep | awk '{print $2}'
20231
20232
20233
20234
20235
[root@ansible-control-node bash_automation]# ps auxf|grep httpd | grep -v grep | awk '{print $2}' | tr '\n' ' '
20231 20232 20233 20234 20235 
[root@ansible-control-node bash_automation]#
