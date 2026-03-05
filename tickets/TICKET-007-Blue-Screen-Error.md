# TICKET-007: Blue Screen of Death (BSOD) on Startup

**Ticket Opened:** Simulated urgent call  
**Priority:** High (machine unusable)  
**Environment:** Windows 10 desktop

**User Description:**  
"Blue screen with error code – restarts loop."

**Initial Intake:**  
- Error code? (DRIVER_IRQL_NOT_LESS_OR_EQUAL)  
- Recent hardware/driver change? (New Wi-Fi adapter)

**Troubleshooting Steps:**  
1. Booted to Safe Mode (Shift + Restart).  
2. Checked Event Viewer for driver clues.  
3. Rolled back/uninstalled recent driver in Device Manager.  
4. Ran sfc /scannow and DISM repair commands.  
5. Restarted normally – no BSOD.  
6. Updated driver from manufacturer site.

**Resolution:**  
System stable, no more crashes.  
**Time to Resolve:** ~50 minutes  
**Preventive Note:** Driver updates via manufacturer, not Windows Update alone.

**Lessons / Interview Talking Point:**  
BSODs often driver-related. Safe Mode + Event Viewer quick diagnosis – escalate hardware if persists.
