# Powershell Script
# SYS-320 - Ben W
# List processes not in system32

Get-Process | Where-Object { $_.Path -notlike "*system32*" } | Select-Object ProcessName, Path