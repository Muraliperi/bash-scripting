#!/bin/bash
read -p "Enter web service name: " web_service
status=$(systemctl status $web_service|awk 'NR==3 {print $2}')
echo -e "The $web_service service status is \033[93m$status\033[0m"

#!/bin/bash
read -t 3 -p "Enter First number: " FN
read -t 3 -p "Enter Second number: " SN
echo "Your first number is $FN and Second number is $SN"

# -p PROMPT: Display a prompt before reading input.
# -t TIMEOUT: Set a time limit for input. If the user does not provide input within TIMEOUT seconds, read will return a non-zero status.
# -s: Silent mode. Do not echo input to the terminal (useful for passwords).
