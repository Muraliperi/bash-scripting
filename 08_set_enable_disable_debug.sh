#!/bin/bash
set -x
echo "Todays date is $(date)"
echo "System uptime is $(uptime)"
set +x
echo "system name is $(uname -a)"
echo "This month calendar is $(cal)"
===========================================================================================================================================
using bash -x or -xv option on runtime.
bash -x scriptfile.sh
bash -xv scriptfile.sh
Debugging is the process of finding and fixing errors or bugs in the script
 There are different types of options
 set -n or bash -n --> Syntax Check
 set -u or bash -u --> To Know if any undefined variables are using
 set -v or bash –v --> Verbose Mode
 set -x or bash -x --> Display each step after substitution
We can pass these option as arguments with "bash" command.
bash -n get_PKG_path.sh
bash -u get_PKG_path.sh 
bash -v get_PKG_path.sh  --> This option is not recommended for error verbos, But to get the details of code and it's output this is useful.
bash -x get_PKG_path.sh

b) Alternatively you can update this option in shebang line.(But it is NOT recommended)
#!/bin/bash -x
#!/bin/bash -xv
c) When you want to execute only particular piece of subtask needs to be run in debug mode you can use set -x. Example is below code.
#!/bin/bash
set -x
echo "Todays date is $(date)"
echo "System uptime is $(uptime)"
set +x
echo "system name is $(uname -a)"
echo "This month calendar is $(cal)"

Note: set -x is to turn on the debug mode.
      set +x is to turn off the debug mode.
