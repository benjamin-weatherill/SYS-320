# Powershell Script
# SYS-320 - Ben W
# List every process starting with "C"

Get-Process "C*" | Select ProcessName