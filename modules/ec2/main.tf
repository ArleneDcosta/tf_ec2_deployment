
resource "aws_instance" "webapp_instance" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.ec2_key_name
  associate_public_ip_address = var.associate_public_ip

  tags = {
    Name        = "${var.environment}-WebAppInstance"
    Environment = var.environment
  }
}