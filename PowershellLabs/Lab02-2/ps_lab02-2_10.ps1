# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot
$files=(ls -File)

$folderpath="$PSScriptRoot\outfolder"
$filepath= Join-Path $folderpath "out.csv"

$files | ? { $_.Extension -eq ".ps1" } | Export-Csv -Path $filepath