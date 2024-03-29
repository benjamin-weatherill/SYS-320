#! /bin/bash

file="/var/log/apache2/access.log"

result=$(cat $file | grep "page2.html " | awk '{print $1,$7}' | tr -d '/')

echo "$result"
