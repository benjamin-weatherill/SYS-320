<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

$specialCharacters = 
function checkPassword($password) {
    $validPassword = $True
    if ($password.Length -lt 6) {
        write-host "Password is under six characters."
        $validPassword = $False
    }
    if ($password -notmatch ".*([\?\/!@#\$%\^&*\(\)]).*") {
        write-host "Password does not contain a special character."
        $validPassword = $False
    }
    if ($password -inotmatch ".*\d.*") {
        write-host "Password does not contain a number."
        $validPassword = $False
    }
    if ($password -cnotmatch ".*[a-z].*") {
    write-host "Password does not contain a letter."
    $validPassword = $False
    }
    if ($password -cnotmatch ".*[A-Z].*") {
      write-host "Password does not contain a capital letter."
      $validPassword = $False
    }
    return $validPassword
}

$password = "Password1234!"
checkPassword $password