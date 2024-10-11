sed -n '3p' /etc/passwd     # Print 3rd line
sed -n '3,10p' /etc/passwd  # Print 3rd to 10th line
sed -n '3,$p' /etc/passwd   # Print 3rd to until last line
sed -n '$p' /etc/passwd     # Print last line
sed -n '1,+3p' /etc/passwd   # Print 1st line and next 3 lines
sed -n '1~3p' /etc/passwd    # Print every third line starting from the first line in the /etc/passwd file.
sed -n '/root/p' /etc/passwd  # Print lines from the /etc/passwd file that contain the string “root”
----------------------------------------------------------------------------------------------
start=4
end=7
sed -n "${start},{end}p" /etc/passwd
sed -n "${start},${end}p" /etc/passwd
sed -n '4,7p' /etc/passwd
-----------------------------------------------------------------------------------------------
sed -i '1i ip_addr1 ip_addr2 ip_addr3 ip_addr4' random_ips.txt                                          # Inserting line specified in the single quotes in the first line. 1i refers "insert in the first line"
sed -i.bak '1i ip_addr1 ip_addr2 ip_addr3 ip_addr4' random_ips.txt                                      # Take backup of file and Inseart lines specified in the single quotes in the first line. 
sed -i '1a -------- -------- -------- --------' random_ips.txt                                          # Append line specified in the single quotes after first line.
sed -i '$a -------------- -------------- -------------- --------------' random_ips.txt                  # Append line specified in the single quotes in the last row.
sed -i '/192.1688.76.11/a 192.1688.66.11 192.1688.66.12 192.1688.66.13 192.1688.66.14' random_ips.txt   # Append line specified in the single quotes after the line starts with "192.1688.76.11"
sed -i '/192.1688.96.11/i 192.1688.55.11 192.1688.55.12 192.1688.55.13 192.1688.55.14' random_ips.txt   # Insert line specified in the single quotes before the line starts with "192.1688.76.11"
sed -i '1d' passwd.txt                                                                                  # Removes the first line
sed -i '1,10d' passwd.txt                                                                               # Removes the first 10 lines
sed -i '2,+10d' passwd.txt
sed -i '1~3d' passwd.txt                                                                                # Removes every third line starting from the first line in the file passwd.txt.
sed -i '$d' passwd.txt                                                                                  # Removes last line from file
sed -i '$!d' passwd.txt                                                                                 # Removes all lines except last line
sed -i '/root/d' passwd.txt                                                                             # Removes line which contains root
sed -i '/nologin/d' passwd.txt                                                                          # Removes line which contains nologin






 
