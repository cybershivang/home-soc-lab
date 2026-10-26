# Incident write-up 01: new binary detected by FIM

**Detected by:** Wazuh FIM (syscheck), visible in Grafana
**Host:** kali (agent 000), path `/usr/sbin/ufw`, event `added`

## What happened
After I installed `ufw` for hardening, Wazuh raised an `added` syscheck alert for `/usr/sbin/ufw`.

## Investigation
1. Opened the alert in Grafana Explore (`rule.groups:syscheck`), noted agent, path, event, timestamp.
2. Correlated with my own change window: `apt install ufw` just before the alert.
3. Checked it was a package-managed path, not a temp or user folder.

## Verdict
Benign true positive: expected change by an authorised admin (me). FIM correctly caught it.

## Also tested
Created, modified and deleted a file in `WAZUH-TEST` on the Windows agent; all three events reached the dashboard.

## Lessons
Windows registry FIM generates heavy noise; filter with `NOT syscheck.path:HKEY*`. Always correlate with change windows before escalating.
