output "instance_id" {
  value = aws_instance.webapp_instance.id
}

output "private_ip" {
  value = aws_instance.webapp_instance.private_ip
}

output "ec2_public_ip" {
  value = aws_eip.ec2_eip.public_ip
}
