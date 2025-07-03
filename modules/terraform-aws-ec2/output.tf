output "instance_id" {
  description = "ID of the created instance"
  value       = aws_instance.main.id
}

output "instance_public_ip" {
  description = "Public IP of the created instance"
  value       = aws_instance.main.public_ip
}