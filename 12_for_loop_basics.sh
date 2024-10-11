# For loop for scp
#!/bin/bash
for i in `cat /root/bash_automation/hosts`
do
scp -p $i:/tmp/log/*_system_info.log /root/bash_automation/fetched_info
done


