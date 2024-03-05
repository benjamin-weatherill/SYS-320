# Powershell Script
# SYS-320 - Ben W

Function readConf{
    $daysBack = Get-Content $PSScriptRoot\configuration.txt -First 1
    $executionTime = Get-Content $PSScriptRoot\configuration.txt -Last 1
    $readConfigurationTable = @()
    $readConfigurationTable += [pscustomobject]@{
                                                 "Days" = $daysBack
                                                 "ExecutionTime" = $executionTime
                                                }
    return $readConfigurationTable
}

Function changeConf{
    Write-Host "Enter the number of days for which the logs will be obtained" | Out-String
    $setDaysBack = Read-Host

    Write-Host "Enter the daily execution time of the script (I.E 1:23 AM)" | Out-String
    $setExecutionTime = Read-Host

    Clear-Content -Path $PSScriptRoot\configuration.txt
    $setDaysBack | Out-File -FilePath $PSScriptRoot\configuration.txt
    $setExecutionTime | Out-File -FilePath $PSScriptRoot\configuration.txt -Append
   

}

Function menu{
    $Prompt  = "Please choose an operation:`n"
    $Prompt += "1 - Show Config`n"
    $Prompt += "2 - Change Config`n"
    $Prompt += "0 - Exit`n"

    $operation = $true

    while($operation){
        Write-Host $Prompt | Out-String
        $choice = Read-Host 

        if($choice -eq 1){
            Write-Host (readConf| Format-Table | Out-String)
        }
        elseif($choice -eq 2){
            changeConf
        }
        elseif($choice -eq 0){
          Write-Host "Goodbye" | Out-String
          exit
          $operation = $false 
        }
        else{
            Write-Host "Could not find the option for $choice." | Out-String
        }
}

}

