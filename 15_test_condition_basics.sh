#!/bin/bash
file_state=$(test -a /etc/resolv.conf && echo "file exist" || echo "File doesn't exist")
echo "$file_state"
DEST=/tmp/bash_directory
[ ! -d $DEST ] && mkdir -p $DEST || echo "$DEST already exist"
echo "`ls -ld $DEST`"
