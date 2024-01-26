# Powershell Script
# SYS-320 - Ben W
# List stopped services alphebetically and save to csv

Get-Service | Where-Object { $_.Status -ilike "Stopped" } | Select-Object Name, DisplayName | ConvertTo-Csv