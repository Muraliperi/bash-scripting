#!/bin/bash
# Check if a given number is odd, even or zero
echo "Enter a number:"
read a
if [ $a == 0 ]; then
   echo "The given number is Zero"
elif [ `expr $a % 2` == 0 ]; then
   echo "The number is even"
else
   echo "The number is odd"
fi
--------------------------------------------------------------------------------
#!/bin/bash
echo "Enter your Age:"
read age
if [ $age -lt 20 ] || [ $age -gt 50 ]; then
   echo "Sorry, You are out of Age criteria !"
elif [ $age -gt 20 ] && [ $age -lt 30 ]; then
   echo "You are in 20's generation"
elif [ $age -gt 30 ] && [ $age -lt 40 ]; then
   echo "You are in 30's generation"
elif [ $age -gt 40 ] && [ $age -lt 50 ]; then
   echo "You are in 40's generation"
elif [ $age == 20 ]; then
   echo "You are in 20's generation"
elif [ $age == 30 ]; then
   echo "You are in 30's generation"
elif [ $age == 40 ]; then
   echo "You are in 40's generation"
else
   echo "You are in 50's generation"
fi
