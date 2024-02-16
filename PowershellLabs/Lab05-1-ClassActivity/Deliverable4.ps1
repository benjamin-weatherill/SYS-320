# Powershell Script
# SYS-320 - Ben W

$scraped_page =Invoke-WebRequest -TimeoutSec 10 http://localhost/tobescraped.html

$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select outerText

$h2s