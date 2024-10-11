#!/bin/bash
read -p "Enter web service name: " web_service
status=$(systemctl status $web_service|awk 'NR==3 {print $2}')
echo -e "The $web_service service status is \033[93m$status\033[0m"
