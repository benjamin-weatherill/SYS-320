# Powershell Script
# SYS-320 - Ben W

﻿. (Join-Path $PSScriptRoot AParseApacheLogs.ps1)

ApacheLogs1  | Format-Table -AutoSize -Wrap