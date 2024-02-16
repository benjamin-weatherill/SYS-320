# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

. .\ScrapeFunction.ps1

$table = gatherClasses

$FullTable = daysTranslator $table

$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | ? { $_."Instructor" -ilike "Furkan*" }
