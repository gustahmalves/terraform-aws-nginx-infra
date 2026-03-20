
<img width="1536" height="1024" alt="project_infra" src="https://github.com/user-attachments/assets/e8896aba-2e28-438f-9df9-35afa974f0a9" />


# 🚀 Terraform AWS Nginx Infrastructure

This project provisions a complete AWS infrastructure using Terraform and deploys a web server (Nginx) automatically via EC2 `user_data`.

It also includes backup automation and S3 storage with versioning enabled, demonstrating foundational cloud architecture and operational practices.

---

## 📌 Overview

The goal of this project is to demonstrate Infrastructure as Code (IaC) using Terraform to build and manage a production-like AWS environment.

---

## 🧱 Architecture


Internet
>
Internet Gateway
>
Public Subnet
>
EC2 Instance (Nginx)


---

## ⚙️ Technologies Used

- Terraform
- AWS (EC2, VPC, Subnet, Internet Gateway, Route Table, Security Groups)
- AWS Backup
- Amazon S3 (with versioning)
- Linux (Ubuntu)
- Nginx

---

## 🛠 Resources Created

- VPC with custom CIDR block
- Public Subnet
- Internet Gateway
- Route Table and associations
- Security Group (HTTP + SSH)
- EC2 instance with automated Nginx deployment
- AWS Backup:
  - Backup Vault
  - Backup Plan (scheduled)
  - Backup Selection (EC2)
- S3 bucket with versioning enabled

---

## 🚀 How It Works

The EC2 instance is configured automatically using `user_data`:

- Updates system packages  
- Installs Nginx  
- Starts and enables the service  
- Deploys a custom HTML page  

---

## ▶️ How to Deploy

```bash
terraform init
terraform plan
terraform apply
```

After deployment:

terraform output instance_public_ip

Access in browser:

http://<PUBLIC_IP>

🔐 Security

Port 80 (HTTP) open to the internet
Port 22 (SSH) configurable (recommended: restrict to your IP)

💾 Backup Strategy

This project uses AWS Backup to automate EC2 backups:

Daily backup schedule
Centralized Backup Vault
Retention policy for recovery points
Fully managed snapshot lifecycle

📦 S3 Storage

An S3 bucket is included with versioning enabled.

This demonstrates:

Data durability and protection against accidental deletion
Object version control
Foundations for backup and recovery strategies

Potential use cases:

Static website hosting
Log storage
Backup exports
CI/CD artifact storage

📸 Expected Result

A running Nginx web server displaying:

DevOps Lab - Gustavo Alves


👨‍💻 Author

Gustavo Alves
Cloud & Infrastructure Engineer (in transition)

