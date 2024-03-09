# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

. (Join-Path $PSScriptRoot Challange1.ps1)
. (Join-Path $PSScriptRoot Challange2.ps1)

$LOG = accessLogs .\access.log

$IOC = scrapeTable

#Write-Host ($LOG.Page | Format-Table -AutoSize -Wrap | Out-String)

#$LOG | ? {$_.Page -ilike ("*"+$IOC.Pattern+"*") }

$list = @()

for ($i=0; $i -lt $LOG.Count; $i++) {
    for ($j=0; $j -lt $IOC.Count; $j++) {


        $test = "*" + $IOC[$j].Pattern + "*"
        # eg. "*etc/passwd*"
        
        Write-Host ($LOG[$i] | Format-Table -AutoSize -Wrap | Out-String) | ? { $_.Page -ilike $test }

        if (($LOG.Page | Out-String) -ilike $test) {
            
            $list += $Log[$i]
            $j = $IOC.Count
        }
        
    }
}
Write-Host ($list | Select -Unique IP,Time,Method,Page,Protocol,Response,Referrer | Format-Table -AutoSize -Wrap | Out-String)
