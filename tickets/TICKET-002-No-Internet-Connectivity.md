# TICKET-002: No Internet Connectivity (Remote Worker)

**Ticket Opened:** Simulated user call/email  
**Priority:** High (blocks all online work)  
**Environment:** Windows 10 desktop, home Wi-Fi

**User Description:**  
"Internet not working – can't browse or access email."

**Initial Intake:**  
- Wired or Wi-Fi? (Wi-Fi)  
- Other devices affected? (Phone works fine)  
- Tried restart? (Yes, no change)

**Troubleshooting Steps:**  
1. Remotely accessed machine.  
2. Ran NetworkTroubleShooter.ps1 from toolkit → DNS resolution failed, ping to google.com timed out.  
3. Ran ipconfig /flushdns and ipconfig /release then /renew.  
4. Restarted Wi-Fi adapter via Device Manager.  
5. Tested DNS by switching to 8.8.8.8 (Google DNS).  
6. Confirmed connectivity restored.

**Resolution:**  
Internet back online – user could browse and email.  
**Time to Resolve:** ~25 minutes  
**Preventive Note:** Suggested checking router reboot first next time.

**Lessons / Interview Talking Point:**  
Network tickets are frequent in remote MSP support. Structured testing (ping → DNS → adapter restart) resolves most without escalation.

**Related Tool:** [NetworkTroubleShooter.ps1](https://github.com/chrisalee27-dotcom/IT-Help-Desk-Portfolio/blob/main/scripts/NetworkTroubleShooter.ps1)
