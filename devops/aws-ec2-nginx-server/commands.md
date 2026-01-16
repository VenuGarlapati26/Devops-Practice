# Commands Used – AWS EC2 NGINX Lab

## SSH
ssh -i <key>.pem ubuntu@<PUBLIC_IP>

## Install NGINX
sudo apt update
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

## Verify
curl http://localhost

