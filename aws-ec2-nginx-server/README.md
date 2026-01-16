# AWS EC2 + NGINX Web Server (Complete Practical)

This folder contains complete documentation for deploying an NGINX web server on AWS EC2.

## What this includes
- EC2 instance creation
- Security Group configuration
- SSH connection
- NGINX installation
- Custom index.html
- Architecture explanation
- Verification steps

## Architecture Diagram


<img width="1200" height="1024" alt="Nginx-Server" src="https://github.com/user-attachments/assets/e13143cb-f79d-45b4-859a-641e57f1bcca" />


## Steps Overview
1. Launch EC2 (Ubuntu, t2.micro)
2. Configure Security Group (22, 80, 443)
3. SSH into instance
4. Install NGINX
5. Replace index.html
6. Verify via browser

## Verification
- curl http://localhost
- http://<PUBLIC_IP>

## Resume Summary
Deployed NGINX on AWS EC2 with secure networking and public access verification.

---

## Log Verification (NGINX & System Logs)

After deploying NGINX, I checked logs to confirm that HTTP requests are reaching the server and being handled correctly.

### NGINX Access Logs (Requests)
File:
- `/var/log/nginx/access.log`

What each line typically shows:
- Client IP
- Request method + path (e.g., `GET /`)
- HTTP status code (`200`, `404`, etc.)
- Response size
- Client (browser/curl)

This confirms that:
- Requests reached the instance
- NGINX responded successfully

### NGINX Error Logs (Problems)
File:
- `/var/log/nginx/error.log`

Used to detect:
- Config issues
- Permission problems
- Runtime failures

### System Logs (NGINX service via systemd)
Command:
- `journalctl -u nginx`

Used to verify:
- Service starts
- Reloads completed without error

### Screenshot Proof (Sanitized)
Add a sanitized screenshot here:
- `screenshots/08-nginx-access-logs-sanitized.png`

![NGINX Access Logs](screenshots/08-nginx-access-logs-sanitized.png)

> Note: Screenshots are sanitized to remove sensitive identifiers such as IP addresses.
