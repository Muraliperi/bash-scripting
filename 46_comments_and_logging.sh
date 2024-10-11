[root@ansible-control-node bash_automation]# cat comments_and_logging.sh
#!/bin/bash
# This script sending DevOps tool information to mail ID muruganbcamba@gmail.com

COMMAND=/bin/command
CAT=/bin/cat
AWK=/usr/bin/awk
DOCKER=/bin/docker
TR=/usr/bin/tr
CUT=/bin/cut
MAILX=/bin/mailx
ECHO=/bin/echo
TEE=/bin/tee
LOG_DIR=/var/log/scriptlog/devopsinfo.log
DATE=$(date '+%F %T')
HOSTNAME=$(hostname)

echo "Validating docker tool" | ${TEE} -a ${LOG_FILE}
if ! command -v docker 1>/dev/null 2>&1; then
   dockerVer="Not Found"
   echo "${HOSTNAME}: ${DATE} Docker version is ${dockerVer}" | ${TEE} -a ${LOG_DIR}
else
   dockerVer=$( docker --version 2>&1 | "${AWK}" 'NR==2 {print $3}' )
   echo "${HOSTNAME}: ${DATE} Docker version is ${dockerVer}" | ${TEE} -a ${LOG_DIR}
fi

echo "Validating ansible tool" | ${TEE} -a ${LOG_FILE}
if ! command -v ansible 1>/dev/null 2>&1; then
   ansibleVer="Not Found"
   echo "${HOSTNAME}: ${DATE} Ansible version is ${ansibleVer}" | ${TEE} -a ${LOG_DIR}
else
   ansibleVer=$( ansible --version | "${AWK}" 'NR==1 {print $3}' | "${TR}" -d ']' )
   echo "${HOSTNAME}: ${DATE} Ansible version is ${ansibleVer}" | ${TEE} -a ${LOG_DIR}
fi

echo "Validating apache tool" | ${TEE} -a ${LOG_FILE}
if ! command -v httpd 1>/dev/null 2>&1; then
   apacheVer="Not Found"
   echo "${HOSTNAME}: ${DATE} Apache version is ${apacheVer}" | ${TEE} -a ${LOG_DIR}
else
   apacheVer=$( httpd -v | "${AWK}" 'NR==1 {print $3}' | "${TR}" '/' ' ' | "${AWK}" '{print $2}' )
   echo "${HOSTNAME}: ${DATE} Apache version is ${apacheVer}" | ${TEE} -a ${LOG_DIR}
fi

echo "Validating nginx tool" | ${TEE} -a ${LOG_FILE}
if ! command -v nginx 1>/dev/null 2>&1; then
    nginxVer="Not Found"
    echo "${HOSTNAME}: ${DATE} Nginx version is ${nginxVer}" | ${TEE} -a ${LOG_DIR}
else
    nginxVer=$( nginx -V 2>&1 | "${AWK}" 'NR==1 {print $3}' | "${TR}" '/' ' ' | "${AWK}" '{print $2}' )
    echo "${HOSTNAME}: ${DATE} Nginx version is ${nginxVer}" | ${TEE} -a ${LOG_DIR}
fi

echo "Validating java tool" | ${TEE} -a ${LOG_FILE}
if ! command -v java 1>/dev/null 2>&1; then
    javaVer="Not Found"
    echo "${HOSTNAME}: ${DATE}Java version is ${javaVer}" | ${TEE} -a ${LOG_DIR}
else
    javaVer=$( java -version 2>&1 | "${AWK}" 'NR==1 {print $3}' | "${TR}" -d '"' )
    echo "${HOSTNAME}: ${DATE}Java version is ${javaVer}" | ${TEE} -a ${LOG_DIR}
fi

${ECHO} "ToolName            Version"
${ECHO} "Docker              ${dockerVer}"
${ECHO} "Ansible             ${ansibleVer}"
${ECHO} "Apache              ${apacheVer}"
${ECHO} "Nginx               ${nginxVer}"
${ECHO} "Java                ${javaVer}"

${CAT} << EOF | ${MAILX} -s "$(${ECHO} -e "DevOps Tools Info on $(hostname)\nContent-Type: text/html")" muruganbcamba@gmail.com
<!DOCTYPE html>
<html>

<head>
    <title>
         Automation By VRTechnologies
    </title>
</head>

<body>
    <h2>Please Find Below Table For DevOps Tools Versions </h1>
    <table border="1">
        <tr>
            <th>ToolName</th>
            <th>Version</th>
        </tr>
        <tr>
            <td>Docker</td>
            <td>${dockerVer}</td>
        </tr>
        <tr>
            <td>ansible</td>
            <td>${ansibleVer}</td>
        </tr>
        <tr>
            <td>Apache</td>
            <td>${apacheVer}</td>
        </tr>
        <tr>
            <td>java</td>
            <td>${javaVer}</td>
        </tr>
        <tr>
            <td>nginx</td>
            <td>${nginxVer}</td>
        </tr>
    </table>
</body>

EOF

[root@ansible-control-node bash_automation]#
