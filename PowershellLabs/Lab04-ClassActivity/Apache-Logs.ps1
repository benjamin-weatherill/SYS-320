# Powershell Script
# SYS-320 - Ben W

function Apache-Logs {

    $page = $args[0]
    $httpCode = $args[1]
    $browserName = $args[2]

    $notfounds =  Get-Content C:\xampp\apache\logs\access.log | Select-String "$page" |  Select-String $httpCode | Select-String $browserName

    $regex = [regex] "^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*"

    $ips = @()

    for ($i=0; $i -lt $ipsUnorganized.Count; $i++){
        $ips += [pscustomobject]@{ "IP"  = $ipsUnorganized[$i].Value; }
    }

    $ipsoften = $ips | Where-Object { $_.IP -ilike  "10.*" }
    $counts = $ipsoften | Group-Object IP
    $counts | Select-Object Count, Name

}