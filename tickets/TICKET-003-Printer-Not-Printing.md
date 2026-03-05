# TICKET-003: Printer Not Printing (Office User)

**Ticket Opened:** Simulated help desk ticket  
**Priority:** Medium (affects document workflow)  
**Environment:** Windows 11, networked HP printer

**User Description:**  
"Sent print job but nothing comes out – printer shows offline."

**Initial Intake:**  
- Printer model? (HP LaserJet)  
- Error message? (None visible)  
- Other users affected? (No, isolated)

**Troubleshooting Steps:**  
1. Remotely connected.  
2. Checked printer status: Offline in Devices and Printers.  
3. Restarted Print Spooler service (net stop spooler → net start spooler).  
4. Cleared print queue (deleted stuck jobs in C:\Windows\System32\spool\PRINTERS).  
5. Re-added printer via IP address.  
6. Test print successful.

**Resolution:**  
Printer online and printing normally.  
**Time to Resolve:** ~30 minutes  
**Preventive Note:** Print spooler hangs are common; restart often fixes.

**Lessons / Interview Talking Point:**  
Printer issues are a classic Tier 1 headache. Quick service restart + queue clear resolves 70%+ without hardware intervention.

**Related Tool:** Could add a simple SpoolerRestart.ps1 in future.
