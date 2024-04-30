#!/bin/bash

if [[ "$#" -ne 2 ]]; then
	echo "Usage: $0 <log_file> <ioc_file>"
	exit 1
fi

log_file="$1"
ioc_file="$2"

ioc_patterns=$(cat "$ioc_file")

if [[ -f "report.txt" ]]; then
	rm report.txt
fi


while IFS= read -r line; do

	ip=$(echo "$line" | awk '{print $1}')
	date=$(echo "$line" | awk -F'[][]' '{print $2}' | awk -F' ' '{print $1}') 
	file=$(echo "$line" | awk -F'"' '{print $2}' | awk '{print $2}')

	for ioc_pattern in $ioc_patterns; do
		if [[ $file == *"$ioc_pattern"* ]]; then
			echo "$ip $date $file" >> report.txt
			break
		fi
	done
done < "$log_file"
