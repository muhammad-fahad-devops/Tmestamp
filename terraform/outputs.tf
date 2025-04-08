output "bastion_public_ip" {
  description = "Public IP of the Bastion EC2 instance"
  value       = aws_instance.bastion.public_ip
}

output "app_url" {
  description = "URL to access the Timestamp API"
  value       = "http://${aws_instance.bastion.public_ip}:8000"
}
