# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

. .\ScrapeFunction.ps1

$table = gatherClasses

$FullTable = daysTranslator $table

# $FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" | ? { $_."Instructor" -ilike "Furkan*" }

# $FullTable | ? { ($_.Location -ilike "JOYC 310") -and($_.Days -contains "Monday") } | Sort-Object "Time Start" | Select-Object "Time Start", "Time End", "Class Code"

$ITSInstructors = $FulLTable | ? { ($_."Class Code" -ilike "SYS*") -or `
                                   ($_."Class Code" -ilike "NET*") -or `
                                   ($_."Class Code" -ilike "SEC*") -or `
                                   ($_."Class Code" -ilike "FOR*") -or `
                                   ($_."Class Code" -ilike "CSI*") -or `
                                   ($_."Class Code" -ilike "DAT*") } `
                             | Select-Object "Instructor" `
                             | Sort-Object "Instructor" -Unique

$FullTable | ? { $_.Instructor -in $ITSInstructors.Instructor } `
           | Group-Object "Instructor" | Select-Object Count, Name `
           | Sort-Object Count -Descending
