rule.groups:syscheck
rule.groups:syscheck AND NOT syscheck.path:HKEY*
rule.groups:syscheck AND syscheck.event:deleted
agent.name:win-pc AND rule.groups:syscheck
