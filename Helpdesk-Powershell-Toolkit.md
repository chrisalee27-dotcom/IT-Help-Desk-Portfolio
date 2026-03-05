# Help Desk PowerShell Toolkit

A collection of practical PowerShell scripts designed for IT Help Desk / Desktop Support roles. These tools automate common troubleshooting, diagnostics, cleanup, and user support tasks to reduce ticket resolution time and demonstrate scripting/automation skills.

## Why this repo?
- Shows real-world help desk efficiency tools (e.g., disk cleanup, system reports, network checks).
- Complements my other cybersecurity and help desk portfolio repos: [IT-Help-Desk-Portfolio](https://github.com/chrisalee27-dotcom/IT-Help-Desk-Portfolio), [Vulnerability-Management-Lab](https://github.com/chrisalee27-dotcom/Vulnerability-Management-Lab), etc.
- Focus: Windows environments (common in enterprise support).

## Scripts Included

All scripts are in the [`/scripts/`](./scripts/) folder.

- **[Diskcleanup.ps1](./scripts/Diskcleanup.ps1)**  
  Safely clears temp files, Recycle Bin, and some Windows caches. Includes safety features like `-WhatIf` (preview) and `-Confirm`.  
  → [View / Download full script](./scripts/Diskcleanup.ps1)

  **Quick code preview:**
  ```powershell
  <#
  .SYNOPSIS
      Help Desk Disk Cleanup Tool
      Safely removes temporary files, empties Recycle Bin, and clears some caches.

  .DESCRIPTION
      Targets user and system temp folders. Includes safety features:
      - -WhatIf: Preview deletions without changes
      - -Confirm: Prompt before each action
      Requires Administrator rights for full cleanup.
  #>

  [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
  param (
      [switch]$WhatIf,
      [switch]$Confirm
  )

  Write-Host "`n=== Help Desk Disk Cleanup Tool ===" -ForegroundColor Cyan

  <#
.SYNOPSIS
    Quick System Diagnostics Report for Help Desk Tickets
    Gathers key info: OS, hardware, disk usage, network, uptime.

.DESCRIPTION
    Outputs friendly report to console (and optional file).
    Great for copying into ticket notes.
#>

Write-Host "`n=== System Diagnostics Report ===" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Gray

Write-Host "`nOS & Computer Info:" -ForegroundColor Yellow
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CsManufacturer, CsModel, CsNumberOfProcessors, CsTotalPhysicalMemory

<#
.SYNOPSIS
    Network Troubleshooting Helper for Help Desk
    Runs common connectivity tests and shows friendly results.

.DESCRIPTION
    Checks: Internet access, DNS resolution, common ports (80,443,53), Wi-Fi status.
    Outputs pass/fail with tips. Great for "no internet" or "can't reach site" tickets.
#>

[CmdletBinding()]
param (
    [string]$Target = "google.com"
)

Write-Host "`n=== Network Troubleshooting Report ===" -ForegroundColor Cyan
# ... (rest of script)
