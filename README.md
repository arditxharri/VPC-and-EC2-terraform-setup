TechOps Solutions is a fictional company that offers DevOps services. This guide walks through setting up a Virtual Private Cloud (VPC) and an EC2 instance using Terraform to host a web server on AWS.

# TechOps Solutions AWS Setup with Terraform

TechOps Solutions is a fictional company that offers DevOps services. This guide outlines the process for creating a Virtual Private Cloud (VPC) and an EC2 instance using Terraform to host a web server on AWS.

## Prerequisites

Before you begin, ensure you have the following:

1. **Terraform**: Install Terraform on your local machine. Download it from [Terraform's official website](https://www.terraform.io/downloads.html).

2. **AWS CLI**: Configure the AWS CLI with necessary credentials and permissions. Follow the [AWS CLI configuration guide](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) for setup instructions.

3. **AWS Account**: Access to an AWS account with permissions to create VPCs, EC2 instances, subnets, security groups, and other associated resources in the `eu-west-1` region.

## Objectives

This Terraform configuration achieves the following:

### 1. Set Up Terraform Configuration

- **Terraform Block**: Define the required versions of Terraform and the AWS provider to ensure compatibility and stability.

- **Provider Configuration**: Configure the AWS provider to use the `eu-west-1` region for resource creation.

### 2. Create a Virtual Private Cloud (VPC)

- **VPC Creation**: Establish a VPC named `TechOps_Solutions-VPC` with a CIDR block of `10.0.0.0/16`. This serves as the network boundary for all AWS resources, providing a secure and isolated network environment.

### 3. Define a Public Subnet

- **Subnet**: Create a public subnet within the VPC in the `eu-west-1a` availability zone. This subnet will host the EC2 instance and provide it with a public IP address for internet connectivity.

### 4. Set Up an Internet Gateway

- **Internet Gateway**: Attach an internet gateway to the VPC to enable internet access for resources within the VPC. This is essential for the EC2 instance to communicate with the outside world.

### 5. Create a Route Table and Associate it with the Subnet

- **Route Table**: Configure a route table to direct internet-bound traffic from the subnet to the internet gateway, allowing resources in the public subnet to reach the internet.

- **Route Table Association**: Associate the route table with the public subnet to ensure that traffic is correctly routed through the internet gateway.

### 6. Define Security Group Rules

- **Security Group**: Create a security group named `web_traffic` to manage inbound and outbound traffic rules. This security group will allow HTTP (port 80) and HTTPS (port 443) traffic, enabling web access to the EC2 instance.

- **Ingress Rules**: Configure rules to permit incoming HTTP and HTTPS traffic from any IP address, allowing users to access the web server hosted on the EC2 instance.

### 7. Launch an EC2 Instance

- **EC2 Instance**: Deploy an EC2 instance using the Amazon Linux AMI. The instance will be launched in the public subnet, associated with a public IP address, and secured by the `web_traffic` security group. This instance will run an NginX web server, serving as the entry point for web traffic.

### 8. Tags and Management

- **Resource Tagging**: Apply consistent tags across all resources for easy identification and management. Tags include the name of the resource, the manager (`Terraform`), and the project name.

- **Lifecycle Policies**: Implement lifecycle policies to manage resource creation and destruction, ensuring that resources are provisioned and deprovisioned smoothly.

## Conclusion

This guide provides an overview of the Terraform configuration for setting up a basic web hosting environment on AWS. It establishes a secure and scalable infrastructure, demonstrating best practices in resource management and network design.
