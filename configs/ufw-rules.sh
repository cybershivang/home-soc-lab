#!/usr/bin/env bash
# Default-deny, allow only the analyst laptop. Replace the placeholders.
LAPTOP_IP=<LAPTOP_IP>; VM_IP=<VM_IP>
sudo ufw allow from $LAPTOP_IP to any port 22 proto tcp   # allow SSH first, avoid lock-out
for p in 443 1514 1515 9200 20211 20212; do
  sudo ufw allow from $LAPTOP_IP to $VM_IP port $p proto tcp
done
sudo ufw enable && sudo ufw status numbered
