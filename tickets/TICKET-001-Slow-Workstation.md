# TICKET-001: Slow Performing Workstation (Remote User)

**Ticket Opened:** Simulated remote end-user report  
**Priority:** Medium (impacts daily productivity)  
**Environment:** Windows 11 laptop, remote access via AnyDesk/TeamViewer style tool

**User Description:**  
"Computer is super slow today – programs take forever to open, everything lags."

**Initial Intake (simulated questions):**  
- When did it start? (This morning after updates)  
- Recent changes? (Windows Update ran overnight)  
- Task Manager check: High disk usage, low free space on C:

**Troubleshooting Steps:**  
1. Remotely connected to device.  
2. Checked disk space: C: drive at 8% free.  
3. Executed Diskcleanup.ps1 from my toolkit (cleared temp files, recycle bin, Windows Update cache → freed ~11 GB).  
4. Disabled non-essential startup programs via Task Manager.  
5. Ran quick Windows Update check and restarted.  
6. Confirmed no high CPU/RAM processes or malware (basic Defender scan).

**Resolution:**  
Performance restored – apps open normally, user confirmed improvement.  
**Time to Resolve:** ~40 minutes  
**Preventive Note:** Advised user to monitor disk space and run cleanup monthly.

**Lessons / Interview Talking Point:**  
Common "slow PC" tickets often stem from disk space/temp buildup. Automation with PowerShell saves time vs manual cleanup. In a Miles IT scenario, I'd document in the ticketing system and update KB if recurring.

**Related Tool:** [Diskcleanup.ps1](https://github.com/chrisalee27-dotcom/IT-Help-Desk-Portfolio/blob/main/scripts/Diskcleanup.ps1)
