#!/bin/bash
if [ $1 -gt 250 ]
then
  echo "You have entered a number that is greater than 250"
else
  echo "You have entered a number that is lesser than 250"
fi

# $1 is the command line argument. User needs to provide any number when executing this script. Ex: ./if_else_condition.sh 34
