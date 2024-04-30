#!/bin/bash

if [[ -f "IOC.html" ]]; then
	echo Removing Old file
	rm IOC.html
fi

curl -O 10.0.17.5/IOC.html

grep "<td>" IOC.html | sed 's/<\/\?td>//g; s/^[[:space:]]*//' | awk 'NR%2==1' > ioc.txt
