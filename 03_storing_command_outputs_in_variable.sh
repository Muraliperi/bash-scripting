#!/bin/bash
#Type_1 using () open and close paranthesis
my_ls_out=$(ls)
#Type_2  using ` tilde symbol
my_ls_outs=`ls`
echo "First ls output is: $my_ls_out"
echo "Second ls output is: $my_ls_outs"
#Storing ls command output into a file using shell script
ls > ls_out_file_from_shell_scripting.txt

date_out=$(date +"%y-%m-%d")
log_filename=${date_out}.log
touch $log_filename
