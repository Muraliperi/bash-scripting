#!/bin/bash
welcome_function () {
echo -e "\e[31m ------------------------------------------------------------"
echo -e "Welcome to Automation tool, You can play with automation now.."
echo -e "------------------------------------------------------------\e[0m"
}
clear
while true
welcome_function
do
  echo -e "\e[32mEnter any number listed below:\e[0m"
  echo -e "\e[36m1. To perform Pre-checkouts\e[0m"
  echo -e "\e[36m2. Run Ad-Hoc commands\e[0m"
  echo -e "\e[36m3. Top 10 CPU consuming process\e[0m"
  echo -e "\e[36m4. Top 10 Memory consuming process\e[0m"
  echo -e "\e[36m5. User Administration\e[0m"
  echo -e "\e[31m0. Exit\e[0m"
  read number
  case $number in
       0)
       break
       ;;
       1)
       clear
       echo -e "\e[34mWelcome to Perform Pre-checkouts\e[0m"
       /root/bash_automation/scp_for_loop.sh
       echo -e "\e[34mPre-checkouts completed\e[0m"
       echo -e "\e[34mPlease check the directory under \e[0m" "\e[32m/root/bash_automation/fetched_info \e[0m"
       ;;
       2)
       clear
       echo -e "\e[34mWelcome to Perform Ad-Hoc commands\e[0m"
       /root/bash_automation/adhoc.sh
       ;;
       3)
       clear
       echo -e "\e[34mWelcome to Top 10 CPU consuming process\e[0m"
       /root/bash_automation/topcpu.sh
       ;;
       4)
       clear
       echo -e "\e[34mWelcome to Top 10 Memory consuming process\e[0m"
       /root/bash_automation/topmem.sh
       ;;
       5)
       clear
       echo -e "\e[34mWelcome to User Administration\e[0m"
       ;;
  esac
done
