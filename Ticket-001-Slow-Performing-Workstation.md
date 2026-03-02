# Windows Troubleshooting Help Desk Labs

Portfolio of simulated end-user help desk tickets resolved in a VirtualBox Windows 10 environment.  
Aligned with CompTIA A+ Core 2 troubleshooting skills – created to demonstrate practical Tier 1 support abilities for job applications.

## Lab Environment (Baseline)
- **OS**: Windows 10 Home (Build 19045)
- **Edition**: Home (unactivated – evaluation/lab use)
- **VM Specs**: VirtualBox, ~3–16 GB RAM allocated (varied for testing), ~60 GB dynamic disk
- **Hypervisor**: Oracle VirtualBox
- **Snapshot**: "Clean Baseline - Windows 10 Home Ready" (post-updates, local admin + EndUser account, Chrome/Firefox installed)

**Baseline System Summary** (msinfo32):

<img width="1917" height="910" alt="Clean Baseline" src="https://github.com/user-attachments/assets/fbc5572a-69b9-4264-b3fb-4ee85a3b54ca" />

**Healthy State Examples**:
- Disk free space: ~37 GB free / 59.4 GB total
-  
<img width="779" height="598" alt="Free Space High 40+ Gig free" src="https://github.com/user-attachments/assets/415107ca-ed52-4ac8-b746-fd204894dc9d" />

- Task Manager Performance (idle): low CPU/disk usage 

<img width="998" height="675" alt="Normal CPU Usage" src="https://github.com/user-attachments/assets/20165d3b-8966-446d-bc83-a70e18ad2d49" />


## Tickets

### Ticket #001: Slow Performing Windows 10 Workstation

**Reported Issue**  
End-user reports PC taking over 1:40 to boot/login and feeling laggy after reaching desktop.

**Environment**  
Windows 10 Home in VirtualBox VM (see baseline above).

**Troubleshooting & Evidence**

**Induction (to simulate common end-user state)**  
- Added multiple shortcuts to Startup folder (Chrome, Notepad, Paint, Quick Assist, Snipping Tool, etc.)
  
<img width="904" height="360" alt="Bloat Created" src="https://github.com/user-attachments/assets/887a0adc-bf05-4d3d-a38a-edcde075b6ff" />

<img width="686" height="519" alt="Before Induction- After Adding Bloat Task Manager" src="https://github.com/user-attachments/assets/8e729dab-67f5-43bc-b01a-2a8c139526e4" />

- Observed post-boot disk thrashing

<img width="367" height="501" alt="Low Space Created -10GB" src="https://github.com/user-attachments/assets/43416d58-689e-4985-9232-84d9ee49170d" />

<img width="687" height="544" alt="Disk Thrashing 100% Active Time" src="https://github.com/user-attachments/assets/e60f202c-31d8-477d-99de-d546617dee55" />

- Boot time measured: **1 minute 44 seconds** (from power-on to usable desktop)
  
<img width="1620" height="766" alt="timer 4" src="https://github.com/user-attachments/assets/3e41a2a2-dd0e-49df-ac2a-e2f25cb29019" />

- Resource Monitor (Disk tab) showed burst writes and multiple processes active (System, explorer.exe, notepad.exe, MsMpEng.exe, svchost.exe)

<img width="995" height="588" alt="High Read Write Time" src="https://github.com/user-attachments/assets/978550c0-c9d7-4e00-8e9d-36742d3a402d" />

**Root Cause**  
Excessive startup programs → high disk I/O during login → prolonged boot and initial lag.

**Resolution Steps**
1. Disabled unnecessary startup items in Task Manager Startup tab (right-click → Disable)
   
<img width="690" height="601" alt="Disable Startup task " src="https://github.com/user-attachments/assets/4b90a1fb-8e56-462a-9e41-65b69e139248" />

<img width="677" height="498" alt="Disabled 2" src="https://github.com/user-attachments/assets/e27e5e38-d1de-43b9-b590-ef86a6173a79" />

2. Ran Disk Cleanup (system files: temp files, thumbnails, etc.)
3. Executed `sfc /scannow` in elevated Command Prompt
4. Scheduled `chkdsk C: /f` for next reboot
5. Rebooted

**Results**  
- Boot time reduced to ~[insert your measured time, e.g., 48–55 seconds]
  
<img width="1212" height="727" alt="start timer under 30 seconds" src="https://github.com/user-attachments/assets/a9903720-27c0-42e6-99b6-a74eab50bf38" />

- Disk active time near 0%, no significant spikes
  
<img width="383" height="500" alt="Disk Space optimized" src="https://github.com/user-attachments/assets/7e6f431f-4fea-4a7f-9733-86302c399914" />

<img width="1283" height="587" alt="Screenshot 2026-03-02 105000" src="https://github.com/user-attachments/assets/91c74a73-fba4-4c41-ab53-7325310a9c76" />

**Time to Resolve** (simulated): ~15–20 minutes  
**Lessons Learned**  
Regular review of startup items and disk maintenance prevents common performance issues (A+ Core 2 – Performance & Troubleshooting).
