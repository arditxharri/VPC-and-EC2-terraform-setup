# TechOps Solutions is a fictionary company created by me, that offers DevOps services

resource "aws_instance" "web01" {
# Amazon Linux AMI ID: ami-0932dacac40965a65
# Bitnapi NGINX AMI ID: ami-0d261f2302e96a5ac
  ami                         = "ami-0932dacac40965a65"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_eu-west-1a.id
  vpc_security_group_ids      = [aws_security_group.allow_http.id]

  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp3"
  }

  tags = {
    Name      = "NginX VM01"
    ManagedBy = "Terraform"
    Project   = "VPC-and-EC2-setup-via-Terraform"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "allow_http" {
  description = "Allow HTTP and HTTPS traffic"
  name        = "web_traffic"
  vpc_id      = aws_vpc.TechOps_Solutions.id
}

resource "aws_vpc_security_group_ingress_rule" "http_in" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "80"
  to_port        = "80"
  ip_protocol    = "tcp"
}
resource "aws_vpc_security_group_ingress_rule" "https_in" {
  security_group_id = aws_security_group.allow_http.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = "443"
  to_port        = "443"
  ip_protocol    = "tcp"
}

