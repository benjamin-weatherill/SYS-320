#!/bin/bash

# Check if correct number of arguments are passed
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <report_file>"
    exit 1
fi

report_file="$1"

# Begin HTML file
cat <<EOF
<!DOCTYPE html>
<html>
<head>
    <title>Access Log Report</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Access Log Report</h2>
    <table>
        <tr>
            <th>IP Address</th>
            <th>Date/Time</th>
            <th>Accessed File</th>
        </tr>
EOF

# Read each line from the report file and format it into an HTML table row
while IFS= read -r line; do
    # Split the line into IP address, date/time, and accessed file
    ip_address=$(echo "$line" | awk '{print $1}')
    date_time=$(echo "$line" | awk '{print $2}')
    accessed_file=$(echo "$line" | awk '{print $3}')
    
    # Output as HTML table row
    echo "        <tr>"
    echo "            <td>$ip_address</td>"
    echo "            <td>$date_time</td>"
    echo "            <td>$accessed_file</td>"
    echo "        </tr>"
done < "$report_file"

# End HTML file
cat <<EOF
    </table>
</body>
</html>
EOF
