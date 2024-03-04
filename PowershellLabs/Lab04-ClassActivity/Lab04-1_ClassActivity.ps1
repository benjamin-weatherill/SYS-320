# Powershell Script
# SYS-320 - Ben W

$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

#$regex = [regex] "^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*"
$regex = [regex] "[0-9]{1,3}/.[0-9]{1,3}/.[0-9]{1,3}/.[0-9]{1,3}"

$ipsUnorganized = $regex.Match($notfounds)

$ips = @()
for ($i=0; $i -lt $ipsUnorganized.Count; $i++) {
    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
}

#$ipoftens = 
$ips | ? { $_.IP -ilike "10.*" }

#$ipoftens

#$count = $ipoftens | Group-Object IP

#$count | Select-Object Count, Name



#$errors = ls -File .\*.log | Select-String "error"

#$errors[-5..-1]


#Get-Content -tail 10 access.log | Select-String ' 200 ' -NotMatch

#Get-Content -tail 10 access.log | Select-String ' 404 ',' 400 '