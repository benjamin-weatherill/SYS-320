# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

$files=(ls -recurse -File)
$files | Rename-Item -newname { $_.name -replace ".csv", ".log" }
ls -file -Recurse
