variable "vpc_cidr" {}
variable "public_subnet_cidr" {}
variable "availability_zone" {}
variable "authorized_networks" { type = list(string) }
variable "internal_networks" { type = list(string) }
variable "environment" {}