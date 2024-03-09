# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

function accessLogs($file) {
    
    $rawLog = Get-Content $file

    # IP, Time, Method, Page, Protocol, Response, Referrer

    $regex = [regex] "^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*"

    $ips = $regex.Matches($rawLog)

    # Empty array to hold results
    $FullTable = @()

    for ($i=0; $i -lt $rawLog.Count; $i++) {
        
        $log = $rawLog[$i].Split(" ")

        $FullTable += [pscustomobject]@{      "IP" = $log[0];
                                            "Time" = $log[3].Trim('[');
                                          "Method" = $log[5].Trim('"');
                                            "Page" = $log[6];
                                        "Protocol" = $log[7];
                                        "Response" = $log[8];
                                        "Referrer" = $log[10];
                                       }


    }

    return $FullTable
}

#accessLogs ./access.log | Format-Table -AutoSize -Wrap | Out-String