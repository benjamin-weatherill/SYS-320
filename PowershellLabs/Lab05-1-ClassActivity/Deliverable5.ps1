# Powershell Script
# SYS-320 - Ben W

$scraped_page =Invoke-WebRequest -TimeoutSec 10 http://localhost/tobescraped.html

$divs = $scraped_page.ParsedHtml.body.getElementsByTagName("div") | ? {$_.getAttributeNode("class").Value -ilike "div-1" } | Select innerText

$divs