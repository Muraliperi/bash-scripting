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
