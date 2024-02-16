# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

. .\ScrapeFunction.ps1

$table = gatherClasses

$FullTable = daysTranslator $table

# $FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | ? { $_."Instructor" -ilike "Furkan*" }

$FullTable | ? { ($_.Location -ilike "JOYC 310") -and($_.Days -contains "Monday") } | Sort-Object "Time Start" | Select-Object "Time Start", "Time End", "Class Code"
