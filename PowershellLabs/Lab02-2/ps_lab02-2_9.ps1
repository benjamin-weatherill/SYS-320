# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

$folderpath="$PSScriptRoot\outfolder"
if (Test-Path $folderpath) {
    echo "Folder Already Exists"
} else {
    New-Item -ItemType Directory -Path $folderpath
}