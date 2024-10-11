#!/bin/bash
read -p "Enter web service name: " web_service
status=$(systemctl status $web_service|awk 'NR==3 {print $2}')
echo -e "The $web_service service status is \033[93m$status\033[0m"

#!/bin/bash
read -t 3 -p "Enter First number: " FN
read -t 3 -p "Enter Second number: " SN
read -s -p "Enter your password: " mypass
echo "Your password is: $mypass"
echo -e "\n"
echo "Your first number is $FN and Second number is $SN"

#!/bin/bash
fruits="Apple Orange Mango"
echo $fruits
read -r fruit1 fruit2 fruit3 <<< $fruits
echo $fruit1
echo $fruit2
echo $fruit3

###############################################################################################################
#!/bin/bash
# -p refers to print/prompt input statement, \t \n \v will be eliminated with this option
read -p "Enter your name: " myname

# -r To get special characters in the input such as \t \n \v
read -rp "Enter your date of Birth: " myDOB

# -s To make input's invisible to the user. This is used for password inputs
# It is recommended to update echo after using -s option as it removes new line creation by default
read -srp "Enter your password: " mypasswd
echo

# When you did not mention any variable name in read command, by defaul the input values are stored in $REPLY variable
read -rp "Enter any value: "

# You can get two inputs in single line with read command.
read -rp "Enter you First name and Last name: " fname lname

# You can use IFS field separator to split the inputs based on the Separator you mentioning
IFS=":" read -rp "Enter you FirstName:LastName: " fNAME lNAME


# Printing the outputs
echo "My name is ${myname}, Date of Birth is ${myDOB} and password is ${mypasswd}"
echo "My value is ${REPLY}"
echo "My First name is: ${fname}"
echo "My Last name is: ${lname}"
echo "My 2nd First name: ${fNAME}"
echo "My 2nd Last name: ${lNAME}"
###################################################################################################################
