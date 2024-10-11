[root@ansible-control-node bash_automation]# cat find_version_with_if_elif_else_schedule_job_using_at_and_send_mail.sh
#!/bin/bash

COMMAND=/bin/command
CAT=/bin/cat
AWK=/usr/bin/awk
DOCKER=/bin/docker
TR=/usr/bin/tr
CUT=/bin/cut
MAILX=/bin/mailx
ECHO=/bin/echo

if ! command -v docker 1>/dev/null 2>&1; then
   dockerVer="Not Found"
else
   dockerVer=$( docker --version 2>&1 | "${AWK}" 'NR==2 {print $3}' )
fi

if ! command -v ansible 1>/dev/null 2>&1; then
   ansibleVer="Not Found"
else
   ansibleVer=$( ansible --version | "${AWK}" 'NR==1 {print $3}' | "${TR}" -d ']' )
fi

if ! command -v httpd 1>/dev/null 2>&1; then
   apacheVer="Not Found"
else
   apacheVer=$( httpd -v | "${AWK}" 'NR==1 {print $3}' | "${TR}" '/' ' ' | "${AWK}" '{print $2}' )
fi

if ! command -v nginx 1>/dev/null 2>&1; then
    nginxVer="Not Found"
else
    nginxVer=$( nginx -V 2>&1 | "${AWK}" 'NR==1 {print $3}' | "${TR}" '/' ' ' | "${AWK}" '{print $2}' )
fi

if ! command -v java 1>/dev/null 2>&1; then
    javaVer="Not Found"
else
    javaVer=$( java -version 2>&1 | "${AWK}" 'NR==1 {print $3}' | "${TR}" -d '"' )
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
