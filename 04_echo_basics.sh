#!/bin/bash
roll_no=4565
my_name="Murali Periyasamy"
ls_out="$(ls -lrt)"
echo -e "Welcome $my_name,\n Your roll no is $roll_no,\n on on $(date +"%d-%m-%y")"
echo -n "pwd files are listed below $ls_out"

# -n: Do not output the trailing newline. The output will be on the same line as the next command prompt.
# -e: Enable interpretation of backslash escapes. This allows you to use special characters like \n for a new line or \t for a tab.
