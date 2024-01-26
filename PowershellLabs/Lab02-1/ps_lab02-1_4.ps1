# Powershell Script: Stop Chrome if running, then start best site
if (get-process "chrome" -ea SilentlyContinue) {
	stop-process -name chrome -ea SilentlyContinue
	wait-process -name chrome
	write-host Chrome has been shut down
}

start-sleep -milliseconds 200

if (-not (get-process "chrome" -ea SilentlyContinue)) {
	Start-Process -filepath 'C:\Program Files\Google\Chrome\Application\chrome.exe' -ArgumentList '"https://github.com/benjamin-weatherill/SYS-320"'
	write-host Starting Chrome with the best URL 
}
