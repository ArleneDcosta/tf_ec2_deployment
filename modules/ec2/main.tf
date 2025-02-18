resource "aws_eip" "ec2_eip" {
  instance = aws_instance.webapp_instance.id
  domain   = "vpc"

  tags = {
    Name        = "${var.environment}-EC2-EIP"
    Environment = var.environment
  }
}

resource "aws_instance" "webapp_instance" {
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.ec2_key_name
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo mkdir -p /var/www/myapp
              sudo tee /etc/nginx/sites-available/myapp <<EOL
              server {
                listen 80;
                server_name _;

                root /var/www/myapp;

                # Serve Static Files
                location /static/ {
                    alias /var/www/myapp/static/;
                }

                # SPA Fallback (React Routing)
                location / {
                    index index.html;
                    try_files $uri /index.html;
                }

                # Cache Static Assets for Performance
                location ~* \.(?:ico|css|js|gif|jpe?g|png|woff2?|eot|ttf|svg)$ {
                    expires 6M;
                    access_log off;
                    add_header Cache-Control "public, max-age=15552000, immutable";
                }

                # Compression for Faster Loading
                gzip on;
                gzip_types text/css application/javascript image/svg+xml;
                gzip_min_length 256;
                }

                    EOL
                    sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/
                    sudo systemctl restart nginx
                    EOF

  tags = {
    Name        = "${var.environment}-WebAppInstance"
    Environment = var.environment
  }
}