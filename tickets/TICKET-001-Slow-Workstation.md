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
<img width="678" height="547" alt="Demonstrate Disk Spike" src="https://github.com/user-attachments/assets/357760ae-c964-40e1-9c9b-73ca16053388" />

3. Executed Diskcleanup.ps1 from my toolkit (cleared temp files, recycle bin, Windows Update cache → freed ~11 GB).

<img width="1046" height="465" alt="Create Script" src="https://github.com/user-attachments/assets/79f59f8b-cfb7-4c05-b1e3-33dee0f710f0" />

<img width="333" height="25" alt="DiskCleanup psq1" src="https://github.com/user-attachments/assets/7d85ef17-3ec5-4b5b-bbba-9089d86c22ab" />

<img width="1027" height="502" alt="TempFill" src="https://github.com/user-attachments/assets/1f45cfd9-72dc-4ba5-8544-c92af4353aa3" />

4. Disabled non-essential startup programs via Task Manager.
5. Ran quick Windows Update check and restarted.  
6. Confirmed no high CPU/RAM processes or malware (basic Defender scan).

<img width="661" height="431" alt="Screenshot 2026-03-06 080403" src="https://github.com/user-attachments/assets/7baed134-0ae1-4770-af43-528c5f925abd" />

<img width="1285" height="435" alt="Screenshot 2026-03-06 075245" src="https://github.com/user-attachments/assets/e0b9a90d-dbc7-4d5e-8ac3-074c995fbfc5" />

**Resolution:**  
Performance restored – apps open normally, user confirmed improvement.  
**Time to Resolve:** ~40 minutes  
**Preventive Note:** Advised user to monitor disk space and run cleanup monthly.

**Lessons / Interview Talking Point:**  
Common "slow PC" tickets often stem from disk space/temp buildup. Automation with PowerShell saves time vs manual cleanup. In a Miles IT scenario, I'd document in the ticketing system and update KB if recurring.

**Related Tool:** [Diskcleanup.ps1](https://github.com/chrisalee27-dotcom/IT-Help-Desk-Portfolio/blob/main/scripts/Diskcleanup.ps1)
