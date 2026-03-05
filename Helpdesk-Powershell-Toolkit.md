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

<#
.SYNOPSIS
    Help Desk Disk Cleanup Tool
    Safely removes temporary files, empties Recycle Bin, and clears some caches.

.DESCRIPTION
    Targets user and system temp folders. Includes safety features:
    - -WhatIf: Preview deletions without changes
    - -Confirm: Prompt before each action
    Requires Administrator rights for full cleanup.

.PARAMETER WhatIf
    Simulate the cleanup (recommended first run).

.PARAMETER Confirm
    Ask for confirmation on deletions.

.EXAMPLE
    .\DiskCleanup.ps1 -WhatIf
    Shows what would be deleted.

.EXAMPLE
    .\DiskCleanup.ps1
    Performs actual cleanup (use with caution).
#>

[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param (
    [switch]$WhatIf,
    [switch]$Confirm
)

Write-Host "`n=== Help Desk Disk Cleanup Tool ===" -ForegroundColor Cyan
Write-Host "Date: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Gray

# Define cleanup targets
$cleanupPaths = @(
    "$env:TEMP",
    "$env:LOCALAPPDATA\Temp",
    "$env:LOCALAPPDATA\Microsoft\Windows\INetCache",
    "$env:LOCALAPPDATA\Microsoft\Windows\WebCache",
    "C:\Windows\Temp",
    "C:\Windows\Prefetch"
)

# Step 1: Recycle Bin
Write-Host "`nClearing Recycle Bin..." -ForegroundColor Yellow
if ($PSCmdlet.ShouldProcess("Recycle Bin", "Empty")) {
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
}

# Step 2: Temp folders
foreach ($folder in $cleanupPaths) {
    if (Test-Path $folder) {
        Write-Host "Cleaning: $folder" -ForegroundColor Yellow
        Get-ChildItem -Path $folder -Recurse -Force -ErrorAction SilentlyContinue |
            Remove-Item -Recurse -Force -WhatIf:$WhatIf -Confirm:$Confirm -ErrorAction SilentlyContinue
    } else {
        Write-Host "Skipped (not found): $folder" -ForegroundColor Gray
    }
}

# Step 3: Optional - Trigger cleanmgr (sagerun preset)
Write-Host "`nLaunching silent Disk Cleanup..." -ForegroundColor Cyan
Start-Process "cleanmgr.exe" -ArgumentList "/sagerun:1" -NoNewWindow -Wait -ErrorAction SilentlyContinue

Write-Host "`nCleanup finished! Check free space in File Explorer." -ForegroundColor Green
Write-Host "Always test with -WhatIf first in production environments." -ForegroundColor Magenta
