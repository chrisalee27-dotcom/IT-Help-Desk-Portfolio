<#
.SYNOPSIS
    Network Troubleshooting Helper for Help Desk
    Runs common connectivity tests and shows friendly results.

.DESCRIPTION
    Checks: Internet access, DNS resolution, common ports (80,443,53), Wi-Fi status.
    Outputs pass/fail with tips. Great for "no internet" or "can't reach site" tickets.

.PARAMETER Target
    Optional: Website or IP to test (default: google.com)

.EXAMPLE
    .\NetworkTroubleshooter.ps1
    # Default tests

.EXAMPLE
    .\NetworkTroubleshooter.ps1 -Target 8.8.8.8
    # Test specific IP
#>

[CmdletBinding()]
param (
    [string]$Target = "google.com"
)

Write-Host "`n=== Network Troubleshooting Report ===" -ForegroundColor Cyan
Write-Host "Target: $Target" -ForegroundColor Gray
Write-Host "Run at: $(Get-Date -Format 'yyyy-MM-dd HH:mm')`n" -ForegroundColor Gray

# 1. Basic connectivity (ping)
Write-Host "1. Ping to $Target ..." -ForegroundColor Yellow -NoNewline
if (Test-Connection -ComputerName $Target -Count 2 -Quiet -ErrorAction SilentlyContinue) {
    Write-Host " PASS" -ForegroundColor Green
} else {
    Write-Host " FAIL" -ForegroundColor Red
    Write-Host "   Tip: Check cable/Wi-Fi, router, or ISP outage." -ForegroundColor DarkYellow
}

# 2. DNS resolution
Write-Host "`n2. DNS resolution for $Target ..." -ForegroundColor Yellow -NoNewline
try {
    $null = Resolve-DnsName -Name $Target -ErrorAction Stop
    Write-Host " PASS" -ForegroundColor Green
} catch {
    Write-Host " FAIL" -ForegroundColor Red
    Write-Host "   Tip: Try Google's DNS (8.8.8.8) in network settings." -ForegroundColor DarkYellow
}

# 3. Common ports (HTTP/HTTPS/DNS)
$ports = @{ Http=80; Https=443; Dns=53 }
Write-Host "`n3. Common ports to $Target ..." -ForegroundColor Yellow
foreach ($port in $ports.Keys) {
    $portNum = $ports[$port]
    Write-Host "   Port $portNum ($port) ..." -ForegroundColor Yellow -NoNewline
    if (Test-NetConnection -ComputerName $Target -Port $portNum -WarningAction SilentlyContinue -InformationLevel Quiet) {
        Write-Host " OPEN" -ForegroundColor Green
    } else {
        Write-Host " CLOSED/BLOCKED" -ForegroundColor Red
    }
}

# 4. Wi-Fi / Adapter status (basic)
Write-Host "`n4. Network Adapter Status ..." -ForegroundColor Yellow
$wifi = Get-NetAdapter | Where-Object { $_.Name -like "*Wi-Fi*" -or $_.Name -like "*Wireless*" }
if ($wifi) {
    $wifi | Select-Object Name, Status, LinkSpeed, MacAddress | Format-Table -AutoSize
    if ($wifi.Status -eq "Up") {
        Write-Host "   Wi-Fi appears connected." -ForegroundColor Green
    } else {
        Write-Host "   Wi-Fi adapter down or disconnected." -ForegroundColor Red
    }
} else {
    Write-Host "   No Wi-Fi adapter detected (possibly wired-only)." -ForegroundColor Gray
}

Write-Host "`nReport complete. Copy output for ticket notes." -ForegroundColor Green
Write-Host "Next steps if issues: ipconfig /flushdns, restart adapter, check proxy/VPN." -ForegroundColor Magenta
