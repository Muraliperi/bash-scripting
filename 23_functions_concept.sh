# We need to call the function to execte the function.
# Type_1 Add two numbers function.
#!/bin/bash
add ()
{
a=$1
b=$2
add_total=$(( a + b))
echo "The addition of $a and $b is: $add_total"
}
read -p "Enter two numbers: " num1 num2
add $num1 $num2
------------------------------------------------------------------
# Type_2 Nested function.
#!/bin/bash
first_function ()
{
echo "This is my First function"
second_function
}
second_function ()
{
echo "This is my Second function"
}
#Calling First function
first_function
------------------------------------------------------------------
# Type_3 function_check_file_directory_or_symbolic_link
#!/bin/bash -x
file=$1
identify () {
[ -f "$file" ] && { echo "$file is a regular file"; exit 0; }
[ -d "$file" ] && { echo "$file is a directory"; exit 0; }
[ -h "$file" ] && { echo "$file is a Symbolic-link File"; exit 0; }
}
[ $# -eq 0 ] && { echo "Kindly pass an argument, Ex: sh function_script.sh /tmp/testfile.txt"; exit 1; }
# Calling function
identify
-----------------------------------------------------------------
# Type_4 function_global_local_vars.sh
#!/bin/bash
a=10
b=20
c=70
add_fun () {
local   c=$(( a + b ))
echo "local var c value is: $c"
}
add_fun
echo "global var a value is: $a"
echo "global var b value is: $b"
echo "global var c value is: $c"
----------------------------------------------------------------
# Type_5 function_global_local_vars2.sh
#!/bin/bash
add_fun () {
local a=90
local b=70
local c=$(( a + b ))
echo "local var c value is: $c"
}
add_fun
echo "global var a value is: $a"
echo "global var b value is: $b"
echo "global var c value is: $c"
--------------------------------------------------------------
# Type_6 return in function
#!/bin/bash
add_function () {
a=10
b=12
c=$(( a + b ))
echo "c val is: $c"
return $c
}
add_function
echo $?
--------------------------------------------------------------
