# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

. .\ParseApacheLogs.ps1

ApacheLogs1  | Format-Table -AutoSize -Wrap