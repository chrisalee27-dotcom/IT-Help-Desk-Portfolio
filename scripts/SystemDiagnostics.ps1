<#
.SYNOPSIS
    Quick System Diagnostics Report for Help Desk Tickets
    Gathers key info: OS, hardware, disk usage, network, uptime.

.DESCRIPTION
    Outputs friendly report to console (and optional file).
    Great for copying into ticket notes.

.EXAMPLE
    .\SystemDiagnostics.ps1
    # Run and copy output
#>

Write-Host "`n=== System Diagnostics Report ===" -ForegroundColor Cyan
Write-Host "Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm')" -ForegroundColor Gray

Write-Host "`nOS & Computer Info:" -ForegroundColor Yellow
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, CsManufacturer, CsModel, CsNumberOfProcessors, CsTotalPhysicalMemory

Write-Host "`nDisk Usage:" -ForegroundColor Yellow
Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free, @{Name='PercentFree';Expression={[math]::Round(($_.Free / $_.Used * 100), 2)}} | Format-Table

Write-Host "`nUptime:" -ForegroundColor Yellow
(Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime

Write-Host "`nNetwork Adapters:" -ForegroundColor Yellow
Get-NetAdapter | Select-Object Name, Status, LinkSpeed, MacAddress

Write-Host "`nIP Configuration:" -ForegroundColor Yellow
Get-NetIPConfiguration | Format-List

Write-Host "`nReport complete. Copy above for ticket documentation." -ForegroundColor Green
