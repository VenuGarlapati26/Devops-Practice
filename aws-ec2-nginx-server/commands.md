# Commands Used (AWS EC2 + NGINX)

## SSH
chmod 400 <key>.pem
ssh -i <key>.pem ubuntu@<PUBLIC_IP>

## Install NGINX
sudo apt update
sudo apt install -y nginx

## Start and Enable
sudo systemctl start nginx
sudo systemctl enable nginx

## Edit index.html
sudo nano /var/www/html/index.html

## Reload and Verify
sudo nginx -t
sudo systemctl reload nginx
curl http://localhost

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
