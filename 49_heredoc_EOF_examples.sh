[root@ansible-control-node bash_automation]# cat heredoc.sh
#!/bin/bash

#Multiline String
cat << EOF
FIRST LINE
SECOND LINE
EOF

myshell="bash"
cat << EOF1
myShell is ${myshell}
EOF1

# Variable and command expansion
cat << EOF2
${myshell}
$(whoami)
EOF2

# Escape Character (\)
cat << EOF4
\${myshell}
$(whoami)
EOF4

#Piping
cat << EOF5 | grep 'FIRST'
FIRST LINE
SECOND LINE
EOF5

#Redirect to a file
cat << EOF6 > /tmp/heredoc.txt
FIRST LINE
SECOND LINE
EOF6

if command -v docker 1>/dev/null 2>&1; then
   cat << EOF7
      Docker is installed
      Docker path is: $(command -v docker)
EOF7
fi
[root@ansible-control-node bash_automation]#

