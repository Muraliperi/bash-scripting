[root@ansible-control-node bash_automation]# cat grep_command_for_filtering.sh
#!/bin/bash
ansible --version
ansible --version|grep 'python'
ansible --version|grep -i 'PYTHON'    # -i Ignore case distinctions in patterns and input data.
ansible --version|grep -w 'python'    # -w Match whole words only.
ansible --version|grep -v 'python'    # -v Invert the match to select non-matching lines.
ansible --version|grep -c 'python'    # -c Count the number of matching lines
ansible --version|grep -n 'python'    # -n Prefix each line of output with the line number.
grep -A2 'ansuser' /etc/passwd        # Print the line where 'ansuser' keyword found and print next two lines . (A for After)
grep -A12 'ansuser' /etc/passwd       # Print the line where 'ansuser' keyword found and print next twelve lines .
grep -B2 'ansuser' /etc/passwd        # Print the line where 'ansuser' keyword found and print previous two lines . (B for Before )
grep -C2 'ansuser' /etc/passwd        # Print the line where 'ansuser' keyword found and print previous two lines & next two lines. (C is combination of A & B )
grep -C4 'ansuser' /etc/passwd        # Print the line where 'ansuser' keyword found and print previous four lines & next four lines. (C is combination of A & B )
grep -B4 'ansuser' /etc/passwd
cat /etc/passwd
grep -B4 'outbound' /etc/passwd
grep -B4 'unbound' /etc/passwd
clear
grep -B4 'unbound' /etc/passwd
grep -C4 'unbound' /etc/passwd
grep -A4 'unbound' /etc/passwd
grep -l 'root' /root/bash_automation/*
grep -h 'root' /root/bash_automation/*
ls -lrt | grep "^d"
clear
ls -lrt
ls -lrt | grep -v "^d"
ls -lrt | grep -v "^-"
ls -lrt | grep  "^-"
ansible --version|grep '^ansible'
ansible --version|grep 'ansible$'
java -version
java -version 2>&1
ansible --version
ansible --version|grep -E '[0-9]+\.[0-9]+\.[0-9]+'
ansible --version|grep -E '[0-9]+\.[0-9]+\.[0-9]+$'
ansible --version|grep -oE '[0-9]+\.[0-9]+\.[0-9]+$'
history -w /dev/stdout
[root@ansible-control-node bash_automation]# a
