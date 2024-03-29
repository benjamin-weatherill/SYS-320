#!/bin/bash

cat /var/log/apache2/access.log | awk '{print $7}' | sort | uniq -c

