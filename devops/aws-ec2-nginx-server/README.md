cat > devops/aws-ec2-nginx-server/README.md << 'EOF'
# AWS EC2 NGINX Server (Console + SSH)

This lab documents a complete setup of an **NGINX web server on AWS EC2**, including:
- Launching an EC2 instance (Ubuntu)
- Configuring Security Group for HTTP/HTTPS
- Connecting via SSH using a key pair
- Installing NGINX
- Replacing the default home page (`index.html`)
- Verifying access through the browser using the **Public IP**

---

## Architecture Diagram (Add your image here)

Save your diagram image as:

`devops/aws-ec2-nginx-server/assets/architecture.png`

Then GitHub will display it below:

![AWS EC2 NGINX Architecture](assets/architecture.png)

---

## Task Requirements Completed

- ✅ Install NGINX
- ✅ Replace default `index.html` with custom content
- ✅ Allow HTTP/HTTPS in Security Group
- ✅ Access via browser using the Public IP

---

## High-Level Workflow

1. **AWS Console**: Launch EC2 (Ubuntu, t2.micro)
2. **Networking**: Configure Security Group (22/80/443)
3. **SSH**: Connect using key pair to the Public IP
4. **Install**: Install NGINX and enable service
5. **Deploy**: Update `/var/www/html/index.html`
6. **Verify**: Test locally (`curl`) and externally (browser)

---

## Verification

### 1) Inside EC2 (local verification)
```bash
curl -i http://localhost

