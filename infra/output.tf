output "instance_private_ip" {
  value       = aws_instance.ubuntu.private_ip
  description = "The private IP address of the main server instance."
}

output "instance_public_ip" {
  value       = aws_instance.ubuntu.public_ip
  description = "The public IP address of the main server instance."
}

output "instance_public_dns" {
  value       = aws_instance.ubuntu.public_dns
  description = "The public DNS of the main server instance."
}