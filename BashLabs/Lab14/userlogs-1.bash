#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
	dateAndUser=$(cat "$authfile" | grep "authentication failure" | awk '{print $1,$2,$3,$15}' | awk -F'[=]' '{print $1,$2}' | awk '{print $1,$2,$3,$5}')
	echo "$dateAndUser"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: champben3@gmail.com" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp champben3@gmail.com 

# Send failed logins as email to yourself.
# Similar to sending logins as email 

echo "To: champben3@gmail.com" > emailform2.txt
echo "Subject: Failed Logins" >> emailform2.txt
echo -e "\n\n" >> emailform2.txt
getFailedLogins >> emailform2.txt
cat emailform2.txt | ssmtp champben3@gmail.com 

