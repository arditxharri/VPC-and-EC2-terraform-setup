resource "aws_vpc" "TechOps_Solutions" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name      = "TechOps_Solutions-VPC"
    ManagedBy = "Terraform"
    Project   = "VPC-and-EC2-setup-via-Terraform"
  }
}

resource "aws_subnet" "public_eu-west-1a" {
  vpc_id     = aws_vpc.TechOps_Solutions.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name      = "Public Subnet eu-west-1a"
    ManagedBy = "Terraform"
    Project   = "VPC-and-EC2-setup-via-Terraform"
  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.TechOps_Solutions.id
  tags = {
    Name      = "Internet Gateway"
    ManagedBy = "Terraform"
    Project   = "VPC-and-EC2-setup-via-Terraform"
  }
}

resource "aws_route_table" "TechOps_Solutions_route_table" {
  vpc_id = aws_vpc.TechOps_Solutions.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name      = "Route Table"
    ManagedBy = "Terraform"
    Project   = "VPC-and-EC2-setup-via-Terraform"
  }
}

resource "aws_route_table_association" "public" {

  subnet_id      = aws_subnet.public_eu-west-1a.id
  route_table_id = aws_route_table.TechOps_Solutions_route_table.id
}