#!/usr/bin/env bash
set -e

LAB_DIR="aws-ec2-nginx-server"
mkdir -p "$LAB_DIR/screenshots"

README="$LAB_DIR/README.md"
COMMANDS="$LAB_DIR/commands.md"
NETWORKING="$LAB_DIR/networking.md"

if [ ! -d "$LAB_DIR" ]; then
  echo "ERROR: '$LAB_DIR' folder not found in $(pwd)"
  echo "If your lab is inside devops/, edit LAB_DIR to 'devops/aws-ec2-nginx-server' and rerun."
  exit 1
fi

# Add Logs section to README.md (if missing)
if ! grep -q "## Log Verification (NGINX & System Logs)" "$README" 2>/dev/null; then
  cat >> "$README" << 'EOT'

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
EOT
  echo "Added Logs section to $README"
else
  echo "Logs section already exists in $README (skipping)"
fi

# Add log commands to commands.md (if missing)
if ! grep -q "## Log Inspection Commands" "$COMMANDS" 2>/dev/null; then
  cat >> "$COMMANDS" << 'EOT'

## Log Inspection Commands

# Generate a request (creates an access-log entry)
curl http://localhost

# View last 20 requests
sudo tail -n 20 /var/log/nginx/access.log

# Watch logs live (CTRL+C to stop)
sudo tail -f /var/log/nginx/access.log

# View last 20 errors
sudo tail -n 20 /var/log/nginx/error.log

# View NGINX service logs (systemd)
sudo journalctl -u nginx --no-pager -n 20
EOT
  echo "Added log commands to $COMMANDS"
else
  echo "Log commands already exist in $COMMANDS (skipping)"
fi

# Add optional section to networking.md (only if file exists)
if [ -f "$NETWORKING" ] && ! grep -q "## Logs and Networking Relationship" "$NETWORKING" 2>/dev/null; then
  cat >> "$NETWORKING" << 'EOT'

## Logs and Networking Relationship

NGINX access logs validate networking:
- If HTTP (80) is allowed and traffic reaches the instance, entries appear in `/var/log/nginx/access.log`.
- If HTTP is blocked (Security Group/network), you will NOT see access log entries.
EOT
  echo "Added log/network note to $NETWORKING"
else
  echo "networking.md missing OR section already present (skipping)"
fi

# Create screenshots README if missing
if [ ! -f "$LAB_DIR/screenshots/README.md" ]; then
  cat > "$LAB_DIR/screenshots/README.md" << 'EOT'
# Screenshots to Add (Sanitized)

Recommended proof screenshots:
1. EC2 instance running (blur: instance-id, public IP, account ID)
2. Security Group inbound rules (blur: SG ID)
3. SSH terminal connected (mask IPs)
4. NGINX running status
5. Browser output
6. NGINX access logs (mask IPs)

Log screenshot filename:
- 08-nginx-access-logs-sanitized.png
EOT
  echo "Created screenshots/README.md"
else
  echo "screenshots/README.md already exists (skipping)"
fi

echo ""
echo "Done. Review changes:"
git status
