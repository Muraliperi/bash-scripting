ls /etc/*.conf
ls /etc/r*.conf
touch abc.x def.x ghi.x
touch jkl.y mno.y ipq.y
ls *.x
ls *.y
ls *.{x,y}
touch file{1..10}.txt
touch file{1..10}.conf
ls file*
ls file?.txt
ls file?.conf
ls file?{.conf}
ls file?.conf
ls file?*.conf
ls file??.conf
touch file{11,13}.conf
ls file??.conf
touch file{11..13}.conf
ls file??.conf
ls [file]*.conf
ls [file]*.txt
history
history -w /dev/stdout
