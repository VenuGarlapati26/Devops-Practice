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
Place your diagram at:
assets/architecture.png

![Architecture](assets/architecture.png)

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
