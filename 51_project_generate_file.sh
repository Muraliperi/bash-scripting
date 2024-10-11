[root@ansible-control-node bash_automation]# cat for_loop2.sh
#!/bin/bash

inputFile=${1}

if [[ ${#} -eq 0 ]]; then
   echo "Please input a file name as input"
   echo "Ex:./ <script_name> <file_name>"
   echo "./for_loop.sh /tmp/testfile.txt"
   exit 1
elif [[ ${#} -gt 1 ]]; then
   echo "Please do not input more than one File, Follow below syntax"
   echo "Ex:./ <script_name> <file_name>"
   echo "./for_loop.sh /tmp/testfile.txt"
   exit 2
fi

if [[ -e ${inputFile} ]]; then
   echo "Provided input file ${inputFile} is exist on this host"
else
   echo "Provided input file ${inputFile} not Found"
   exit 3
fi

if [[ ! -s ${inputFile} ]] ; then
   echo "But, Sorry.. The ${inputFile} file is empty. Exiting.."
   exit 4
fi

outputFile=$(basename ${inputFile}.out)

if [[ -e ${outputFile} ]]; then
   rm -f ${outputFile}
fi

echo "SName   :  Environement" | tee -a ${outputFile}
for each in $(cat ${inputFile})
do
        sName=$(echo ${each} | cut -d '.' -f1)
        environment=$(echo ${each} | cut -d '.' -f2)
        echo "${sName} :   ${environment}" | tee -a ${outputFile}

done
echo "Please check output by executing: cat ${outputFile}"
[root@ansible-control-node bash_automation]#
