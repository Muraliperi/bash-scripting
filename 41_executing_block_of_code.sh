#!/bin/bash
# with the block of code we are skipping erros for echo commands when nginx not Found
# with block
echo "with block"
echo "-----------------------------------------------"
command -v nginx && { echo "nginx is installed"; nginx -V; }
echo "-----------------------------------------------"
# without block of code we are getting error
echo "Without block"
echo "-----------------------------------------------"
command -v nginx && echo "nginx is installed"; nginx -V
echo "-----------------------------------------------"
