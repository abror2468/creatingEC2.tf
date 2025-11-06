# Creating My First EC2 Instance with Terraform

This is my first full Terraform project!  
I used Terraform to set up a complete AWS environment from scratch — including a custom VPC, subnet, Internet Gateway, route table, security group, and an EC2 instance.

---

## 🌩️ What This Project Does

When you run this Terraform configuration, it builds everything needed to launch an EC2 instance in AWS:

- Creates a **VPC** with the CIDR block `10.0.0.0/16`
- Adds a **subnet** inside that VPC (`10.0.0.16/28`)
- Sets up an **Internet Gateway** so the instance can reach the internet
- Creates a **route table** that directs all outbound traffic (`0.0.0.0/0`) through the Internet Gateway
- Configures a **security group** that allows inbound HTTPS traffic (port 443) and all outbound traffic
- Launches a **t3.micro EC2 instance** with a public IP address and tags it as `"yay"`

Basically, this code builds a small, working network in AWS and launches an instance inside it — all automated with Terraform.

---

## 🧠 What I Learned

- How to connect AWS resources together using Terraform  
- The relationship between VPCs, subnets, route tables, and Internet Gateways  
- How to safely test and apply infrastructure changes using `terraform plan` and `terraform apply`  
- How Terraform manages dependencies automatically through resource references (like `vpc_id`, `subnet_id`, etc.)

---

## 🛠️ Tools and Technologies

- **Terraform** (Infrastructure as Code)
- **AWS** (VPC, EC2, and Security Groups)
- **HCL** (HashiCorp Configuration Language)

---

## ⚙️ How to Try It Out

If you want to run this project yourself:

1. Install [Terraform](https://developer.hashicorp.com/terraform/downloads)
2. Set up your AWS credentials by running:
   ```bash
   aws configure
