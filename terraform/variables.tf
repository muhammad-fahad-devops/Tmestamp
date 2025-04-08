# /terraform/variables.tf

variable "region" {
  description = "use-east-1"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0f9de6e2d2f067fca"  # us-east-1
}

variable "key_name" {
  description = "my-aws-key to creat an Ec2 as bastion host"
  type        = string
  default     = "myKey"  
}
