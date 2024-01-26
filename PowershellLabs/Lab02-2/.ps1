# Powershell Script
# SYS-320 - Ben W

(Get-NetIPAddress -AddressFamily IPv4 | ? { $_.InterfaceAlias -ilike "Ethernet0" }).IPAddress