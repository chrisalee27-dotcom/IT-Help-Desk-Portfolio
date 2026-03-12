# Ticket 008 – DNS Troubleshooting (Flushing DNS)

## Ticket Information

| Field | Value |
|------|------|
| Ticket ID | 002 |
| Issue Type | Website Connectivity |
| Priority | Medium |
| Environment | Windows 10 |
| Tools Used | Command Prompt, DNS utilities |

---

# Overview

This lab demonstrates a common IT help desk troubleshooting scenario where a user cannot access a specific website. The goal of this exercise was to diagnose potential DNS resolution issues and restore connectivity by clearing the DNS resolver cache.

DNS issues are a frequent cause of website access problems in corporate environments, making this a common task for **Help Desk and NOC technicians**.

---

# Scenario

A user reports they are unable to access a website from their workstation.

Example issue:

User cannot access `google.com`

Possible causes include:

- DNS cache corruption
- Incorrect DNS resolution
- Network connectivity problems
- Browser caching issues

---

# Troubleshooting Process

## Step 1 – Verify Internet Connectivity

First, confirm the computer has internet access.

Command used:

```
ping google.com
```
<img width="636" height="346" alt="01_ping_google" src="https://github.com/user-attachments/assets/bf237740-6adf-44a0-b416-1d984a1d8dbc" />

If replies are received, the system has internet connectivity and the issue is likely not related to the network connection itself.

Result:  
Internet connectivity confirmed.

---

## Step 2 – Test DNS Resolution

Next, verify that the system can resolve the domain name into an IP address.

Command used:

```
nslookup google.com
```
<img width="438" height="314" alt="02_ns_lookup" src="https://github.com/user-attachments/assets/3a776816-cc0f-4c92-8d58-6df839476c38" />

This command queries the DNS server and returns the IP address associated with the domain.

Result:  
DNS resolution returned a valid IP address.

---

## Step 3 – Check Local Network Configuration

The system’s IP configuration was reviewed to verify correct network settings.

Command used:

```
ipconfig
```
<img width="738" height="884" alt="03_ipconfig" src="https://github.com/user-attachments/assets/4d7f74d5-c3df-41b3-b562-73f9ebab2414" />

Key information reviewed:

- IPv4 Address
- Default Gateway
- DNS Server

Result:  
Network configuration appeared correct.

---

## Step 4 – Flush the DNS Cache

The local DNS cache was cleared to remove potentially corrupted or outdated DNS entries.

Command used:

```
ipconfig /flushdns
```
<img width="433" height="173" alt="04_flush_dns" src="https://github.com/user-attachments/assets/3a6986eb-71fd-4d8d-b0e3-aa951900eb72" />

Output:

```
Successfully flushed the DNS Resolver Cache
```

This forces the system to request fresh DNS records from the DNS server.

---

## Step 5 – Verify DNS Resolution Again

After clearing the cache, DNS resolution was tested again.

Command used:

```
nslookup google.com
```

Result:  
DNS resolution succeeded with updated records.

---

## Step 6 – Confirm Website Accessibility

Finally, connectivity to the website was verified.

Command used:

```
ping google.com
```

Result:  
The website was accessible after clearing the DNS cache.

---

# Resolution

The issue was caused by a cached DNS entry.  
Flushing the DNS cache resolved the problem by forcing the system to retrieve updated DNS records.

---

# Key Concepts

## DNS (Domain Name System)

DNS translates domain names into IP addresses.

Example:

example.com → 93.184.216.34

Without DNS, users would have to remember numerical IP addresses to access websites.

---

## DNS Cache

Operating systems temporarily store DNS records locally to improve browsing performance.

If these records become outdated or corrupted, users may experience connectivity issues.

Flushing the DNS cache removes these records and forces the system to retrieve updated DNS information.

---

# Lessons Learned

Key takeaways from this lab include:

- DNS issues can prevent website access even when internet connectivity is working.
- Command-line networking tools are essential for troubleshooting.
- Flushing DNS is a quick and effective solution for resolving cached DNS problems.

Understanding DNS troubleshooting is an essential skill for entry-level IT roles such as:

- Help Desk Technician  
- NOC Technician  
- SOC Analyst  

---

# Skills Demonstrated

- Network troubleshooting
- DNS diagnostics
- Command-line tools
- Structured troubleshooting methodology

---

# Author

Christopher Lee  
Cybersecurity Student – Purdue Global 
