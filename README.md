# CY376 — Monitoring PowerShell and Command-Line Activity for Malicious Use

**Course:** CY376 — Network Monitoring, Security and Auditing
**Track:** Blue Team
**Author:** Samuel Roland Asahin (Index: FCM.41.018.072.23)
**Programme:** BSc. Cybersecurity, Level 300 — University of Mines and Technology, Tarkwa

## Summary

This project demonstrates how a defender can regain visibility into obfuscated,
fileless PowerShell attacks using only native Windows logging and Sysmon — no
commercial EDR or SIEM product required. A Windows 10 VM was configured with
PowerShell Script Block Logging, Module Logging, Transcription, command-line
process auditing, and Sysmon (SwiftOnSecurity configuration). A representative
Base64-encoded, hidden-window PowerShell download-and-execute command was then
run and successfully detected: Event ID 4104 recovered the fully decoded
malicious script content, and Sysmon Event ID 1 corroborated it with process
lineage, integrity level, and a SHA256 hash of the executing binary.

Full write-up, methodology, evidence, analysis, and recommendations are in the
report: [`docs/CY376_PowerShell_Monitoring_Report.docx`](docs/CY376_PowerShell_Monitoring_Report.docx).

## Tools Used

- Windows 10 x64 (VMware Workstation VM, NAT network)
- Local Group Policy Editor (`gpedit.msc`)
- Sysmon v15.21 with the [SwiftOnSecurity](https://github.com/SwiftOnSecurity/sysmon-config) configuration
- Windows Event Viewer
- PowerShell 5.1

## Repository Structure

```
.
├── README.md
├── docs/
│   ├── CY376_PowerShell_Monitoring_Report.docx   # Full project report
│   └── lab_architecture_diagram.png              # Lab architecture (Figure 3)
├── scripts/
│   ├── install_sysmon.ps1                        # Sysmon install + config
│   └── simulated_attack_command.ps1               # Test command used (safe, unreachable target)
├── configs/
│   ├── gpo_settings.md                            # Group Policy settings reference
│   └── sigma_rule_encoded_powershell_download.yml  # Illustrative Sigma detection rule
└── evidence/
    ├── event4104_decoded_scriptblock.png
    ├── sysmon_event1_process_creation.png
    ├── gpo_powershell_logging_settings.png
    ├── gpo_transcription_setting.png
    └── sysmon_service_started.png
```

## How to Reproduce

1. Build a Windows 10 VM (VMware/VirtualBox), NAT network, local admin account.
2. Apply the Group Policy settings in `configs/gpo_settings.md`.
3. Run `scripts/install_sysmon.ps1` from an elevated PowerShell session.
4. Run `scripts/simulated_attack_command.ps1` (target address is intentionally
   unreachable — safe to run in any isolated lab).
5. Open Event Viewer → *Applications and Services Logs → Microsoft → Windows →
   PowerShell → Operational*, search for `DownloadString`, and inspect the
   decoded Event ID 4104 entry. Cross-reference with Sysmon Event ID 1 under
   *Applications and Services Logs → Microsoft → Windows → Sysmon → Operational*.

## Safety Notes

- The simulated attack targets a non-routable test address (`10.0.2.15`) and
  never downloads or executes real remote code.
- All testing was performed on an isolated VM with no bridged access to any
  production network.
- No credentials, personal data, or real organisational information appear
  anywhere in this repository.
