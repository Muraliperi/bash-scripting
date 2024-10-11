#!/bin/bash
echo "Enter your password:"
read -s passwd
if [ "$passwd" == "redhat" ]; then
   echo "Password verified"
else
   echo "Password denied"
fi
-----------------------------------------------------------
#!/bin/bash
if [ $1 -gt 250 ]
then
  echo "You have entered a number that is greater than 250"
else
  echo "You have entered a number that is lesser than 250"
fi

# $1 is the command line argument. User needs to provide any number when executing this script. Ex: ./if_else_condition.sh 34
-----------------------------------------------------------
#!/bin/bash
if [ -f /tmp/testfile.txt ]
then
   echo "File exist"
else
   echo "File is missing"
fi

# [ -f file ] --> To validate file or path is a file or not
# [ -d file ] --> To validate file or path is a directory or not
# [ -e file ] --> To validate file exist or not
# [ -s file ] --> To validate file size is greater than zero or not
# [ -r file ] --> To validate file is having read permissions for the current user
# [ -w file ] --> To validate file is having write permissions for the current user 
# [ -x file ] --> To validate file is having execution permissions for the current user
