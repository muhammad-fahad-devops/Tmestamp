provider "aws" {
  region = var.region
  profile = "fadi"
}

resource "aws_security_group" "bastion_sg" {
  name_prefix = "bastion_sg"
  description = "Security group for bastion host"
  vpc_id      = "vpc-004bd11407a58bdfd"  

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = "subnet-0ed23e5599a4868e0"  
  associate_public_ip_address = true
  security_groups             = [aws_security_group.bastion_sg.id]

  user_data = <<-EOF
            #!/bin/bash
            apt-get update -y
            apt-get install -y docker.io git
            systemctl start docker
            systemctl enable docker
            usermod -aG docker ubuntu
            cd /home/ubuntu
            git clone https://github.com/muhammad-fahad-devops/Tmestamp.git 
            cd Tmestamp/Python-app
            docker build -t datetime-api .
            docker run -d -p 80:8000 datetime-api
  EOF



  tags = {
    Name = "BastionHost"
  }
  depends_on = [aws_security_group.bastion_sg] 
}
