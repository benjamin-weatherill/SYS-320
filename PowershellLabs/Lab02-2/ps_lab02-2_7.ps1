# Powershell Script
# SYS-320 - Ben W

(Get-DNSClientServerAddress -AddressFamily IPv4 | ? { $_.InterfaceAlias -ilike "Ethernet0" }).ServerAddresses[0]