vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
availability_zone   = "us-west-2a"
authorized_networks = ["0.0.0.0/0"]
internal_networks   = ["10.0.0.0/16"]

ec2_instance_type = "t3.micro"
ec2_key_name      = "my-dev-key"