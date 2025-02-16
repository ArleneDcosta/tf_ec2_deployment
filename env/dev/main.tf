provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr   = var.public_subnet_cidr
  availability_zone    = var.availability_zone
  authorized_networks  = var.authorized_networks
  internal_networks    = var.internal_networks
  environment          = "dev"
}

module "ec2" {
  source               = "../../modules/ec2"
  ec2_instance_type    = var.ec2_instance_type
  ec2_key_name         = var.ec2_key_name
  security_group_id    = module.vpc.security_group_id
  subnet_id            = module.vpc.public_subnet_id
  associate_public_ip  = true
  environment          = "dev"
}