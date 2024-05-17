terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
}

provider "aws" {
  profile = "pedrorequiao"
}

module "ec2_key_pair" {
  source                  = "../modules/key-pair"
  ec2_ssh_key_name        = var.ec2_ssh_key_name
  ec2_ssh_public_key_path = var.ec2_ssh_public_key_path
}

module "vpc" {
  source = "../modules/vpc"
}

module "public_subnet" {
  source = "../modules/public-subnet"

  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id
}

module "ec2_security_group" {
  source                         = "../modules/security-group"
  ec2_security_group_name        = var.ec2_security_group_name
  ec2_security_group_description = var.ec2_security_group_description
  vpc_id                         = module.vpc.vpc_id

  tag_name = var.ec2_security_group_name
}

module "ec2_1" {
  source = "../modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_1_id
  security_group_id = module.ec2_security_group.security_group_id

  key_name = module.ec2_key_pair.key_name
}

module "ec2_2" {
  source = "../modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_2_id
  security_group_id = module.ec2_security_group.security_group_id

  key_name = module.ec2_key_pair.key_name
}

module "ec2_3" {
  source = "../modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_3_id
  security_group_id = module.ec2_security_group.security_group_id

  key_name = module.ec2_key_pair.key_name
}
