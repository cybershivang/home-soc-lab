# opensearch.yml (bind to loopback + LAN IP)
network.host: ["127.0.0.1", "<VM_IP>"]

# Read-only Grafana role (index wazuh-alerts-4.x-*): role grafana_wazuh_read,
# user grafana_reader mapped to it. Create via the _plugins/_security API using
# a password prompt (never put passwords in commands saved to history).

# Grafana data source: URL https://<VM_IP>:9200, Basic auth, CA cert pasted, TLS verify ON,
# index wazuh-alerts-4.x-*, time field @timestamp.
