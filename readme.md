# AWS EC2 Deployment with Terraform

This repository contains Terraform configuration files to deploy a simple AWS environment consisting of:

- **VPC (Virtual Private Cloud):** A private network within AWS to house your resources, allowing you to define IP ranges and control traffic.
- **Subnet (Public Subnet):** A segmented portion of the VPC where resources like EC2 instances are launched, accessible from the internet.
- **Route Table with an Internet Gateway:** A set of rules directing traffic within the VPC and to external networks, enabling public internet access via the Internet Gateway.
- **Security Group:** A virtual firewall for controlling inbound and outbound traffic, allowing SSH (port 22) and HTTP (port 80) access.
- **EC2 Instance (Amazon Linux 2):** A virtual server running within the public subnet, accessible via the internet for hosting applications.

---

## Table of Contents
1. [Initialize Terraform](#initialize-terraform)  
2. [Review the Plan](#review-the-plan)  
3. [Apply the Plan](#apply-the-plan)  
4. [Verify](#verify)  
5. [Cleanup](#cleanup)  
6. [Notes](#notes)  

---

## Initialize Terraform
```bash
cd envs/dev
terraform init
```
This downloads and configures the required Terraform providers.

---

## Review the Plan
```bash
terraform plan -var-file="terraform.tfvars"
```
Terraform will output the resources it plans to create.

---

## Apply the Plan
```bash
terraform apply -var-file="terraform.tfvars"
```
When prompted, type `yes` to confirm and create the resources.

---

## Verify
- Log in to your **AWS Console** and check the **EC2** section to see your running instance.  
- In the **VPC** section, verify the created VPC, Subnet, and Route Table.  
- Under **Security Groups**, confirm the group that allows SSH and HTTP.

---

## Cleanup
To delete all the resources created by this configuration:
```bash
terraform destroy
```
Type `yes` when prompted. This will remove the VPC, subnet, internet gateway, security group, and EC2 instance.

---

## Notes
- The **AMI** used in this configuration is region-specific. If you change the AWS region, make sure you use a valid AMI for that region.  
- In production, use more restrictive security group rules and separate public and private subnets.  
- For collaborative environments, use **Terraform remote state** stored in AWS S3 with DynamoDB for state locking.
- Provision an Amazon EC2 instance using Terraform, configuring security groups, key pairs, and IAM roles for secure access and resource management.
- Automate instance creation with user data scripts to initialize services, install dependencies, and configure the application environment upon launch.
- Implement a security-first approach by restricting inbound traffic with security groups and allowing only necessary ports (e.g., SSH and HTTP).
- Attach an Elastic IP to ensure a stable public address for accessing the application and maintaining consistent connectivity.
- Integrate AWS CloudWatch for real-time monitoring, logging, and setting up alarms to ensure optimal performance and security compliance.
- Enable Auto-Recovery and EBS Volume Snapshots to enhance fault tolerance and ensure data durability.
- Configured and deployed a Node.js backend and React.js frontend on the EC2 instance, with proper environment variables for secure operations.
- Optimize EC2 cost management by selecting appropriate instance types (t3.medium) and using auto-scaling policies for traffic spikes.


> **Happy Terraforming!**
