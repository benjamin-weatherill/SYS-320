# Powershell Script
# SYS-320 - Ben W

function gatherClasses() { 
    $page = Invoke-WebRequest -TimeoutSec 2 http://localhost/courses.html

    # Get All the tr elements
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    # Empty array to hold results
    $FullTable = @()

    for ($i=1; $i -lt $trs.length; $i++) {  
        # Get every td element of current tr element
        $tds = $trs[$i].getElementsByTagName("td")
        
        # Want to seperate start time and end time from one time field
        $times = $tds[5].innerText.split("-")

        $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText;
                                        "Title"      = $tds[1].innerText;
                                        "Days"       = $tds[4].innerText;
                                        "Time Start" = $times[0];
                                        "Time End"   = $times[1];
                                        "Instructor" = $tds[6].innerText;
                                        "Location"   = $tds[9].innerText;
                                       }
    }
return $FullTable
}


function daysTranslator($FullTable) {

    # Go over every record in the table
    for ($i=0; $i -lt $FullTable.length; $i++) {
        # Empty array to hold days for every record
        $days = @()

        # "M" for Monday
        if ($FullTable[$i].Days -ilike "*M*"){ $days += "Monday" }

        # "T" Followed T, W, or F for Tuesday
        if ($FullTable[$i].Days -ilike "*T[TWF]*"){ $days += "Tuesday" }

        # "W" for Wednesday
        if ($FullTable[$i].Days -ilike "*W*"){ $days += "Wednesday" }

        # "TH" for Thursday
        if ($FullTable[$i].Days -ilike "*TH*"){ $days += "Thursday" }

        # "F" for Friday
        if ($FullTable[$i].Days -ilike "*F*"){ $days += "Friday" }

        $FullTable[$i].Days = $days

    }
    return $FullTable
}
