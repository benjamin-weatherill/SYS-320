# Powershell Script
# SYS-320 - Ben W

#Invoke-WebRequest 10.0.17.5/IOC.html | Select-Object -ExpandProperty Content

$page= Invoke-WebRequest 10.0.17.5/IOC.html

$trs = $page.ParsedHtml.body.getElementsByTagName("tr")

# Empty array to hold results
$FullTable = @()


for ($i=1; $i -lt $trs.length; $i++) {  
    # Get every td element of current tr element
    $tds = $trs[$i].getElementsByTagName("td")

    $FullTable += [pscustomobject]@{"Pattern"     = $tds[0].innerText;
                                    "Description" = $tds[1].innerText;
                                   }

}

$FullTable
