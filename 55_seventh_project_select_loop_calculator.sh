#!/bin/bash
#read -rp "Enter num1 : " num1
#read -rp "Enter num2 : " num2

PS3="Select your option to perform arithmetic operations : "

select operation in addition subraction multiplication division stop
do
   case $operation in
        addition)
                read -rp "Enter num1 : " num1
                read -rp "Enter num2 : " num2
                result=$((num1+num2))
                echo "Addition of ${num1} and ${num2} is : ${result}"
                ;;
        subraction)
                read -rp "Enter num1 : " num1
                read -rp "Enter num2 : " num2
                result=$((num1-num2))
                echo "Addition of ${num1} and ${num2} is : ${result}"
                ;;
        multiplication)
                read -rp "Enter num1 : " num1
                read -rp "Enter num2 : " num2
                result=$((num1*num2))
                echo "Addition of ${num1} and ${num2} is : ${result}"
                ;;
        division)
                read -rp "Enter num1 : " num1
                read -rp "Enter num2 : " num2
                if [[ ${num2} -eq 0 ]]; then
                    echo "${num1} cannot be devided by zero ${num2}"
                    echo "Provide non-zero number"
                    continue
                else
                    result=$((num1+num2))
                    echo "Addition of ${num1} and ${num2} is : ${result}"
                fi
                    ;;
        stop)
                break
                ;;
        *)
          echo "The script doesn't have logic to perform operation for this Input"
          echo "You can develop logic in this script and provide your input"
          ;;
   esac
done
