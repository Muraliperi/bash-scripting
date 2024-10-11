#!/bin/bash
set -x
echo "Todays date is $(date)"
echo "System uptime is $(uptime)"
set +x
echo "system name is $(uname -a)"
echo "This month calendar is $(cal)"
