# Help Desk PowerShell Toolkit

A collection of practical PowerShell scripts designed for IT Help Desk / Desktop Support roles. These tools automate common troubleshooting, diagnostics, cleanup, and user support tasks to reduce ticket resolution time and demonstrate scripting/automation skills.

## Why this repo?
- Shows real-world help desk efficiency tools (e.g., disk cleanup, network checks, system reports).
- Complements my other cybersecurity and help desk portfolio repos: [IT-Help-Desk-Portfolio](https://github.com/chrisalee27-dotcom/IT-Help-Desk-Portfolio), [Vulnerability-Management-Lab](https://github.com/chrisalee27-dotcom/Vulnerability-Management-Lab), etc.
- Focus: Windows environments (common in enterprise support).

## Scripts Included (WIP – adding more regularly)
- **DiskCleanup.ps1** – Safely clears temp files, recycle bin, and update cache.
- **SystemDiagnostics.ps1** – Quick report of OS, hardware, disk, network info.
- **NetworkTroubleshooter.ps1** – Tests connectivity, DNS, ports with friendly output.

## How to Use
1. Download or clone this repo.
2. Open PowerShell as Administrator (some scripts require elevated rights).
3. Run scripts like: `.\DiskCleanup.ps1 -WhatIf` (test mode first!).

See /scripts folder for details and individual READMEs.

## Disclaimer
For educational/portfolio use. Test in a lab environment first. Remote features require WinRM/PowerShell remoting setup and proper permissions.
