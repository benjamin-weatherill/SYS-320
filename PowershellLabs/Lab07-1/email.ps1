function SendAlertEmail($Body){
    $From = "champben3@gmail.com"
    $To = "champben3@gmail.com"
    $Subject = "Suspicious Activity"

    $Password = "xxxx xxxx xxxx xxxx" | ConvertTo-SecureString -AsPlainText -Force
    $Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password
    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" `
    -port 587 -UseSsl -Credential $Credential
}
SendAlertEmail "Body of email"