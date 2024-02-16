# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

. .\ScrapeFunction.ps1

$table = gatherClasses

$FullTable = daysTranslator $table
