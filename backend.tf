terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "ec2/terraform.tfstate"
    region         = var.aws_region
    encrypt        = true
  }
}
