# Terraform-modules-project
 ![image](https://github.com/user-attachments/assets/b9ce2b3a-74c6-4d42-bccb-b9d592222eb2)

This project creates a basic AWS infrastructure using Terraform, including a VPC, public subnet, internet gateway, route table, and an EC2 instance.

 `vpc` module:
  - Creates a VPC
  - Creates a public subnet
  - Sets up an internet gateway
  - Creates a route table and associates it with the subnet

- `ec2` module:
  - Launches an EC2 instance inside the public subnet
  - Attaches a security group to allow access

## 🗺️ Architecture

The architecture includes:
- `aws_vpc.main`: Main Virtual Private Cloud
- `aws_subnet.public`: Public subnet inside the VPC
- `aws_internet_gateway.main`: Allows internet access
- `aws_route_table.main_pbl`: Route table with a default route to the internet
- `aws_route_table_association.main_pbl_route_association`: Associates the route table with the public subnet
- `aws_instance.main`: EC2 instance running in the public subnet
- `aws_security_group.ec2_sg`: Security group attached to the EC2 instance
