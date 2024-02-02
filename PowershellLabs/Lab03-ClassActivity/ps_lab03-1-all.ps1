# Powershell Script
# SYS-320 - Ben W

function Get-LogonEvent($daysOld) {

    $winlogon = Get-EventLog system -Source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$daysOld)

    $winlogonTable = @()

    for ($i=0; $i -lt $winlogon.count; $i++) {
    
        $event = "none"
        if ($winlogon[$i].InstanceId -eq "7001") { $event="Logon" } 
        if ($winlogon[$i].InstanceId -eq "7002")  { $event="Logoff" }

        $userid = $winlogon[$i].ReplacementStrings[1]

        $userid = New-Object System.Security.Principal.SecurityIdentifier($userid)

        $user = $userid.Translate([System.Security.Principal.NTAccount])

        $winlogonTable += [pscustomobject]@{"Time" = $winlogon[$i].TimeGenerated;
                                              "Id" = $winlogon[$i].InstanceId;
                                           "Event" = $event;
                                            "User" = $user;
                                            }
    }

    $winlogonTable
}

function Get-ShutdownEvent($daysOld) {
    $winlog = Get-EventLog system -InstanceId 2147489654 -After (Get-Date).AddDays(-$daysOld)

    $winlogTable = @()

    for ($i=0; $i -lt $winlog.count; $i++) {
    
        $event = "Shutdown"

        $user = "System"

        $winlogTable += [pscustomobject]@{"Time" = $winlog[$i].TimeGenerated;
                                            "Id" = $winlog[$i].EventID;
                                         "Event" = $event;
                                          "User" = $user;
                                         }
    }



    $winlogTable
}

function Get-StartupEvent($daysOld) {
    $winlog = Get-EventLog system -InstanceId 2147489653 -After (Get-Date).AddDays(-$daysOld)

    $winlogTable = @()

    for ($i=0; $i -lt $winlog.count; $i++) {
    
        $event = "Startup"

        $user = "System"

        $winlogTable += [pscustomobject]@{"Time" = $winlog[$i].TimeGenerated;
                                            "Id" = $winlog[$i].EventID;
                                         "Event" = $event;
                                          "User" = $user;
                                         }
    }



    $winlogTable
       
}