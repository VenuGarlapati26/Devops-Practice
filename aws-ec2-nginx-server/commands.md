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
