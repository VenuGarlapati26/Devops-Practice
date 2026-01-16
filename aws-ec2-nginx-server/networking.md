# Networking and Security

## Inbound Rules
- SSH: 22 (My IP)
- HTTP: 80 (0.0.0.0/0)
- HTTPS: 443 (0.0.0.0/0)

## Traffic Flow
User -> Public IP -> Security Group -> NGINX -> index.html

## Logs and Networking Relationship

NGINX access logs validate networking:
- If HTTP (80) is allowed and traffic reaches the instance, entries appear in `/var/log/nginx/access.log`.
- If HTTP is blocked (Security Group/network), you will NOT see access log entries.
