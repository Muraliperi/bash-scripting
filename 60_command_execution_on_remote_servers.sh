#!/bin/bash
reqCmd=${1}
myPass="abcd@1234"
while IFS=',' read serverName userName
do
    echo "Executing the command ${reqCmd} on ${serverName}"
    result=$(sshpass -p ${myPass} ssh -n -E /dev/null -o StrictHostKeyChecking=No ${userName}@${serverName} "${reqCmd}")
    if [[ $? -eq  0 ]] ; then
        echo "${userName} ${serverName} : ${result}"
    else
        echo "Failed to execute the command ${reqCmd} on ${serverName}"
    fi
done < <(cat remoteServers.txt | awk 'NR != 1 ')
----------------------------------------------------------------------------------------------------------------------------
[root@ansible-control-node bash_automation]# cat sample_Expect_to_autodetect_password.sh
#!/bin/bash
# AD-Hoc command to run any script for the server on which manual password input is needed
userName=root
serverName=rockylinux9
passWord=abcd@1234
reqCmd=${1}
expect -c "
          spawn ssh -o StrictHostKeyChecking=No ${userName}@${serverName} ${reqCmd}
          expect {
               "*password:*" {send $passWord\r ; interact }
          }
          exit
          "
[root@ansible-control-node bash_automation]#
