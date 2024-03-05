cd $PSScriptRoot

. .\configuration.ps1
. .\email.ps1
. .\scheduler.ps1
. .\Event-Logs.ps1

# Obtaining Configuration
$configuration = readConfiguration

# Obtaining at risk users
$Failed = atRiskUsers $configuration.Days

# Sending at risk users as email
SendAlertEmail($Failed | Format-Table | Out-String)

#Setting the script to be run daily
ChooseTimeToRun($configuration.ExecutionTime)

