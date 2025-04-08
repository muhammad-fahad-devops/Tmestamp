# /terraform/main.tf

provider "aws" {
  region = var.region
}

resource "aws_security_group" "bastion_sg" {
  name_prefix = "bastion_sg"
  description = "Security group for bastion host"
  vpc_id      = "vpc-004bd11407a58bdfd"  # Replace with your VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Restrict this to your IP for security
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = var.key_name
  security_groups = [aws_security_group.bastion_sg.name]
  subnet_id       = "subnet-0ed23e5599a4868e0"  # Replace with your public subnet ID
  associate_public_ip_address = true
  tags = {
    Name = "BastionHost"
  }
}
