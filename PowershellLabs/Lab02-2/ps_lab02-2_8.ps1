# Powershell Script
# SYS-320 - Ben W

cd $PSScriptRoot

$files=(ls -File)
for ($i=0; $i -le $files.Count; $i++) {
    if ($files[$i].Name -ilike "*ps1") {
        echo $files[$i].Name
    }
}