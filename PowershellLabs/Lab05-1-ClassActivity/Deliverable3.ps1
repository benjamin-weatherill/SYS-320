# Powershell Script
# SYS-320 - Ben W

$scraped_page =Invoke-WebRequest -TimeoutSec 10 http://localhost/tobescraped.html

$scraped_page.Links | Select-Object outerText, href