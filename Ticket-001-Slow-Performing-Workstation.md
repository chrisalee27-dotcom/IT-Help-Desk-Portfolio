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
![Baseline System Summary](screenshots/baseline/msinfo32-system-summary.png)

**Healthy State Examples**:
- Disk free space: ~37 GB free / 59.4 GB total  
  ![Before - High Free Space](screenshots/baseline/before-disk-free-space.png)
- Task Manager Performance (idle): low CPU/disk usage  
  ![Before - Normal Performance](screenshots/baseline/before-task-manager-performance.png)

## Tickets

### Ticket #001: Slow Performing Windows 10 Workstation

**Reported Issue**  
End-user reports PC taking over 1:40 to boot/login and feeling laggy after reaching desktop.

**Environment**  
Windows 10 Home in VirtualBox VM (see baseline above).

**Troubleshooting & Evidence**

**Induction (to simulate common end-user state)**  
- Added multiple shortcuts to Startup folder (Chrome, Notepad, Paint, Quick Assist, Snipping Tool, etc.)  
  ![Startup Folder with Added Bloat](screenshots/induced/startup-folder-bloat.png)
- Observed post-boot disk thrashing  
  ![Task Manager - Disk Spike 100%](screenshots/induced/induced-taskmgr-disk-spike.png)
- Boot time measured: **1 minute 44 seconds** (from power-on to usable desktop)  
  ![Slow Boot - Timed 1:44](screenshots/induced/induced-slow-boot-stopwatch-144s.png)
- Resource Monitor (Disk tab) showed burst writes and multiple processes active (System, explorer.exe, notepad.exe, MsMpEng.exe, svchost.exe)  
  ![Resource Monitor - Disk Activity During Slowness](screenshots/induced/resmon-disk-activity.png)

**Root Cause**  
Excessive startup programs → high disk I/O during login → prolonged boot and initial lag.

**Resolution Steps**
1. Disabled unnecessary startup items in Task Manager Startup tab (right-click → Disable)  
   ![Startup Tab After Disabling Items](screenshots/resolved/resolved-startup-tab.png)
2. Ran Disk Cleanup (system files: temp files, thumbnails, etc.)
3. Executed `sfc /scannow` in elevated Command Prompt
4. Scheduled `chkdsk C: /f` for next reboot
5. Rebooted

**Results**  
- Boot time reduced to ~[insert your measured time, e.g., 48–55 seconds]  
  ![Resolved - Fast Boot Stopwatch](screenshots/resolved/resolved-stopwatch-fast-boot.png)
- Disk active time near 0%, no significant spikes  
  ![Resolved - Clean Task Manager](screenshots/resolved/resolved-taskmgr-clean.png)

**Time to Resolve** (simulated): ~15–20 minutes  
**Lessons Learned**  
Regular review of startup items and disk maintenance prevents common performance issues (A+ Core 2 – Performance & Troubleshooting).
