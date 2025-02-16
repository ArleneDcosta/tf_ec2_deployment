output "instance_id" {
  value = aws_instance.webapp_instance.id
}

output "public_ip" {
  value = aws_instance.webapp_instance.public_ip
}

output "private_ip" {
  value = aws_instance.webapp_instance.private_ip
}
