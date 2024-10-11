#!/bin/bash
read -rp "Enter a value: " a
read -rp "Enter b value: " b
echo "Provided a value is ${a} and b value is ${b}"
sum=$(bc <<< "${a}+${b}")
sub=$(bc <<< "${a}-${b}")
mul=$(bc <<< "${a}*${b}")
if [[ $b -eq 0 ]]; then
   echo "Division and Reminder calculation is not possible"
   div="Invalid"
   rem="Invalid"
else
   div=$(bc <<< "scale=2;${a}/${b}")
   rem=$(bc <<< "${a}%${b}")
fi
echo -e "sum is ${sum}\nsub is ${sub}\nmul is ${mul}\ndiv is ${div}\nrem is ${rem}"
