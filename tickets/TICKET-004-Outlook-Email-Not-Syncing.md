# TICKET-004: Outlook Not Receiving Emails (Remote User)

**Ticket Opened:** Simulated email ticket  
**Priority:** High (critical for communication)  
**Environment:** Outlook desktop app, Microsoft 365 account

**User Description:**  
"Outlook not getting new emails – stuck on 'Updating folders'."

**Initial Intake:**  
- Webmail works? (Yes, outlook.office.com fine)  
- Restarted Outlook? (Yes)  
- Recent password change? (No)

**Troubleshooting Steps:**  
1. Remotely accessed PC.  
2. Closed/reopened Outlook – no change.  
3. Ran Outlook in Safe Mode (outlook.exe /safe) – still stuck.  
4. Created new Outlook profile (Control Panel → Mail → Show Profiles).  
5. Added account to new profile.  
6. Synced successfully.

**Resolution:**  
Emails flowing normally in new profile.  
**Time to Resolve:** ~35 minutes  
**Preventive Note:** Profile corruption common after updates; new profile fixes most.

**Lessons / Interview Talking Point:**  
Email sync issues often profile-related, not server-side. Quick profile recreation avoids escalation.
