# CY376 - Monitoring PowerShell and Command-Line Activity for Malicious Use
# Installs Sysmon with the SwiftOnSecurity community configuration.
# Run from an elevated PowerShell session.

Invoke-WebRequest -Uri "https://download.sysinternals.com/files/Sysmon.zip" -OutFile "C:\Sysmon.zip"
Expand-Archive C:\Sysmon.zip -DestinationPath C:\Sysmon -Force
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/SwiftOnSecurity/sysmon-config/master/sysmonconfig-export.xml" -OutFile "C:\Sysmon\sysmonconfig-export.xml"

Set-Location C:\Sysmon
.\Sysmon64.exe -accepteula -i sysmonconfig-export.xml

# Verify installation and print the active ruleset
.\Sysmon64.exe -c
