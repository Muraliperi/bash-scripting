#!/bin/bash
file_state=$(test -a /etc/resolv.conf && echo "file exist" || echo "File doesn't exist")
echo "$file_state"
DEST=/tmp/bash_directory
[ ! -d $DEST ] && mkdir -p $DEST || echo "$DEST already exist"
echo "`ls -ld $DEST`"
-------------------------------------------------------------------
test command, Conditional Statements.
a) The test command checks file types and compare values
b) Syntax: test condition && true || false
--> test 100 -gt 99 && echo "Yes, that's true." || echo "No, That's false."
    This command will print the text "Yes, that's true." Because 100 is greater than 9
--> test 100 -lt 99 && echo "Yes." || echo "No."
    This command will print the text "No.". Because 100 is not less than 99.
--> test -f /etc/hosts && echo "File Exists" || echo "File missing"
    This command will print text "File Exists" if /etc/hosts file exist on the server.
 test -f file or [[ -f file ]] --> To validate file or path is a file or not
 test –d file or [[ -d file ]] --> To validate file or path is a directory or not
 test -e file or [[ -e file ]] --> To validate file exist or not
 test -s file or [[ -s file ]] --> To validate file size is greater than zero or not
 test -r file or [[ -r file ]] --> To validate file is having read permissions for the current user
 test -w file or [[ -w file ]] --> To validate file is having write permissions for the current user 
 test -x file or [[ -x file ]] --> To validate file is having execution permissions for the current user
-------------------------------------------------------------------------------------------------
String Comparison:
 test -z string or [[ -z string ]] --> To validate string is null or not
 test -n string or [[ -n string]] --> To validate string is not null or not
 test str1 == str2 or [[ str1 == str2 ]] --> To validate two strings are equal or not
 test str1 = str2 or [[ str1 = str2 ]]
 test str1 != str2 or [[ str1 != str2 ]] --> To validate two strings are not equal or not
-------------------------------------------------------------------------------------------------
 Integer Numbers Comparison:
 test num1 –eq num2 or [[ num1 –eq num2 ]] --> To validate two numbers or equal or not
 test num1 –ne num2 or [[ num1 –ne num2 ]] --> To validate two numbers or not equal or not
 test num1 –lt num2 or [[ num1 –lt num2 ]] --> To validate num1 is less than num2 or not
 test num1 –le num2 or [[ num1 –le num2 ]] --> To validate num1 is less than or equal to num2
 test num1 –gt num2 or [[ num1 –gt num2 ]] --> To validate num1 is greater than num2 or not
 test num1 –ge num2 or [[ num1 –ge num2 ]] --> To validate num1 is greater than or equal to num
-------------------------------------------------------------------------------------------------
Numeric comparisions.
Operators are eq, ge, gt, le, lt, ne
1. **Equality (`-eq`)**: Checks if two numbers are equal.
2. **Non-Equality (`-ne`)**: Verifies if two numbers are not equal.
3. **Greater Than (`-gt`)**: Determines if the first number is greater than the second number.
4. **Less Than (`-lt`)**: Indicates whether the first number is less than the second number.
5. **Greater Than or Equal To (`-ge`)**: Checks if the first number is greater than or equal to the second number.
6. **Less Than or Equal To (`-le`)**: Tests if the first number is less than or equal to the second number.
