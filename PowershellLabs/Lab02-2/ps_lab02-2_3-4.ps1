# Powershell Script
# SYS-320 - Ben W

Get-WmiObject -list | ? { $_.Name -ilike "Win32_Net*" } | Sort-Object