# Group Policy Settings Reference

Configured via Local Group Policy Editor (`gpedit.msc`) on the test VM.

## Windows Components → Windows PowerShell
| Setting | Value |
|---|---|
| Turn on PowerShell Script Block Logging | Enabled |
| Turn on Module Logging | Enabled, Module Names = `*` |
| Turn on PowerShell Transcription | Enabled, output dir `C:\PS_Transcripts` |

## Advanced Audit Policy Configuration → Detailed Tracking
| Setting | Value |
|---|---|
| Audit Process Creation | Success |

## Administrative Templates → System → Audit Process Creation
| Setting | Value |
|---|---|
| Include command line in process creation events | Enabled |

Run `gpupdate /force` after applying these settings to avoid waiting for the
default background policy refresh interval.

See `../scripts/install_sysmon.ps1` for the Sysmon configuration used
alongside these native logging controls.
