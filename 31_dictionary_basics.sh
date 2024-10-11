[root@ansible-control-node bash_automation]# cat dictionaries_in_bash.sh
#!/bin/bash
# Declare dictionary variable
declare -A myDict
myDict=( [AnsiVersion]=12.13.0 [DockerVersion]=1.34.11 [ServerType]=Linux )
# Print all values from myDict variable
echo "${myDict[@]}"
# Print a particular value
echo "${myDict[ServerType]}"
# Print only keys
echo "${!myDict[@]}"
# Add a new Key
myDict[Distro]=CentOS
echo "${myDict[@]}"
[root@ansible-control-node bash_automation]# sh dictionaries_in_bash.sh
12.13.0 Linux 1.34.11
Linux
AnsiVersion ServerType DockerVersion
CentOS 12.13.0 Linux 1.34.11
[root@ansible-control-node bash_automation]#
-------------------------------------------------------------------------------
