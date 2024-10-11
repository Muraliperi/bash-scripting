# dirname removes suffix from last slash / from the given path. Basically prints only directory path
[root@ansible-control-node bash_automation]# cat dirname_basename_to_remove_suffix_prefix_from_given_path.sh
#!/bin/bash
[root@ansible-control-node bash_automation]# dirname /root/bash_automation/slicing_string_based_on_range.sh /etc/hostname /var/log/messages
/root/bash_automation
/etc
/var/log
[root@ansible-control-node bash_automation]#

# basename removes prefix suffix path until it finds the last slash /. Basically prints only filename or directory name
[root@ansible-control-node bash_automation]# basename /root/bash_automation/slicing_string_based_on_range.sh
slicing_string_based_on_range.sh
[root@ansible-control-node bash_automation]# basename /etc/hostname /var/log/messages
hostname
[root@ansible-control-node bash_automation]# basename /etc/hostname
hostname
[root@ansible-control-node bash_automation]# basename /var/log/messages
messages
[root@ansible-control-node bash_automation]#
[root@ansible-control-node bash_automation]#
