provider "aws" {
  region = "ap-southeast-1"
}

module "vpc" {
  source = "./vpc"

  vpc_cidr_block    = "10.0.0.0/16"
  private_subnet    = ["10.0.1.0/24"]
  public_subnet     = ["10.0.2.0/24"]
  availability_zone = ["ap-southeast-1a"]
}

module "ec2_ubuntu" {
  source            = "./ec2"
  instance_count    = 3
  instance_type     = var.instance_type
  key_name          = aws_key_pair.default.key_name
  subnet_id         = var.public_subnet_id
  security_group_id = var.security_group_id
  name_prefix       = "ubuntu"
}