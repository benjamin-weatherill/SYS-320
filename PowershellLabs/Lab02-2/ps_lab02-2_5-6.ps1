# Powershell Script
# SYS-320 - Ben W

Get-CimInstance -ClassName Win32_NetworkAdapterConfiguration -Filter "DHCPEnabled=$true" | Select DHCPServer | Format-Table -hideTableHeaders